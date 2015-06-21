import CoreGraphics

/// Various path actions that are used to create a path. Possible values: `move(CGPoint)`, `addLine(CGPoint)`, and `close`.
public enum PathAction {
  case Move(CGPoint)
  case AddLine(CGPoint)
  case Close
}

extension PathAction {
  /// Flips an action vertically along an axis with a given Y value.
  ///
  /// :param: axisY The Y coordinate of the symmetry axis.
  ///
  /// :returns: A new action flipped vertically alongside the given Y axis.
  func flipVertically(axisY: CGFloat) -> PathAction {
    switch self {
    case let .Move(destinationPoint):
      return .Move(destinationPoint.flipVertically(axisY))
    case let .AddLine(destinationPoint):
      return .AddLine(destinationPoint.flipVertically(axisY))
    case .Close:
      return .Close
    }
  }

  /// Flips an action horizontally along an axis with a given X value.
  ///
  /// :param: axisX The X coordinate of the symmetry axis.
  ///
  /// :returns: A new action flipped horizontally alongside the given X axis.
  func flipHorizontally(axisX: CGFloat) -> PathAction {
    switch self {
    case let .Move(destinationPoint):
      return .Move(destinationPoint.flipHorizontally(axisX))
    case let .AddLine(destinationPoint):
      return .AddLine(destinationPoint.flipHorizontally(axisX))
    case .Close:
      return .Close
    }
  }
}
