import UIKit
import Thyme

@IBDesignable
class CustomView: UIView {
  override func drawRect(rect: CGRect) {
    let shapeCount = 3
    var currentAngle: Double = 0.0

    while (currentAngle <= 360) {
      drawInCurrentContext { context in
        let inset = CGFloat(60.0)
        let rectSize = CGRectInset(rect, inset, inset).size
        context.setFillColor(UIColor.purpleColor().colorWithAlphaComponent(0.5).CGColor)
        currentAngle = currentAngle + Double(360 / shapeCount)
        context.rotate(pivot: self.center, angle: currentAngle)
        context.fillRect(CGRect(origin: CGPoint(x: inset, y: inset), size: rectSize))
      }
    }
  }
}
