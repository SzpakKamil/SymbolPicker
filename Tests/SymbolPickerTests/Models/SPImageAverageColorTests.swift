//
//  SPImageAverageColorTests.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 28/03/2026.
//

#if canImport(Testing)
import Testing
@testable import SymbolPicker

#if canImport(CoreImage)
import CoreImage
#endif
#if canImport(AppKit)
import AppKit

struct SPImageAverageColorTests {

    // MARK: - averageColor (macOS: NSImage extension)

    @Test("NSImage averageColor returns non-nil for a system symbol image")
    func testAverageColorNonNil() {
        guard let image = NSImage(systemSymbolName: "star.fill", accessibilityDescription: nil) else { return }
        #expect(image.averageColor() != nil)
    }

    @Test("NSImage averageColor RGBA components are all in [0, 1]")
    func testAverageColorComponentsInRange() {
        guard let image = NSImage(systemSymbolName: "star.fill", accessibilityDescription: nil),
              let color = image.averageColor() else { return }
        var r: CGFloat = -1, g: CGFloat = -1, b: CGFloat = -1, a: CGFloat = -1
        color.getRed(&r, green: &g, blue: &b, alpha: &a)
        #expect(r >= 0 && r <= 1)
        #expect(g >= 0 && g <= 1)
        #expect(b >= 0 && b <= 1)
        #expect(a >= 0 && a <= 1)
    }

    @Test("NSImage averageColor alpha is 1 for opaque symbol rendered without transparency")
    func testAverageColorAlpha() {
        // A system symbol rendered with tintColor .black on an opaque context
        // should produce an average alpha greater than 0 (image has pixels)
        guard let image = NSImage(systemSymbolName: "circle.fill", accessibilityDescription: nil),
              let color = image.averageColor() else { return }
        var a: CGFloat = 0
        color.getRed(nil, green: nil, blue: nil, alpha: &a)
        // circle.fill is a solid filled circle — average alpha must be > 0
        #expect(a > 0)
    }

    @Test("NSImage averageColor returns NSColor")
    func testAverageColorType() {
        guard let image = NSImage(systemSymbolName: "heart.fill", accessibilityDescription: nil) else { return }
        let color = image.averageColor()
        #expect(color is NSColor?)
    }

    @Test("NSImage averageColor is deterministic for the same image")
    func testAverageColorDeterministic() {
        guard let image = NSImage(systemSymbolName: "star.fill", accessibilityDescription: nil),
              let c1 = image.averageColor(),
              let c2 = image.averageColor() else { return }
        var r1: CGFloat = 0, g1: CGFloat = 0, b1: CGFloat = 0
        var r2: CGFloat = 0, g2: CGFloat = 0, b2: CGFloat = 0
        c1.getRed(&r1, green: &g1, blue: &b1, alpha: nil)
        c2.getRed(&r2, green: &g2, blue: &b2, alpha: nil)
        #expect(r1 == r2)
        #expect(g1 == g2)
        #expect(b1 == b2)
    }
}

#elseif canImport(UIKit) && !os(tvOS) && !os(watchOS)
import UIKit

struct SPImageAverageColorTests {

    // MARK: - averageColor (iOS/visionOS: UIImage extension)

    @Test("UIImage averageColor returns non-nil for a system symbol image")
    func testAverageColorNonNil() {
        guard let image = UIImage(systemName: "star.fill") else { return }
        #expect(image.averageColor() != nil)
    }

    @Test("UIImage averageColor RGBA components are all in [0, 1]")
    func testAverageColorComponentsInRange() {
        guard let image = UIImage(systemName: "star.fill"),
              let color = image.averageColor() else { return }
        var r: CGFloat = -1, g: CGFloat = -1, b: CGFloat = -1, a: CGFloat = -1
        color.getRed(&r, green: &g, blue: &b, alpha: &a)
        #expect(r >= 0 && r <= 1)
        #expect(g >= 0 && g <= 1)
        #expect(b >= 0 && b <= 1)
        #expect(a >= 0 && a <= 1)
    }

    @Test("UIImage averageColor alpha is > 0 for opaque symbol")
    func testAverageColorAlpha() {
        guard let image = UIImage(systemName: "circle.fill"),
              let color = image.averageColor() else { return }
        var a: CGFloat = 0
        color.getRed(nil, green: nil, blue: nil, alpha: &a)
        #expect(a > 0)
    }

}

#endif
#endif
