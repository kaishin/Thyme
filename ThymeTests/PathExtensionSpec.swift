import XCTest
import UIKit
@testable import Thyme

class PathExtensionTests: XCTestCase {
  var path: Path!

  override func setUp() {
    super.setUp()
    path = Path(point: CGPointZero)
      |> addLineTowards([.Right: 100])
      |> addLineTowards([.Bottom: 100])
      |> close
  }

  func testFlipPathVertically() {
    let quartzPath = path.flipVertically(100).CGPath
    let expectedRect = CGRect(x: 0, y: 100, width: 100, height: 100)
    XCTAssertEqual(CGPathGetBoundingBox(quartzPath), expectedRect)
  }

  func testFlipPathHorizontally() {
    let quartzPath = path.flipHorizontally(100).CGPath
    let expectedRect = CGRect(x: 100, y: 0, width: 100, height: 100)
    XCTAssertEqual(CGPathGetBoundingBox(quartzPath), expectedRect)
  }
}