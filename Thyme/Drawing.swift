import UIKit

public func drawInCurrentContext(drawingBlock: DrawingBlock) {
  UIGraphicsGetCurrentContext().draw(drawingBlock)
}
