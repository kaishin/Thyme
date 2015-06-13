import AppKit

public func drawInCurrentContext(drawingBlock: DrawingBlock) {
  NSGraphicsContext.current?.draw(drawingBlock)
}
