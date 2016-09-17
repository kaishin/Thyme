import CoreGraphics

public extension CGContext {
  /// Rotates the context by a given angle around a pivot point.
  ///
  /// - parameter pivot: A pivot point in the user space coordinates around which the context will rotate.
  /// - parameter angle: The angle, in degrees, by which to rotate the coordinate space of the context.
  public func rotate(around pivot: CGPoint, by angle: Double) {
    self.translateBy(x: pivot.x, y: pivot.y);
    self.rotate(by: CGFloat(degreesToRadians(angle)));
    self.translateBy(x: -pivot.x, y: -pivot.y);
  }

  /// Rotates the context clockwise, regardless of the platform, by a given angle around a pivot point.
  ///
  /// - parameter pivot: A pivot point in the user space coordinates around which the context will rotate.
  /// - parameter angle: The angle, in degrees, by which to rotate the coordinate space of the context. Positive values will rotate the context clockwise.
  public func rotateClockwise(around pivot: CGPoint, by angle: Double) {
    executeOn(iOS: {
      self.rotate(around: pivot, by: angle)
    }, mac: {
      self.rotate(around: pivot, by: -angle)
    })
  }

  /// Executes a drawing code block in the context.
  ///
  /// - parameter drawingBlock: The drawing block to execute in the context.
  public func draw(_ drawingBlock: DrawingBlock) {
    self.saveGState()
    drawingBlock(self)
    self.restoreGState()
  }
}
