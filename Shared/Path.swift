import CoreGraphics

/// Various path actions that are used to create a path. Possible values: `move(CGPoint)`, `addLine(CGPoint)`, and `close`.
public enum PathAction {
  case move(CGPoint)
  case addLine(CGPoint)
  case close
}

public struct Path {
  /// The last point in the path.
  public let currentPoint: CGPoint

  /// A list of path actions.
  public let actions: [PathAction]

  /// Instantiates a path with a point a list of actions.
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
