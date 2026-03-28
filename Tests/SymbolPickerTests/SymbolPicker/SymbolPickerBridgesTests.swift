//
//  SymbolPickerBridgesTests.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 28/03/2026.
//

import SwiftUI
import ColorKit
#if canImport(Testing)
import Testing
@testable import SymbolPicker

// MARK: - SymbolPicker-Bridges.swift Tests
//
// Tests for the two types defined in SymbolPicker-Bridges.swift:
//
//   SymbolPickerModifier<DataAsset, Configuration, V: View>: View (public)
//     - internal `init(isPresented:configuration:picker:content:)`
//     - internal stored properties: `isPresented`, `style`, `picker`, `content`
//     - `body` delegates to SymbolPickerViewModifier (not unit-testable)
//
//   SymbolPickerViewModifier<DataAsset, Configuration>: ViewModifier (internal)
//     - internal `init(isPresented:picker:configuration:)`
//     - computed: `isDisplayedAsPopover`, `width`, `height`
//     - `body` applies SwiftUI sheet / popover (not unit-testable)
//
// isDisplayedAsPopover logic (non-iOS):
//   true  when presentationType ∈ {.popover, .default}
//   false otherwise
//
// width  (macOS): 310 when popover, nil otherwise
// height (macOS): 430 when popover, nil otherwise

@MainActor
struct SymbolPickerBridgesTests {

    // MARK: - Helpers

    private var defaultSelection: SPSelection<SPSymbol> {
        SPSelection(symbol: SPSymbol(systemName: "star.fill"))
    }

    private var defaultPicker: SymbolPicker<SPSymbol, SymbolPickerDefaultConfiguration> {
        SymbolPicker(systemImage: .constant("star.fill"))
    }

    /// Builds a SymbolPickerModifier with the given isPresented state and default config.
    private func modifier(
        isPresented: Bool = false
    ) -> SymbolPickerModifier<SPSymbol, SymbolPickerDefaultConfiguration, EmptyView> {
        EmptyView().symbolPicker(
            isPresented: .constant(isPresented),
            systemImage: .constant("star.fill")
        )
    }

    /// Builds a SymbolPickerViewModifier with the given configuration.
    private func viewModifier(
        config: SymbolPickerDefaultConfiguration = SymbolPickerDefaultConfiguration()
    ) -> SymbolPickerViewModifier<SPSymbol, SymbolPickerDefaultConfiguration> {
        SymbolPickerViewModifier(
            isPresented: .constant(false),
            picker: defaultPicker,
            configuration: config
        )
    }

    // =========================================================================
    // MARK: - SymbolPickerModifier
    // =========================================================================

    // MARK: Stored properties

    @Test("SymbolPickerModifier isPresented binding reflects the constant value")
    func testModifierIsPresentedFalse() {
        let m = modifier(isPresented: false)
        #expect(m.isPresented.wrappedValue == false)
    }

    @Test("SymbolPickerModifier isPresented binding reflects true constant")
    func testModifierIsPresentedTrue() {
        let m = modifier(isPresented: true)
        #expect(m.isPresented.wrappedValue == true)
    }

    @Test("SymbolPickerModifier style reflects the passed configuration symbolVariant")
    func testModifierStyleReflectsConfiguration() {
        var config = SymbolPickerDefaultConfiguration()
        config.symbolVariant = .outlined
        let m = EmptyView().symbolPicker(
            isPresented: .constant(false),
            systemImage: .constant("star.fill"),
            configuration: config
        )
        #expect(m.style.symbolVariant == .outlined)
    }

    @Test("SymbolPickerModifier picker carries the correct allowedPageTypes")
    func testModifierPickerAllowedPageTypes() {
        let m = modifier()
        #expect(m.picker.allowedPageTypes == [.symbol])
    }

    @Test("SymbolPickerModifier picker carries the correct allowColorSelection")
    func testModifierPickerAllowColorSelection() {
        let m = modifier()
        #expect(m.picker.allowColorSelection == false)
    }

    @Test("SymbolPickerModifier with selection binding sets allCases page types")
    func testModifierSelectionPickerAllCasesPageTypes() {
        let m = EmptyView().symbolPicker(
            isPresented: .constant(false),
            selection: .constant(defaultSelection)
        )
        #expect(m.picker.allowedPageTypes == SPPageType.allCases)
        #expect(m.picker.allowColorSelection == true)
    }

    // =========================================================================
    // MARK: - SymbolPickerViewModifier
    // =========================================================================

    // MARK: isDisplayedAsPopover

    @Test("SymbolPickerViewModifier isDisplayedAsPopover is true for .default presentation type")
    func testViewModifierIsDisplayedAsPopoverDefault() {
        // Default configuration has presentationType == .default
        let vm = viewModifier()
        #if os(iOS)
        // On iPhone, UIDevice.userInterfaceIdiom != .pad → always false
        // On iPad, it depends on idiom; skip asserting true/false
        _ = vm.isDisplayedAsPopover
        #else
        // On macOS/visionOS/tvOS/watchOS: .default ∈ [.popover, .default] → true
        #expect(vm.isDisplayedAsPopover == true)
        #endif
    }

