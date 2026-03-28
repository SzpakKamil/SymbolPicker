//
//  SPSelectionBindingsTests.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 28/03/2026.
//

import SwiftUI
import ColorKit
#if canImport(Testing)
import Testing
@testable import SymbolPicker

// MARK: - SPSelection-Bindings.swift Tests
//
// Two identical extension blocks are defined in SPSelection-Bindings.swift:
//   • Generic:    `extension Binding where Value: SPSelectionProtocol`
//   • Existential:`extension Binding where Value == any SPSelectionProtocol`
//
// Both expose:
//   asImageOffsetY  — get: image?.offsetY ?? 1.0 ; set: updates image.offsetY if image present
//   asImageOffsetX  — get: image?.offsetX ?? 1.0 ; set: updates image.offsetX if image present
//   asZoom          — get: image?.zoom    ?? 1.0 ; set: updates image.zoom    if image present
//   asCKColor       — get: color ?? transparent black ; set: sets color on selection
//   asImage         — PhotosPickerItem? setter (async, not unit-testable; omitted)
//
// Image-mutating bindings are tested on platforms that support SPImage
// (not tvOS, not watchOS) at iOS 16.0+ / macOS 14.0+.
//
// Helpers: `defaultSymbol`, `symbolWithImage`, `existentialBinding`

@MainActor
struct SPSelectionBindingsTests {

    // MARK: - Helpers

    private var defaultSymbol: SPSelection<SPSymbol> {
        SPSelection(symbol: SPSymbol(systemName: "star.fill"))
    }

    private var transparentBlack: CKColor {
        CKColor(red: 0, green: 0, blue: 0, opacity: 0)
    }

    private func makeGenericBinding(_ selection: SPSelection<SPSymbol>) -> Binding<SPSelection<SPSymbol>> {
        var value = selection
        return Binding(get: { value }, set: { value = $0 })
    }

    private func makeExistentialBinding(_ selection: SPSelection<SPSymbol>) -> Binding<any SPSelectionProtocol> {
        Binding.constant(selection).eraseToAnySPSelectionProtocol()
    }

    // Helpers to disambiguate conditional Binding extensions from @dynamicMemberLookup.
    // Calling `binding.asCKColor` on Binding<SPSelection<SPSymbol>> triggers @dynamicMemberLookup
    // because Swift prefers the key-path subscript over the conditional extension member.
    // Routing through a generic function forces the compiler to resolve the extension.
    private func ckColorBinding<V: SPSelectionProtocol>(_ b: Binding<V>) -> Binding<CKColor> { b.asCKColor }
    private func offsetYBinding<V: SPSelectionProtocol>(_ b: Binding<V>) -> Binding<Double> { b.asImageOffsetY }
    private func offsetXBinding<V: SPSelectionProtocol>(_ b: Binding<V>) -> Binding<Double> { b.asImageOffsetX }
    private func zoomBinding<V: SPSelectionProtocol>(_ b: Binding<V>) -> Binding<Double> { b.asZoom }

    // =========================================================================
    // MARK: - Generic extension: asImageOffsetY
    // =========================================================================

    @Test("Generic asImageOffsetY getter returns 1.0 when selection has no image")
    func testGenericAsImageOffsetYNoImageDefault() {
        let binding = makeGenericBinding(defaultSymbol)
        #expect(offsetYBinding(binding).wrappedValue == 1.0)
    }

    @Test("Generic asImageOffsetY setter is no-op when selection has no image")
    func testGenericAsImageOffsetYSetterNoImage() {
        var selection = defaultSymbol
        let binding = Binding<SPSelection<SPSymbol>>(get: { selection }, set: { selection = $0 })
        offsetYBinding(binding).wrappedValue = -5.0
        // No image present → setter guard fails → offsetY unchanged; getImage() still nil
        #expect(selection.getImage() == nil)
    }

    // MARK: - Generic extension: asImageOffsetX

    @Test("Generic asImageOffsetX getter returns 1.0 when selection has no image")
    func testGenericAsImageOffsetXNoImageDefault() {
        let binding = makeGenericBinding(defaultSymbol)
        #expect(offsetXBinding(binding).wrappedValue == 1.0)
    }

    @Test("Generic asImageOffsetX setter is no-op when selection has no image")
    func testGenericAsImageOffsetXSetterNoImage() {
        var selection = defaultSymbol
        let binding = Binding<SPSelection<SPSymbol>>(get: { selection }, set: { selection = $0 })
        offsetXBinding(binding).wrappedValue = 10.0
        #expect(selection.getImage() == nil)
    }

