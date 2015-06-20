import AppKit

extension NSView {
  public var center: CGPoint {
    get {
      return CGPoint(x: NSMidX(bounds), y: NSMidY(bounds))
    }
  }
}
