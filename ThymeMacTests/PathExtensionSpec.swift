import Quick
import Nimble
import Thyme
import CoreGraphics

class PathExtensionSpec: QuickSpec {
  override func spec() {
    describe("PathExtension") {
      let path = Path(point: CGPointZero)
        |> addLineTowards([.Top: 100])
        |> addLineTowards([.Right: 100])
        |> close

      it("should flip path vertically along a given axis") {
        let quartzPath = path.flipVertically(0).CGPath
        let expectedRect = CGRect(x: 0, y: -100, width: 100, height: 100)
        expect(CGPathGetBoundingBox(quartzPath)).to(equal(expectedRect))
      }

      it("should flip path horizontally along a given axis") {
        let quartzPath = path.flipHorizontally(100).CGPath
        let expectedRect = CGRect(x: 100, y: 0, width: 100, height: 100)
        expect(CGPathGetBoundingBox(quartzPath)).to(equal(expectedRect))
      }
    }
  }
}
