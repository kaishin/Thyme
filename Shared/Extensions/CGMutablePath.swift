import CoreGraphics

extension CGMutablePath {
  /// Closes and completes a subpath in the mutable path.
  func close() {
    CGPathCloseSubpath(self)
  }

  /// Appends a line segment to the mutable path.
  ///
  /// - parameter point: The end point of the line.
  func addLineToPoint(point: CGPoint) {
    CGPathAddLineToPoint(self, nil, point.x, point.y)
  }

  /// Starts a new subpath at a specified location in the mutable path.
  ///
  /// - parameter point: The point of the new location.
  func moveToPoint(point: CGPoint) {
    CGPathMoveToPoint(self, nil, point.x, point.y)
  }

  /// Appends a curve to the mutable path.
  ///
  /// - parameter firstControlPoint: The first control point of the curve.
  /// - parameter secondControlPoint: The second control point of the curve.
  /// - parameter endPoint: The end point of the curve.
  func addCurveToPoint(firstControlPoint pointOne: CGPoint, secondControlPoint pointTwo: CGPoint, endPoint: CGPoint) {
    CGPathAddCurveToPoint(self, nil, pointOne.x, pointOne.y, pointTwo.x, pointTwo.y, endPoint.x, endPoint.y)
  }
}
