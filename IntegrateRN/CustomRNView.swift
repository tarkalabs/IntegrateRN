import UIKit
import React
import SnapKit

@objc(CustomRNView)
class CustomRNView : UIView {
  
  var lblMessage:UILabel!
  
  override init(frame: CGRect) {
    print("Custom view created")
    super.init(frame: frame)
    self.frame = frame
    
    lblMessage = UILabel()
    lblMessage.text = "initial message"
    self.addSubview(lblMessage)
    lblMessage.snp_makeConstraints { make in
      make.top.equalTo(self.snp_top).offset(8)
      make.left.equalTo(self.snp_left).offset(8)
    }
  }

  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  func setMessage(message: NSString) {
    print("custom message set to \(message)")
    lblMessage.text = "\(message) Swifted"
  }
}