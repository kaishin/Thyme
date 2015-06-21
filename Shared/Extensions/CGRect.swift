import CoreGraphics

public extension CGRect {
  /// Instantiates a rect using a center point instead of an origin.
  public init(center: CGPoint, size: CGSize) {
    self.size = size
    self.origin = CGPoint(x: center.x - (size.width / 2), y: center.y - (size.height / 2))
  }

  /// Returns a CGPoint instance corresponding to the top left corner of the rect regardless of the platfrom.
  public var topLeftPoint: CGPoint {
    get {
      var point = CGPointZero

      executeOn(iOS: {
        point = self.origin
      }, mac: {
        point = CGPoint(x: 0.0, y: self.height)
      })

      return point
    }
  }

  /// Returns a CGPoint instance corresponding to the bottom left corner of the rect regardless of the platfrom.
  public var bottomLeftPoint: CGPoint {
    get {
      var point = CGPointZero

      executeOn(iOS: {
        point = CGPoint(x: 0.0, y: self.height)
      }, mac: {
        point = self.origin
      })

      return point
    }
  }

  /// Returns a CGPoint instance corresponding to the top right corner of the rect regardless of the platfrom.
  public var topRightPoint: CGPoint {
    get {
      var point = CGPointZero

      executeOn(iOS: {
        point = CGPoint(x: self.width, y: 0.0)
      }, mac: {
        point = CGPoint(x: self.width, y: self.height)
      })

      return point
    }
  }

  /// Returns a CGPoint instance corresponding to the bottom right corner of the rect regardless of the platfrom.
  public var bottomRightPoint: CGPoint {
    get {
      var point = CGPointZero

      executeOn(iOS: {
        point = CGPoint(x: self.width, y: self.height)
      }, mac: {
        point = CGPoint(x: self.width, y: 0)
      })

      return point
    }
  }
}
