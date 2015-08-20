import XCTest
import AppKit
@testable import Thyme

class PathTests: XCTestCase {
  var quartzPath: CGPath!

  override func setUp() {
    super.setUp()
    let path = Path(point: CGPointZero)
      |> addLineTowards([.Right: 100])
      |> addLineTowards([.Top: 100])
      |> addLineTowards([.Left: 100])
      |> addLineTowards([.Bottom: 100])
      |> close

    quartzPath = path.CGPath
  }

  func testPathClosesAtOrigin() {
    XCTAssertEqual(CGPathGetCurrentPoint(quartzPath), CGPointZero)
  }

  func testCreateRectangle() {
    let size = CGSize(width: 100, height: 100)
    let boundingBox = CGPathGetBoundingBox(quartzPath)
    XCTAssertEqual(boundingBox.size, size)
  }

  func testUsePlatformCoordinates() {
    XCTAssertTrue(CGPathContainsPoint(quartzPath, nil, CGPoint(x: 50, y: 50), false))
  }
}
