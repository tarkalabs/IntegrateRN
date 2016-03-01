import React

@objc(CustomRNViewManager)
class CustomRNViewManager : RCTViewManager {
  override func view() -> UIView! {
    return CustomRNView()
  }
}