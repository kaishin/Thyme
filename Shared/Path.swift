import CoreGraphics

public struct Path {
  /// The last point in the path.
  public let currentPoint: CGPoint

  /// A list of path actions.
  public let actions: [PathAction]

  /// Instantiates a path with a point and a list of actions.
  public init(point: CGPoint, pathActions: [PathAction]) {
    currentPoint = point
    actions = pathActions
  }

  /// Instantiates a path with a point.
  public init(point: CGPoint) {
    currentPoint = point
    actions = [.move(point)]
  }
}

public extension Path {
  /// A computed CGPath property created from the path.
  var CGPath: CGPathRef {
    get {
      var mutablePath = CGPathCreateMutable()

      for action in actions {
        switch action {
        case .move(let point):
          mutablePath.moveToPoint(point)
        case .addLine(let point):
          mutablePath.addLineToPoint(point)
        case .close():
          mutablePath.close()
        }
      }

      return mutablePath
    }
  }
}

public extension Path {
  /// Flips a path vertically along an axis with a given Y value.
  ///
  /// :param: axisY The Y coordinate of the symmetry axis.
  ///
  /// :returns: A new path flipped vertically alongside the given Y axis.
  public func flipVertically(axisY: CGFloat) -> Path {
    let flippedPoint = currentPoint.flipVertically(axisY)
    let flippedActions = actions.map { $0.flipVertically(axisY) }
    return Path(point: flippedPoint, pathActions: flippedActions)
  }

  /// Flips a path horizontally along an axis with a given X value.
  ///
  /// :param: axisX The X coordinate of the symmetry axis.
  ///
  /// :returns: A new path flipped horizontally alongside the given X axis.
  public func flipHorizontally(axisX: CGFloat) -> Path {
    let flippedPoint = currentPoint.flipHorizontally(axisX)
    let flippedActions = actions.map { $0.flipHorizontally(axisX) }
    return Path(point: flippedPoint, pathActions: flippedActions)
  }
}
