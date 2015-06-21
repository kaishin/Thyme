import Quick
import Nimble
import Thyme
import UIKit

class CGRectExtensionSpec: QuickSpec {
  override func spec() {
    describe("CGRectExtension") {
      let rect = CGRect(origin: CGPointZero, size: CGSize(width: 100, height: 100))

      it("should create a rect using a center point instead of an origin") {
        let centerPoint = CGPoint(x: 50, y: 50)
        let centeredRect = CGRect(center: centerPoint, size: CGSize(width: 100, height: 100))
        expect(centeredRect.origin).to(equal(CGPointZero))
      }

      it("should return the top left point of the rect") {
        expect(rect.topLeftPoint).to(equal(CGPointZero))
      }

      it("should return the top right point of the rect") {
        expect(rect.topRightPoint).to(equal(CGPoint(x: rect.width, y: 0)))
      }

      it("should return the bottom right point of the rect") {
        expect(rect.bottomRightPoint).to(equal(CGPoint(x: rect.width, y: rect.height)))
      }

      it("should return the bottom left point of the rect") {
        expect(rect.bottomLeftPoint).to(equal(CGPoint(x: 0, y: rect.height)))
      }
    }
  }
}
