import AppKit

extension NSGraphicsContext {
  /// The optional current graphics context as a `CGContext`.
  public static var current: CGContext? {
    return current()?.cgContext
  }
}
