import AppKit

public func drawInCurrentContext(_ drawingBlock: DrawingBlock) {
  NSGraphicsContext.current?.draw(drawingBlock)
}
