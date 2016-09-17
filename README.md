<img src="https://raw.github.com/kaishin/Thyme/master/logo.png" width="100" alt="logo" />

# Thyme [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![Travis](http://img.shields.io/travis/kaishin/Thyme.svg?style=flat)](https://travis-ci.org/kaishin/Thyme/)

A thin wrapper around *Core Graphics* that makes it possible to reuse the same drawing code on both iOS and macOS.

### Compatibility

Swift 3 / Xcode 8: 1.0
Swift 2.2 / Xcode 7: 0.3.2

### Installation
#### [Carthage](https://github.com/Carthage/Carthage)

- Add the following to your Cartfile: `github "kaishin/Thyme"`
- Then run `carthage update`
- Follow the current instructions in [Carthage's README][carthage-installation]
for up to date installation instructions.

[carthage-installation]: https://github.com/Carthage/Carthage#adding-frameworks-to-an-application

#### Git Submodules

- Add this repo as a submodule, and add the project file to your workspace. You
can then link against `Thyme.framework` for your application target.

#### Cocoapods

*Coming Soon*

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

### License

Copyright 2015-2016 Reda Lemeden. BSD Licence. See LICENSE file for more info.
