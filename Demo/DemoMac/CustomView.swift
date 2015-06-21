import AppKit
import Thyme

@IBDesignable
class CustomView: NSView {
  override func drawRect(dirtyRect: NSRect) {
    drawInCurrentContext { context in
      let colorOne = NSColor(hue: 0.994, saturation: 0.758, brightness: 0.764, alpha: 0.6).CGColor
      let colorTwo = NSColor(hue: 0.589, saturation: 0.485, brightness: 0.792, alpha: 0.8).CGColor
      drawIcon(context, self.bounds, colorOne, colorTwo)
    }
  }
}
