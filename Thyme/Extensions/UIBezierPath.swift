import UIKit

extension UIBezierPath {
  /// Fills a path with a given color.
  ///
  /// - parameter color: The color to use for filling the path.
  func fill(with color: UIColor) {
    let context = UIGraphicsGetCurrentContext()
    context?.saveGState()
    color.setFill()
    fill()
    context?.restoreGState()
  }
}