    // MARK: - Generic extension: asZoom

    @Test("Generic asZoom getter returns 1.0 when selection has no image")
    func testGenericAsZoomNoImageDefault() {
        let binding = makeGenericBinding(defaultSymbol)
        #expect(zoomBinding(binding).wrappedValue == 1.0)
    }

    @Test("Generic asZoom setter is no-op when selection has no image")
    func testGenericAsZoomSetterNoImage() {
        var selection = defaultSymbol
        let binding = Binding<SPSelection<SPSymbol>>(get: { selection }, set: { selection = $0 })
        zoomBinding(binding).wrappedValue = 2.0
        #expect(selection.getImage() == nil)
    }

    // MARK: - Generic extension: asCKColor

    @Test("Generic asCKColor getter returns transparent black when selection has no color")
    func testGenericAsCKColorNoColorDefault() {
        let binding = makeGenericBinding(defaultSymbol)
        // No color set → falls back to CKColor(red:0, green:0, blue:0, opacity:0)
        let color = ckColorBinding(binding).wrappedValue
        _ = color // verify getter runs without crash
        #expect(ckColorBinding(binding).wrappedValue.rgbComponents().a == 0)
    }

    @Test("Generic asCKColor setter stores the color on the selection")
    func testGenericAsCKColorSetter() {
        var selection = defaultSymbol
        let binding = Binding<SPSelection<SPSymbol>>(get: { selection }, set: { selection = $0 })
        let red = CKColor(red: 1, green: 0, blue: 0, opacity: 1)
        ckColorBinding(binding).wrappedValue = red
        #expect(selection.getColor() != nil)
    }

    @Test("Generic asCKColor getter reflects color set via asCKColor setter")
    func testGenericAsCKColorRoundTrip() {
        var selection = defaultSymbol
        let binding = Binding<SPSelection<SPSymbol>>(get: { selection }, set: { selection = $0 })
        let blue = CKColor(red: 0, green: 0, blue: 1, opacity: 1)
        ckColorBinding(binding).wrappedValue = blue
        #expect(ckColorBinding(binding).wrappedValue.rgbComponents().a > 0)
    }

    @Test("Generic asCKColor getter reflects color already set on selection")
    func testGenericAsCKColorPresetColor() {
        var selection = defaultSymbol
        selection.setColor(CKColor(red: 0, green: 1, blue: 0, opacity: 1))
        let binding = makeGenericBinding(selection)
        #expect(ckColorBinding(binding).wrappedValue.rgbComponents().a == 1.0)
    }

    // MARK: - Generic extension: image-mutating bindings with SPImage

    #if !os(tvOS) && !os(watchOS)
    @available(iOS 16.0, macOS 14.0, visionOS 26.0, *)
    @Test("Generic asImageOffsetY getter returns image offsetY when image present")
    func testGenericAsImageOffsetYWithImage() {
        guard let spImage = SPImage(systemName: "star.fill") else { return }
        var selection = defaultSymbol
        selection.setImage(spImage)
        let binding = makeGenericBinding(selection)
        // Default offsetY is 0.0, not nil, so getter returns 0.0 (not 1.0)
        #expect(offsetYBinding(binding).wrappedValue == 0.0)
    }

    @available(iOS 16.0, macOS 14.0, visionOS 26.0, *)
    @Test("Generic asImageOffsetY setter updates image offsetY when image present")
    func testGenericAsImageOffsetYSetterWithImage() {
        guard let spImage = SPImage(systemName: "star.fill") else { return }
        var selection = defaultSymbol
        selection.setImage(spImage)
        let binding = Binding<SPSelection<SPSymbol>>(get: { selection }, set: { selection = $0 })
        offsetYBinding(binding).wrappedValue = -7.5
        #expect(selection.getImage()?.offsetY == -7.5)
    }

    @available(iOS 16.0, macOS 14.0, visionOS 26.0, *)
    @Test("Generic asImageOffsetX setter updates image offsetX when image present")
    func testGenericAsImageOffsetXSetterWithImage() {
        guard let spImage = SPImage(systemName: "star.fill") else { return }
        var selection = defaultSymbol
        selection.setImage(spImage)
        let binding = Binding<SPSelection<SPSymbol>>(get: { selection }, set: { selection = $0 })
        offsetXBinding(binding).wrappedValue = 3.0
        #expect(selection.getImage()?.offsetX == 3.0)
    }

