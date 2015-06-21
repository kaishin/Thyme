import CoreGraphics

/// Returns a new path moved to a given a point.
///
/// :param: point The point to move to.
/// :param: path The original path.
///
/// :returns: A new path moved to the given point.
public func moveTo(point: CGPoint)(path: Path) -> Path {
  return Path(point: point, pathActions: appendAction(path.actions, .move(point)))
}

/// Returns a new path after adding a line to a given point in an existing path.
///
/// :param: point The end point of the line.
/// :param: path The original path.
///
/// :returns: A new path with a new line added to it.
public func addLineTo(point: CGPoint)(path: Path) -> Path {
  return Path(point: point, pathActions: appendAction(path.actions, .addLine(point)))
}

/// Returns a new path after closing an existing path.
///
/// :param: path The original path.
///
/// :returns: A new closed path.
public func close(path: Path) -> Path {
  return Path(point: path.currentPoint, pathActions: appendAction(path.actions, .close))
}

/// Returns a new path after adding a line towards a given platform-agnostic direction in an existing path.
///
/// :param: directions A dictionary containing one or more `Direction` as keys, and delta distance as values. The path will be moved  by the delta distance towards the corresponding value.
/// :param: path The original path.
///
/// :returns: A new path with a new line added to it.
public func addLineTowards(directions: [Direction: Float])(path: Path) -> Path {
  let currentPoint = path.currentPoint
  var destinationPoint = currentPoint
  var actions = path.actions

  for (direction, delta) in directions {
    switch direction {
    case .Top:
      executeOn(iOS: {
        destinationPoint.y -= CGFloat(delta)
      }, mac: {
        destinationPoint.y += CGFloat(delta)
      })
    case .Right:
      destinationPoint.x += CGFloat(delta)
    case .Bottom:
      executeOn(iOS: {
        destinationPoint.y += CGFloat(delta)
      }, mac: {
        destinationPoint.y -= CGFloat(delta)
      })
    case .Left:
      destinationPoint.x -= CGFloat(delta)
    }
  }

  actions.append(.addLine(destinationPoint))
  return Path(point: destinationPoint, pathActions: actions)
}

/// Concatenate two paths together.
public func + (lhp: Path, rhp: Path) -> Path {
  let actions = lhp.actions + rhp.actions
  return Path(point: rhp.currentPoint, pathActions: actions)
}

/// Concatenate two paths together.
///
/// :param: lhp Left hand path.
/// :param: rhp Right hand path.
///
/// :returns: A new path.
public func concat(lhp: Path)(rhp: Path) -> Path {
  return lhp + rhp
}

/// Appends a path action to an existing action array.
///
/// :param: actions The original action array.
/// :param: newAction The path action to append.
///
/// :returns: A new path action array with the newly added value.
private func appendAction(actions: [PathAction], newAction: PathAction) -> [PathAction] {
  var mutableActions = actions
  mutableActions.append(newAction)
  return mutableActions
}
