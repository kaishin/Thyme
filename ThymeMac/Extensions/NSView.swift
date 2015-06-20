import AppKit

extension NSView {
  public var center: CGPoint {
    get {
      return CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame))
    }
  }
}
