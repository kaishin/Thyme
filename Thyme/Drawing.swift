import UIKit

public func drawInCurrentContext(_ drawingBlock: DrawingBlock) {
  guard let context = UIGraphicsGetCurrentContext() else { return }
  context.draw(drawingBlock)
}
