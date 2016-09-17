import CoreGraphics
import Thyme

func drawIcon(_ context: CGContext, rect: CGRect, fillColor: CGColor, otherFillColor: CGColor) {
  let triangle = Path(point: rect.topLeftPoint)
    .addLine(to: rect.topRightPoint)
    .addLine(towards: [.left: Float(rect.width / 2), .bottom: Float(rect.height - 40)])
    .close()

  let flippedTriangle = triangle.flipVertically(by: rect.midY)

  context.setFillColor(fillColor)
  context.addPath(triangle.cgPath)
  context.fillPath()

  context.setFillColor(otherFillColor)
  context.addPath(flippedTriangle.cgPath)
  context.fillPath()
}
