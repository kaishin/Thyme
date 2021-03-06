import XCTest
import AppKit
@testable import Thyme

class CGRectExtensionTests: XCTestCase {
  let rect = CGRect(origin: CGPoint.zero, size: CGSize(width: 100, height: 100))

  func drawRectWithOrigin() {
    let centerPoint = CGPoint(x: 50, y: 50)
    let centeredRect = CGRect(origin: centerPoint, size: CGSize(width: 100, height: 100))
    XCTAssertEqual(centeredRect.origin, CGPoint.zero)
  }

  func testRectCenter() {
    XCTAssertEqual(rect.center, CGPoint(x: 50, y: 50))
  }

  func testRectTopLeftPoint() {
    XCTAssertEqual(rect.topLeftPoint, CGPoint(x: 0, y: rect.height))
  }

  func testRectTopRightPoint() {
    XCTAssertEqual(rect.topRightPoint, CGPoint(x: rect.width, y: rect.height))
  }

  func testRectBottomRightPoint() {
    XCTAssertEqual(rect.bottomRightPoint, CGPoint(x: rect.width, y: 0))
  }

  func testRectBottomLeftPoint() {
    XCTAssertEqual(rect.bottomLeftPoint, CGPoint.zero)
  }
}
