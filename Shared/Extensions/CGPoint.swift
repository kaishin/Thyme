import CoreGraphics

extension CGPoint {
  /// Flips a point vertically along an axis with a given Y value.
  ///
  /// - parameter axisY: The Y coordinate of the symmetry axis.
  ///
  /// - returns: A new point flipped vertically alongside the given Y axis.
  func flipVertically(by axisY: CGFloat) -> CGPoint {
    return CGPoint(x: x, y: (2 * axisY) - y)
  }

  /// Flips a point horizontally along an axis with a given X value.
  ///
  /// - parameter axisX: The X coordinate of the symmetry axis.
  ///
  /// - returns: A new point flipped horizontally alongside the given X axis.
  func flipHorizontally(by axisX: CGFloat) -> CGPoint {
    return CGPoint(x: (2 * axisX) - x, y: y)
  }
}
