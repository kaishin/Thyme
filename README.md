<img src="https://raw.github.com/kaishin/Thyme/master/logo.png" width="100" alt="logo" />

# Thyme

[![GitHub release](https://img.shields.io/github/release/kaishin/Thyme.svg)](https://github.com/kaishin/Thyme/releases/latest) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![CocoaPods](https://img.shields.io/cocoapods/v/Thyme.svg)](https://cocoapods.org/pods/Thyme) ![Swift 4.0](https://img.shields.io/badge/Swift-4.0-orange.svg) ![platforms](https://img.shields.io/badge/platforms-iOS%20%7C%20macOS-lightgrey.svg)

A thin wrapper around *Core Graphics* that makes it possible to reuse the same drawing code on both iOS and macOS.

### Installation

#### [Carthage](https://github.com/Carthage/Carthage)

- Add the following to your Cartfile: `github "kaishin/Thyme"`
- Then run `carthage update`
- Follow the current instructions in [Carthage's README][carthage-installation]
for up to date installation instructions.

[carthage-installation]: https://github.com/Carthage/Carthage#adding-frameworks-to-an-application

#### [CocoaPods](http://cocoapods.org)

- Add the following to your [Podfile](http://guides.cocoapods.org/using/the-podfile.html): `pod 'Thyme'`
- You will also need to make sure you're opting into using frameworks: `use_frameworks!`
- Then run `pod install`.

### Usage

After importing Thyme, you can use the same APIs on both iOS and OSX. The exact same drawing code can be used in both platforms.

Thyme introduces the `Path` type to help you contruct your paths. Instead of providing exact coordinates, you describe how your path can be drawn in a series of actions. For instance:

~~~swift
let square = Path(point: CGPointZero)
  .addLine(towards: [.Right: 100])
  .addLine(towards: [.Bottom: 100])
  .addLine(towards: [.Left: 100])
  .addLine(towards: [.Top: 100])
  .close()
~~~

The code snippet above describes a square-shaped path in 5 steps. You can then obtain a `CGPathRef` using the `CGPath` property of `Path`.

This is a simplified example to demonstrate how you can use the same drawing code on both platforms, with the use of helpers such as `CGRect.topLeftPoint`:

~~~swift
// Shared Code
func drawIcon(context: CGContextRef, rect: CGRect, fillColor: CGColorRef) {
  let triangle = Path(point: rect.topLeftPoint)
    .addLine(to: rect.topRightPoint)
    .addLine(towards: [.left: rect.width / 2, .bottom: rect.height])
    .close()

  context.addPath(triangle.cgPath)
  context.setFillColor(fillColor)
  context.fillPath()
}

// iOS
class CustomView: UIView {
  override func drawRect(rect: CGRect) {
    drawInCurrentContext { context in
      drawIcon(context, rect: self.bounds, fillColor: UIColor.redColor())
    }
  }
}

// Mac
class CustomView: NSView {
  override func drawRect(dirtyRect: NSRect) {
    drawInCurrentContext { context in
      drawIcon(context, rect: self.bounds, fillColor: NSColor.redColor())
    }
  }
}
~~~

### Requirements

- Swift 4.0+
- Xcode 9
- iOS 10+
- macOS 10.10+

### License

Copyright 2015-2018 Reda Lemeden. BSD Licence. See LICENSE file for more info.
