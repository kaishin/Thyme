import CoreGraphics
import Thyme

func drawIcon(context: CGContextRef, rect: CGRect, fillColor: CGColorRef, otherFillColor: CGColorRef) {
  let width = Float(rect.width)
  let height = Float(rect.height)
  let thickness: Float = 40.0


  let triangle = Path(point: rect.topLeftPoint)
    |> addLineTo(rect.topRightPoint)
    |> addLineTowards([.Left: Float(rect.width / 2), .Bottom: Float(rect.height - 40)])
    |> close

  let flippedTriangle = triangle.flipVertically(rect.midY)

  context.setFillColor(fillColor)
  context.addPath(triangle.CGPath)
  context.fillPath()

  context.setFillColor(otherFillColor)
  context.addPath(flippedTriangle.CGPath)
  context.fillPath()
}
