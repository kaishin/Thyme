import Quick
import Nimble
import Thyme
import AppKit

class NSViewSpec: QuickSpec {
  override func spec() {
    describe("NSViewExtension") {
      it("should return the center of an NSView instance") {
        let view = NSView(frame: NSRect(x: 0, y: 0, width: 200, height: 200))
        expect(view.center).to(equal(CGPoint(x: 100, y: 100)))
      }
    }
  }
}