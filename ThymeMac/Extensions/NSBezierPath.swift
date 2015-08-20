import Quartz

public extension NSBezierPath {
  /// Returns `CGPath` equivalent.
  public var CGPath: CGPathRef {
    get { return transformToCGPath() }
  }

  /// Transforms the bezier path to a `CGPath`
  ///
  /// - returns: A `CGPath` transformed from the bezier path instance.
  private func transformToCGPath() -> CGPathRef {
    let path = CGPathCreateMutable()
    if elementCount < 1 { return path }

    let points = UnsafeMutablePointer<NSPoint>.alloc(3)
    var didClosePath = true
    
    for index in 0..<elementCount {
      let pathType = elementAtIndex(index, associatedPoints: points)
      
      switch pathType {
      case .MoveToBezierPathElement:
        path.moveToPoint(points[0])
      case .LineToBezierPathElement:
        path.addLineToPoint(points[0])
        didClosePath = false
      case .CurveToBezierPathElement:
        path.addCurveToPoint(firstControlPoint: points[0], secondControlPoint: points[1], endPoint: points[2])
        didClosePath = false
      case .ClosePathBezierPathElement:
        path.close()
        didClosePath = true
      }
    }

    if !didClosePath { path.close() }
    points.dealloc(3)
    return path
  }

  /// Fills a path with a given color.
  ///
  /// - parameter color: The color to use for filling the path.
  func fill(color color: NSColor) {
    color.setFill()
    self.fill()
    NSColor.clearColor().setFill()
  }
}
