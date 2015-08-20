import CoreGraphics

public extension CGContext {
  /// Sets the current fill color of the context.
  ///
  /// - parameter color: The new fill color.
  public func setFillColor(color: CGColor) {
    CGContextSetFillColorWithColor(self, color)
  }

  /// Sets the current stroke color of the context.
  ///
  /// - parameter color: The new stroke color.
  public func setStrokeColor(color: CGColor) {
    CGContextSetStrokeColorWithColor(self, color)
  }

  /// Sets the line width of the context.
  ///
  /// - parameter width: The width value in resolution-independent points.
  public func setLineWidth(width: Float) {
    CGContextSetLineWidth(self, CGFloat(width))
  }

  /// Sets the style for the endpoints of lines drawn in the context.
  ///
  /// - parameter lineCap: A line cap style constant—kCGLineCapButt (the default), kCGLineCapRound, or kCGLineCapSquare.
  public func setLineCap(lineCap: CGLineCap) {
    CGContextSetLineCap(self, lineCap)
  }

  /// Sets the style for the joins of connected lines in the context.
  ///
  /// - parameter lineJoin: A line join value—kCGLineJoinMiter (the default), kCGLineJoinRound, or kCGLineJoinBevel.
  public func setLineJoin(lineJoin: CGLineJoin) {
    CGContextSetLineJoin(self, lineJoin)
  }

  /// Sets the miter limit for the joins of connected lines in the context.
  ///
  /// - parameter miterLimit: The miter limit value.
  public func setMiterLimit(miterLimit: Float) {
    CGContextSetMiterLimit(self, CGFloat(miterLimit))
  }

  /// Sets the line dash style of the context.
  ///
  /// - parameter lengths: An array of values that specify the lengths of the painted segments and unpainted segments, respectively, of the dash pattern.
  /// - parameter phase: A value that specifies how far into the dash pattern the line starts, in units of the user space.
  public func setLineDash(lengths: [Float], phase: Float = 0.0) {
    lengths.map { CGFloat($0) }.withUnsafeBufferPointer { buffer in
      CGContextSetLineDash(self, CGFloat(phase), buffer.baseAddress, lengths.count)
    }
  }

  /// Sets the accuracy of curved paths in the context.
  ///
  /// - parameter flatness: The largest permissible distance, measured in device pixels, between a point on the true curve and a point on the approximated curve.
  public func setFlatness(flatness: Float) {
    CGContextSetFlatness(self, CGFloat(flatness))
  }

  /// Sets the opacity of the context
  ///
  /// - parameter alpha: A value between 0 and 1 that specifies the opacity level.
  public func setAlpha(alpha: Float) {
    CGContextSetAlpha(self, CGFloat(alpha))
  }

  /// Sets how Quartz composites sample values for the context.
  ///
  /// - parameter mode: A blend mode.
  public func setBlendMode(mode: CGBlendMode) {
    CGContextSetBlendMode(self, mode)
  }

  /// Adds a previously created Quartz path object to the current path in the context.
  ///
  /// - parameter path: A previously created Quartz path object.
  public func addPath(path: CGPathRef) -> () {
    CGContextAddPath(self, path)
  }

  /// Paints a line along the current path, then clears it.
  public func strokePath() -> () {
    CGContextStrokePath(self)
  }

  /// Paints the area within the current path, then clears it.
  public func fillPath() -> () {
    CGContextFillPath(self)
  }

  /// Paints the area contained within the provided rectangle, using the fill color of the context.
  ///
  /// - parameter rect: A rectangle, in user space coordinates.
  public func fillRect(rect: CGRect) {
    CGContextFillRect(self, rect)
  }

  /// Paints the area of the ellipse that fits inside the provided rectangle, using the fill color of the context.
  ///
  /// - parameter rect: A rectangle that defines the area for the ellipse to fit in.
  public func fillEllipseInRect(rect: CGRect) {
    CGContextFillEllipseInRect(self, rect)
  }
}

public extension CGContext {
  /// Rotates the context by a given angle around a pivot point.
  ///
  /// - parameter pivot: A pivot point in the user space coordinates around which the context will rotate.
  /// - parameter angle: The angle, in degrees, by which to rotate the coordinate space of the context.
  public func rotate(pivot pivot: CGPoint, angle: Double) {
    CGContextTranslateCTM(self, pivot.x, pivot.y);
    CGContextRotateCTM(self, CGFloat(degreesToRadians(angle)));
    CGContextTranslateCTM(self, -pivot.x, -pivot.y);
  }

  /// Rotates the context clockwise, regardless of the platform, by a given angle around a pivot point.
  ///
  /// - parameter pivot: A pivot point in the user space coordinates around which the context will rotate.
  /// - parameter angle: The angle, in degrees, by which to rotate the coordinate space of the context. Positive values will rotate the context clockwise.
  public func rotateClockwise(pivot pivot: CGPoint, angle: Double) {
    executeOn(iOS: {
      self.rotate(pivot: pivot, angle: angle)
    }, mac: {
      self.rotate(pivot: pivot, angle: -angle)
    })
  }

  /// Executes a drawing code block in the context.
  ///
  /// - parameter drawingBlock: The drawing block to execute in the context.
  public func draw(drawingBlock: DrawingBlock) {
    CGContextSaveGState(self)
    drawingBlock(self)
    CGContextRestoreGState(self)
  }
}
