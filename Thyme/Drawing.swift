import UIKit

public func drawInCurrentContext(drawingBlock: DrawingBlock) {
  guard let context = UIGraphicsGetCurrentContext() else { return }
  context.draw(drawingBlock)
}
