import CoreGraphics

public extension CGRect {
  /// Instantiates a rect using a center point instead of an origin.
  public init(center: CGPoint, size: CGSize) {
    self.size = size
    self.origin = CGPoint(x: center.x - (size.width / 2), y: center.y - (size.height / 2))
  }
}
