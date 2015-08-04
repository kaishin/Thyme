import AppKit

extension NSView {
  /// The center of the frame.
  public var center: CGPoint {
    get {
      return bounds.center
    }
  }
}