    @Test("SymbolPickerViewModifier isDisplayedAsPopover is true for .popover presentation type")
    func testViewModifierIsDisplayedAsPopoverPopover() {
        var config = SymbolPickerDefaultConfiguration()
        config.currentPresentationConfiguration = { style in
            SPPresentationConfiguration(style: style).spPresentationType(.popover)
        }
        let vm = viewModifier(config: config)
        #if os(iOS)
        _ = vm.isDisplayedAsPopover
        #else
        #expect(vm.isDisplayedAsPopover == true)
        #endif
    }

    @Test("SymbolPickerViewModifier isDisplayedAsPopover is false for .sheet presentation type")
    func testViewModifierIsDisplayedAsPopoverSheet() {
        var config = SymbolPickerDefaultConfiguration()
        config.currentPresentationConfiguration = { style in
            SPPresentationConfiguration(style: style).spPresentationType(.sheet)
        }
        let vm = viewModifier(config: config)
        // .sheet is not in [.popover, .default] → false on all platforms
        #expect(vm.isDisplayedAsPopover == false)
    }

    @Test("SymbolPickerViewModifier isDisplayedAsPopover is false for .fullScreenCover presentation type")
    func testViewModifierIsDisplayedAsPopoverFullScreenCover() {
        var config = SymbolPickerDefaultConfiguration()
        config.currentPresentationConfiguration = { style in
            SPPresentationConfiguration(style: style).spPresentationType(.fullScreenCover)
        }
        let vm = viewModifier(config: config)
        #expect(vm.isDisplayedAsPopover == false)
    }

    // MARK: width

    @Test("SymbolPickerViewModifier width is non-nil when isDisplayedAsPopover is true (non-iOS)")
    func testViewModifierWidthPopover() {
        #if !os(iOS) && !os(tvOS) && !os(watchOS)
        let vm = viewModifier() // default → isDisplayedAsPopover = true
        #expect(vm.width != nil)
        #endif
    }

    @Test("SymbolPickerViewModifier width is nil when isDisplayedAsPopover is false")
    func testViewModifierWidthSheet() {
        var config = SymbolPickerDefaultConfiguration()
        config.currentPresentationConfiguration = { style in
            SPPresentationConfiguration(style: style).spPresentationType(.sheet)
        }
        let vm = viewModifier(config: config)
        #if os(macOS) || os(visionOS)
        #expect(vm.width == nil)
        #endif
    }

    @Test("SymbolPickerViewModifier width for popover matches expected platform constant")
    func testViewModifierWidthValue() {
        #if os(macOS)
        let vm = viewModifier()
        #expect(vm.width == 310)
        #elseif os(visionOS)
        let vm = viewModifier()
        #expect(vm.width == 370)
        #endif
    }

    // MARK: height

    @Test("SymbolPickerViewModifier height is non-nil when isDisplayedAsPopover is true (non-iOS)")
    func testViewModifierHeightPopover() {
        #if !os(iOS) && !os(tvOS) && !os(watchOS)
        let vm = viewModifier()
        #expect(vm.height != nil)
        #endif
    }

    @Test("SymbolPickerViewModifier height is nil when isDisplayedAsPopover is false")
    func testViewModifierHeightSheet() {
        var config = SymbolPickerDefaultConfiguration()
        config.currentPresentationConfiguration = { style in
            SPPresentationConfiguration(style: style).spPresentationType(.sheet)
        }
        let vm = viewModifier(config: config)
        #if os(macOS) || os(visionOS)
        #expect(vm.height == nil)
        #endif
    }

    @Test("SymbolPickerViewModifier height for popover matches expected platform constant")
    func testViewModifierHeightValue() {
        #if os(macOS)
        let vm = viewModifier()
        #expect(vm.height == 430)
        #elseif os(visionOS)
        let vm = viewModifier()
        #expect(vm.height == 460)
        #endif
    }

    // MARK: Consistency

    @Test("SymbolPickerViewModifier width and height are both nil or both non-nil")
    func testViewModifierWidthHeightConsistency() {
        let vm = viewModifier()
        // Width and height should both be nil (no-popover) or both non-nil (popover)
        let widthIsNil = vm.width == nil
        let heightIsNil = vm.height == nil
        #expect(widthIsNil == heightIsNil)
    }

    @Test("SymbolPickerViewModifier with sheet config: width and height are both nil (non-tvOS)")
    func testViewModifierSheetWidthHeightBothNil() {
        #if !os(tvOS) && !os(watchOS)
        var config = SymbolPickerDefaultConfiguration()
        config.currentPresentationConfiguration = { style in
            SPPresentationConfiguration(style: style).spPresentationType(.sheet)
        }
        let vm = viewModifier(config: config)
        #if os(macOS) || os(visionOS)
        #expect(vm.width == nil)
        #expect(vm.height == nil)
        #endif
        #endif
    }
}
#endif
