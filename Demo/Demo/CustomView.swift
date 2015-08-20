import UIKit
import Thyme

@IBDesignable
class CustomView: UIView {
  override func drawRect(rect: CGRect) {
    drawInCurrentContext { context in
      let colorOne = UIColor(hue: 0.994, saturation: 0.758, brightness: 0.764, alpha: 0.6).CGColor
      let colorTwo = UIColor(hue: 0.589, saturation: 0.485, brightness: 0.792, alpha: 0.8).CGColor
      drawIcon(context, rect: self.bounds, fillColor: colorOne, otherFillColor: colorTwo)
    }
  }
}