    @available(iOS 16.0, macOS 14.0, visionOS 26.0, *)
    @Test("Generic asZoom setter updates image zoom when image present")
    func testGenericAsZoomSetterWithImage() {
        guard let spImage = SPImage(systemName: "star.fill") else { return }
        var selection = defaultSymbol
        selection.setImage(spImage)
        let binding = Binding<SPSelection<SPSymbol>>(get: { selection }, set: { selection = $0 })
        zoomBinding(binding).wrappedValue = 1.5
        #expect(selection.getImage()?.zoom == 1.5)
    }
    #endif

    // =========================================================================
    // MARK: - Existential extension: asImageOffsetY
    // =========================================================================

    @Test("Existential asImageOffsetY getter returns 1.0 when selection has no image")
    func testExistentialAsImageOffsetYNoImageDefault() {
        let binding = makeExistentialBinding(defaultSymbol)
        #expect(binding.asImageOffsetY.wrappedValue == 1.0)
    }

    @Test("Existential asImageOffsetX getter returns 1.0 when selection has no image")
    func testExistentialAsImageOffsetXNoImageDefault() {
        let binding = makeExistentialBinding(defaultSymbol)
        #expect(binding.asImageOffsetX.wrappedValue == 1.0)
    }

    @Test("Existential asZoom getter returns 1.0 when selection has no image")
    func testExistentialAsZoomNoImageDefault() {
        let binding = makeExistentialBinding(defaultSymbol)
        #expect(binding.asZoom.wrappedValue == 1.0)
    }

    // MARK: - Existential extension: asCKColor

    @Test("Existential asCKColor getter returns transparent black when selection has no color")
    func testExistentialAsCKColorNoColorDefault() {
        let binding = makeExistentialBinding(defaultSymbol)
        #expect(binding.asCKColor.wrappedValue.rgbComponents().a == 0)
    }

    @Test("Existential asCKColor setter does not crash")
    func testExistentialAsCKColorSetterNoCrash() {
        var selection: any SPSelectionProtocol = defaultSymbol
        let binding = Binding<any SPSelectionProtocol>(
            get: { selection },
            set: { selection = $0 }
        )
        binding.asCKColor.wrappedValue = CKColor(red: 1, green: 0, blue: 0, opacity: 1)
        #expect(selection.getColor() != nil)
    }

    @Test("Existential asCKColor getter reflects color already set on selection")
    func testExistentialAsCKColorPresetColor() {
        var selection = defaultSymbol
        selection.setColor(CKColor(red: 0.5, green: 0.5, blue: 0.5, opacity: 1))
        let binding: Binding<any SPSelectionProtocol> = Binding<any SPSelectionProtocol>(
            get: { selection },
            set: { _ in }
        )
        #expect(binding.asCKColor.wrappedValue.rgbComponents().a == 1.0)
    }

    // MARK: - Existential: image-mutating bindings with SPImage

    #if !os(tvOS) && !os(watchOS)
    @available(iOS 16.0, macOS 14.0, visionOS 26.0, *)
    @Test("Existential asImageOffsetY setter updates image offsetY when image present")
    func testExistentialAsImageOffsetYSetterWithImage() {
        guard let spImage = SPImage(systemName: "star.fill") else { return }
        var selection: any SPSelectionProtocol = defaultSymbol
        selection.setImage(spImage)
        let binding = Binding<any SPSelectionProtocol>(
            get: { selection },
            set: { selection = $0 }
        )
        binding.asImageOffsetY.wrappedValue = -3.0
        #expect(selection.getImage()?.offsetY == -3.0)
    }

    @available(iOS 16.0, macOS 14.0, visionOS 26.0, *)
    @Test("Existential asZoom setter updates image zoom when image present")
    func testExistentialAsZoomSetterWithImage() {
        guard let spImage = SPImage(systemName: "star.fill") else { return }
        var selection: any SPSelectionProtocol = defaultSymbol
        selection.setImage(spImage)
        let binding = Binding<any SPSelectionProtocol>(
            get: { selection },
            set: { selection = $0 }
        )
        binding.asZoom.wrappedValue = 2.0
        #expect(selection.getImage()?.zoom == 2.0)
    }
    #endif
}
#endif
