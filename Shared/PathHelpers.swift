import CoreGraphics

/// Concatenate two paths together.
public func + (lhp: Path, rhp: Path) -> Path {
  let actions = lhp.actions + rhp.actions
  return Path(point: rhp.currentPoint, pathActions: actions)
}

/// Concatenate two paths together.
///
/// - parameter lhp: Left hand path.
/// - parameter rhp: Right hand path.
///
/// - returns: A new path.
public func concat(_ lhp: Path, _ rhp: Path) -> Path {
  return lhp + rhp
}
