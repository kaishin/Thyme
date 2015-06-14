import Quick
import Nimble
import Thyme
import UIKit

class PathSpec: QuickSpec {
  override func spec() {
    describe("Path") {
      var quartzPath: CGPath!

      beforeEach {
        let path = Path(point: CGPointZero)
          |> addLineTowards([.Right: 100])
          |> addLineTowards([.Bottom: 100])
          |> addLineTowards([.Left: 100])
          |> addLineTowards([.Top: 100])
          |> close
        
        quartzPath = path.CGPath
      }

      it("should create a CGPath that closes at CGPointZero") {
        expect(CGPathGetCurrentPoint(quartzPath)).to(equal(CGPointZero))
      }

      it("should create a CGPath with a rectangular shape") {
        var size = CGSize(width: 100, height: 100)
        let boundingBox = CGPathGetBoundingBox(quartzPath)
        expect(boundingBox.size).to(equal(size))
      }

      it("should create a CGPath using the platform's coordinate system") {
        expect(CGPathContainsPoint(quartzPath, nil, CGPoint(x: 50, y: 50), false)).to(beTrue())
      }
    }
  }
}

