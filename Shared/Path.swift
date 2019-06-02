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
  var cgPath: CGPath {
    get {
      let mutablePath = CGMutablePath()

      for action in actions {
        switch action {
        case .move(let point):
          mutablePath.move(to: point)
        case .addLine(let point):
          mutablePath.addLine(to: point)
        case .close:
          mutablePath.closeSubpath()
        }
      }

      return mutablePath
    }
  }
}

public extension Path {
  /// Flips a path vertically along an axis with a given Y value.
  ///
  /// - parameter axisY: The Y coordinate of the symmetry axis.
  ///
  /// - returns: A new path flipped vertically alongside the given Y axis.
  func flipVertically(by axisY: CGFloat) -> Path {
    let flippedPoint = currentPoint.flipVertically(by: axisY)
    let flippedActions = actions.map { $0.flipVertically(by: axisY) }
    return Path(point: flippedPoint, pathActions: flippedActions)
  }

  /// Flips a path horizontally along an axis with a given X value.
  ///
  /// - parameter axisX: The X coordinate of the symmetry axis.
  ///
  /// - returns: A new path flipped horizontally alongside the given X axis.
  func flipHorizontally(by axisX: CGFloat) -> Path {
    let flippedPoint = currentPoint.flipHorizontally(by: axisX)
    let flippedActions = actions.map { $0.flipHorizontally(by: axisX) }
    return Path(point: flippedPoint, pathActions: flippedActions)
  }
}

public extension Path {
  /// Returns a new path moved to a given a point.
  ///
  /// - parameter point: The point to move to.
  ///
  /// - returns: A new path moved to the given point.
  func move(to point: CGPoint) -> Path {
    return Path(point: point, pathActions: actions + [.move(point)])
  }

  /// Returns a new path after adding a line to a given point in an existing path.
  ///
  /// - parameter point: The end point of the line.
  ///
  /// - returns: A new path with a new line added to it.
  func addLine(to point: CGPoint) -> Path {
    return Path(point: point, pathActions: actions + [.addLine(point)])
  }


  /// Returns a new path after closing the existing path.
  ///  ///
  /// - returns: A new closed path.
  func close() -> Path {
    return Path(point: currentPoint, pathActions: actions + [.close])
  }

  /// Returns a new path after adding a line towards a given platform-agnostic direction in the existing path.
  ///
  /// - parameter directions: A dictionary containing one or more `Direction` as keys, and delta distance as values. The path will be moved  by the delta distance towards the corresponding value.
  ///
  /// - returns: A new path with a new line added to it.
  func addLine(towards directions: [Direction: Float]) -> Path {
    var destinationPoint = currentPoint
    for (direction, delta) in directions {
      switch direction {
      case .top:
        executeOn(iOS: {
          destinationPoint.y -= CGFloat(delta)
        }, mac: {
          destinationPoint.y += CGFloat(delta)
        })
      case .right:
        destinationPoint.x += CGFloat(delta)
      case .bottom:
        executeOn(iOS: {
          destinationPoint.y += CGFloat(delta)
        }, mac: {
          destinationPoint.y -= CGFloat(delta)
        })
      case .left:
        destinationPoint.x -= CGFloat(delta)
      }
    }

    return Path(point: destinationPoint, pathActions: actions + [.addLine(destinationPoint)])
  }
}
