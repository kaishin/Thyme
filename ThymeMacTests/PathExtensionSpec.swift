import CoreGraphics
import XCTest
@testable import Thyme

class PathExtensionTests: XCTestCase {
  var path: Path!

  override func setUp() {
    super.setUp()
    path = Path(point: CGPoint.zero)
      .addLine(towards: [.top: 100])
      .addLine(towards: [.right: 100])
      .close()
  }

  func testFlipPathVertically() {
    let quartzPath = path.flipVertically(by: 0).cgPath
    let expectedRect = CGRect(x: 0, y: -100, width: 100, height: 100)
    XCTAssertEqual(quartzPath.boundingBox, expectedRect)
  }

  func testFlipPathHorizontally() {
    let quartzPath = path.flipHorizontally(by: 100).cgPath
    let expectedRect = CGRect(x: 100, y: 0, width: 100, height: 100)
    XCTAssertEqual(quartzPath.boundingBox, expectedRect)
  }
}
