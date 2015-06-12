import CoreGraphics

public extension CGPath {
  public var mutablePath: CGMutablePathRef {
    return CGPathCreateMutableCopy(self)
  }

  public var currentPoint: CGPoint {
    return CGPathGetCurrentPoint(self)
  }

  public static func startPathAtPoint(point: CGPoint) -> CGPath {
    let mutablePath = CGPathCreateMutable()
    CGPathMoveToPoint(mutablePath, nil, point.x, point.y)
    return CGPathCreateCopy(mutablePath)
  }

  public func close() -> CGPathRef {
    CGPathCloseSubpath(mutablePath)
    return CGPathCreateCopy(mutablePath)
  }
}
