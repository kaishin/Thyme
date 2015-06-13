import CoreGraphics

public extension CGContext {
  /// Sets the current fill color of the context.
  ///
  /// :param: color The new fill color.
  public func setFillColor(color: CGColor) {
    CGContextSetFillColorWithColor(self, color)
  }

  /// Sets the current stroke color of the context.
  ///
  /// :param: color The new stroke color.
  public func setStrokeColor(color: CGColor) {
    CGContextSetStrokeColorWithColor(self, color)
  }

  /// Sets the line width of the context.
  ///
  /// :param: width The width value in resolution-independent points.
  public func setLineWidth(width: Float) {
    CGContextSetLineWidth(self, CGFloat(width))
  }

  /// Sets the style for the endpoints of lines drawn in the context.
  ///
  /// :param: lineCap A line cap style constant—kCGLineCapButt (the default), kCGLineCapRound, or kCGLineCapSquare.
  public func setLineCap(lineCap: CGLineCap) {
    CGContextSetLineCap(self, lineCap)
  }

  /// Sets the style for the joins of connected lines in the context.
  ///
  /// :param: lineJoin A line join value—kCGLineJoinMiter (the default), kCGLineJoinRound, or kCGLineJoinBevel.
  public func setLineJoin(lineJoin: CGLineJoin) {
    CGContextSetLineJoin(self, lineJoin)
  }

  /// Sets the miter limit for the joins of connected lines in the context.
  ///
  /// :param: miterLimit The miter limit value.
  public func setMiterLimit(miterLimit: Float) {
    CGContextSetMiterLimit(self, CGFloat(miterLimit))
  }

  /// Sets the line dash style of the context.
  ///
  /// :param: lengths An array of values that specify the lengths of the painted segments and unpainted segments, respectively, of the dash pattern.
  /// :param: phase A value that specifies how far into the dash pattern the line starts, in units of the user space.
  public func setLineDash(lengths: [Float], phase: Float = 0.0) {
    lengths.map { CGFloat($0) }.withUnsafeBufferPointer { buffer in
      CGContextSetLineDash(self, CGFloat(phase), buffer.baseAddress, lengths.count)
    }
  }

  /// Sets the accuracy of curved paths in the context.
  ///
  /// :param: flatness The largest permissible distance, measured in device pixels, between a point on the true curve and a point on the approximated curve.
  public func setFlatness(flatness: Float) {
    CGContextSetFlatness(self, CGFloat(flatness))
  }

  /// Sets the opacity of the context
  ///
  /// :param: alpha A value between 0 and 1 that specifies the opacity level.
  public func setAlpha(alpha: Float) {
    CGContextSetAlpha(self, CGFloat(alpha))
  }

  /// Sets how Quartz composites sample values for the context.
  ///
  /// :param: mode A blend mode.
  public func setBlendMode(mode: CGBlendMode) {
    CGContextSetBlendMode(self, mode)
  }

  /// Adds a previously created Quartz path object to the current path in the context.
  ///
  /// :param: path A previously created Quartz path object.
  public func addPath(path: CGPathRef) -> () {
    CGContextAddPath(self, path)
  }

  /// Paints a line along the current path.
  public func strokePath() -> () {
    CGContextStrokePath(self)
  }

  /// Paints the area contained within the provided rectangle, using the fill color of the context.
  ///
  /// :param: rect A rectangle, in user space coordinates.
  public func fillRect(rect: CGRect) {
    CGContextFillRect(self, rect)
  }

  /// Paints the area of the ellipse that fits inside the provided rectangle, using the fill color of the context.
  ///
  /// :param: rect A rectangle that defines the area for the ellipse to fit in.
  public func fillEllipseInRect(rect: CGRect) {
    CGContextFillEllipseInRect(self, rect)
  }
}

public extension CGContext {
  /// Rotates the context by a given angle around a pivot point.
  ///
  /// :param: pivot A pivot point in the user space coordinates around which the context will rotate.
  /// :param: angle The angle, in degrees, by which to rotate the coordinate space of the context.
  public func rotate(#pivot: CGPoint, angle: Double) {
    CGContextTranslateCTM(self, pivot.x, pivot.y);
    CGContextRotateCTM(self, CGFloat(degreesToRadians(angle)));
    CGContextTranslateCTM(self, -pivot.x, -pivot.y);
  }

  /// Executes a drawing code block in the context.
  ///
  /// :param: drawingBlock The drawing block to execute in the context.
  public func draw(drawingBlock: DrawingBlock) {
    CGContextSaveGState(self)
    drawingBlock(self)
    CGContextRestoreGState(self)
  }

  /// Rotates the context by a given angle around a pivot point, then executes a drawing block.
  ///
  /// :param: pivot A pivot point in the user space coordinates around which the context will rotate.
  /// :param: angle The angle, in degrees, by which to rotate the coordinate space of the context.
  /// :param: drawingBlock The drawing block to execute in the context.
  public func rotateThenDraw(#pivot: CGPoint, angle: Double, drawingBlock: DrawingBlock) {
    self.rotate(pivot: pivot, angle: angle)
    self.draw(drawingBlock)
    self.rotate(pivot: pivot, angle: -angle)
  }
}
