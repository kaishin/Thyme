import AppKit
import Thyme

@IBDesignable
class CustomView: NSView {
  override func drawRect(dirtyRect: NSRect) {
    let shapeCount = 3
    var currentAngle: Double = 0.0

    while (currentAngle <= 360) {
      drawInCurrentContext { context in
        let inset = CGFloat(60.0)
        let rectSize = CGRectInset(dirtyRect, inset, inset).size
        context.setFillColor(NSColor.purpleColor().colorWithAlphaComponent(0.5).CGColor)
        currentAngle = currentAngle + Double(360 / shapeCount)
        context.rotate(pivot: self.center, angle: currentAngle)
        context.fillRect(CGRect(origin: CGPoint(x: inset, y: inset), size: rectSize))
      }
    }
  }
}
