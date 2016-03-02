import UIKit
import React
import SnapKit
import Alamofire

class ViewController: UIViewController {
  
  static let CODE_URL =  "https://5b2cb626.ngrok.com/index.ios.bundle?platform=ios"
  // or where ever you are serving the bundle from
  
  var rootView:RCTRootView!
  var button:UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.edgesForExtendedLayout = .None
    
    button = UIButton(type: .System)
    button.setTitle("Refresh", forState: .Normal)
    button.addTarget(self, action: "reload", forControlEvents: .TouchUpInside)
    view.addSubview(button)
    
    button.snp_makeConstraints { make in
      make.top.equalTo(view.snp_top).offset(20)
      make.left.equalTo(view.snp_left)
    }
    let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
    let codePath = paths[0] + "/code.js"
    if(NSFileManager.defaultManager().fileExistsAtPath(codePath)) {
      loadReactView(codePath)
    } else {
      saveCodePath { self.loadReactView(codePath) }
    }
  }
  
  func loadReactView(codePath: String) {
    rootView = RCTRootView(bundleURL: NSURL(fileURLWithPath: codePath), moduleName: "SimpleApp", initialProperties: nil, launchOptions: nil)
    view.addSubview(rootView)
    rootView.snp_makeConstraints { make in
      make.top.equalTo(self.button.snp_bottom).offset(8)
      make.left.equalTo(view.snp_left)
      make.right.equalTo(view.snp_right)
      make.bottom.equalTo(view.snp_bottom)
    }
  }
  
  func reload() {
    saveCodePath { self.rootView.bridge.reload() }
  }
  
  func saveCodePath(completionHandler: ()->Void) {
    download(Method.GET, ViewController.CODE_URL) { (_,_) in
      let docDirURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
      let codeURL = docDirURL.URLByAppendingPathComponent("code.js")
      // delete file if exists
      try? NSFileManager.defaultManager().removeItemAtURL(codeURL)
      return codeURL
      }.response { (_,_,_,err) in
        if let error = err {
          NSLog("encountered an error \(error)")
        } else {
          completionHandler()
        }
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}

