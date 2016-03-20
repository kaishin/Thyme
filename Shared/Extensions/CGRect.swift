import CoreGraphics

public extension CGRect {
  /// Instantiates a rect using a center point instead of an origin.
  public init(center: CGPoint, size: CGSize) {
    self.size = size
    self.origin = CGPoint(x: center.x - (size.width / 2), y: center.y - (size.height / 2))
  }

  /// Returns the center point of the rect.
  public var center: CGPoint {
    return CGPoint(x: midX, y: midY)
  }

  /// Returns a CGPoint instance corresponding to the top left corner of the rect regardless of the platform.
  public var topLeftPoint: CGPoint {
    get {
      var point = CGPointZero

      executeOn(iOS: {
        point = self.origin
      }, mac: {
        point = CGPoint(x: self.origin.x, y: self.maxY)
      })

      return point
    }
  }

  /// Returns a CGPoint instance corresponding to the bottom left corner of the rect regardless of the platform.
  public var bottomLeftPoint: CGPoint {
    var point = CGPointZero

    executeOn(iOS: {
      point = CGPoint(x: self.origin.x, y: self.maxY)
    }, mac: {
      point = self.origin
    })

    return point
  }

  /// Returns a CGPoint instance corresponding to the top right corner of the rect regardless of the platform.
  public var topRightPoint: CGPoint {
    var point = CGPointZero

    executeOn(iOS: {
      point = CGPoint(x: self.width, y: self.origin.y)
    }, mac: {
      point = CGPoint(x: self.width, y: self.maxY)
    })

    return point
  }

  /// Returns a CGPoint instance corresponding to the bottom right corner of the rect regardless of the platform.
  public var bottomRightPoint: CGPoint {
    get {
      var point = CGPointZero

      executeOn(iOS: {
        point = CGPoint(x: self.width, y: self.maxY)
      }, mac: {
        point = CGPoint(x: self.width, y: self.origin.y)
      })

      return point
    }
  }
}
