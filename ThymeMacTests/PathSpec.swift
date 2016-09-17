import XCTest
import AppKit
@testable import Thyme

class PathTests: XCTestCase {
  var quartzPath: CGPath!

  override func setUp() {
    super.setUp()
    let path = Path(point: CGPoint.zero)
      .addLine(towards: [.right: 100])
      .addLine(towards: [.top: 100])
      .addLine(towards: [.left: 100])
      .addLine(towards: [.bottom: 100])
      .close()

    quartzPath = path.cgPath
  }

  func testPathClosesAtOrigin() {
    XCTAssertEqual(quartzPath.currentPoint, CGPoint.zero)
  }

  func testCreateRectangle() {
    let size = CGSize(width: 100, height: 100)
    let boundingBox = quartzPath.boundingBox
    XCTAssertEqual(boundingBox.size, size)
  }

  func testUsePlatformCoordinates() {
    XCTAssertTrue(quartzPath.contains(CGPoint(x: 50, y: 50)))
  }
}
