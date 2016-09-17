import CoreGraphics

/// Various path actions that are used to create a path. Possible values: `move(CGPoint)`, `addLine(CGPoint)`, and `close`.
public enum PathAction {
  case move(CGPoint)
  case addLine(CGPoint)
  case close
}

extension PathAction {
  /// Flips an action vertically along an axis with a given Y value.
  ///
  /// - parameter axisY: The Y coordinate of the symmetry axis.
  ///
  /// - returns: A new action flipped vertically alongside the given Y axis.
  func flipVertically(by axisY: CGFloat) -> PathAction {
    switch self {
    case let .move(destinationPoint):
      return .move(destinationPoint.flipVertically(by: axisY))
    case let .addLine(destinationPoint):
      return .addLine(destinationPoint.flipVertically(by: axisY))
    case .close:
      return .close
    }
  }

  /// Flips an action horizontally along an axis with a given X value.
  ///
  /// - parameter axisX: The X coordinate of the symmetry axis.
  ///
  /// - returns: A new action flipped horizontally alongside the given X axis.
  func flipHorizontally(by axisX: CGFloat) -> PathAction {
    switch self {
    case let .move(destinationPoint):
      return .move(destinationPoint.flipHorizontally(by: axisX))
    case let .addLine(destinationPoint):
      return .addLine(destinationPoint.flipHorizontally(by: axisX))
    case .close:
      return .close
    }
  }
}
