import AppKit

extension NSGraphicsContext {
  /// Returns the current graphics context as a `CGContext`.
  public static var current: CGContextRef? {
    return currentContext()?.CGContext
  }
}
