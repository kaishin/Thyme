import CoreGraphics

extension CGMutablePath {
  /// Closes and completes a subpath in the mutable path.
  func close() {
    CGPathCloseSubpath(self)
  }

  /// Appends a line segment to the mutable path.
  ///
  /// :param: point The end point of the line.
  func addLineToPoint(point: CGPoint) {
    CGPathAddLineToPoint(self, nil, point.x, point.y)
  }

  /// Starts a new subpath at a specified location in the mutable path.
  ///
  /// :param: point The point of the new location.
  func moveToPoint(point: CGPoint) {
    CGPathMoveToPoint(self, nil, point.x, point.y)
  }
}
