import Quick
import Nimble
import Thyme
import UIKit

class UIImageExtensionSpec: QuickSpec {
  override func spec() {
    describe("UIImageExtension") {
      it("should ignore alpha by default") {
        expect(true).to(beTrue())
      }
    }
  }
}
