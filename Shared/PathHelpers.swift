import CoreGraphics

/// Returns a new path.
public func pathAtPoint(point: CGPoint) -> CGPath {
  let mutablePath = CGPathCreateMutable()
  CGPathMoveToPoint(mutablePath, nil, point.x, point.y)
  return CGPathCreateCopy(mutablePath)
}

