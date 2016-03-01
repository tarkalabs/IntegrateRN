//
//  ViewController.swift
//  IntegrateRN
//
//  Created by Vagmi Mudumbai on 01/03/16.
//  Copyright © 2016 Vagmi Mudumbai. All rights reserved.
//

import UIKit
import React
import SnapKit

class ViewController: UIViewController {
  var rootView:RCTRootView!
  override func viewDidLoad() {
    super.viewDidLoad()
    let button = UIButton(type: .System)
    button.setTitle("Refresh", forState: .Normal)
    button.addTarget(self, action: "reload", forControlEvents: .TouchUpInside)
    view.addSubview(button)
    
    button.snp_makeConstraints { make in
      make.top.equalTo(view.snp_top).offset(20)
      make.left.equalTo(view.snp_left)
    }
    let codeLocation = NSURL(string: "http://localhost:8081/index.ios.bundle?platform=ios")!
    rootView = RCTRootView(bundleURL: codeLocation, moduleName: "SimpleApp", initialProperties: nil, launchOptions: nil)

    self.edgesForExtendedLayout = .None
    view.addSubview(rootView)
    rootView.snp_makeConstraints { make in
      make.top.equalTo(button.snp_bottom).offset(8)
      make.left.equalTo(view.snp_left)
      make.right.equalTo(view.snp_right)
      make.bottom.equalTo(view.snp_bottom)
    }
  }

  func reload() {
    rootView.bridge.reload()
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }


}

