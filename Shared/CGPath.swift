import CoreGraphics

public extension CGPath {
  /// Returns a mutable copy of the path.
  ///
  /// :returns: A new, mutable, copy of the path.
  public var mutablePath: CGMutablePath {
    return CGPathCreateMutableCopy(self)
  }

  /// Returns the current point in the path.
  ///
  /// :returns: The current point in the path.
  public var currentPoint: CGPoint {
    return CGPathGetCurrentPoint(self)
  }
}

