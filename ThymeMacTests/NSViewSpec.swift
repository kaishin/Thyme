import XCTest
import AppKit
@testable import Thyme

class NSViewExtensionTests: XCTestCase {
  func testViewCenter() {
    let view = NSView(frame: NSRect(x: 0, y: 0, width: 200, height: 200))
    XCTAssertEqual(view.center, CGPoint(x: 100, y: 100))
  }
}
