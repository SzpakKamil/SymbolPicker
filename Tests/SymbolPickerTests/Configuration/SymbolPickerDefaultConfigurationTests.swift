//
//  SymbolPickerDefaultConfigurationTests.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 28/03/2026.
//

import SwiftUI
#if canImport(Testing)
import Testing
@testable import SymbolPicker

@MainActor
struct SymbolPickerDefaultConfigurationTests {

    // MARK: - Default property values after init()

    @Test("SymbolPickerDefaultConfiguration symbolVariant defaults to .filled")
    func testSymbolVariantDefault() {
        let config = SymbolPickerDefaultConfiguration()
        #expect(config.symbolVariant == .filled)
    }

    @Test("SymbolPickerDefaultConfiguration supportedTypes defaults to all page types")
    func testSupportedTypesDefault() {
        let config = SymbolPickerDefaultConfiguration()
        #expect(config.supportedTypes == SPPageType.allCases)
    }

    @Test("SymbolPickerDefaultConfiguration defaultType defaults to .symbol")
    func testDefaultTypeDefault() {
        let config = SymbolPickerDefaultConfiguration()
        #expect(config.defaultType == .symbol)
    }

    @Test("SymbolPickerDefaultConfiguration allowSearching defaults to true")
    func testAllowSearchingDefault() {
        let config = SymbolPickerDefaultConfiguration()
        #expect(config.allowSearching == true)
    }

    @Test("SymbolPickerDefaultConfiguration displayStyle matches OS-version availability")
    func testDisplayStyleDefault() {
        let config = SymbolPickerDefaultConfiguration()
        if #available(iOS 26.0, visionOS 26.0, tvOS 26.0, watchOS 26.0, *) {
            #expect(config.displayStyle == .compact)
        } else {
            #expect(config.displayStyle == .detail)
        }
    }

    // MARK: - Mutable properties can be set

    @Test("SymbolPickerDefaultConfiguration symbolVariant can be changed to .outlined")
    func testMutatingSymbolVariant() {
        var config = SymbolPickerDefaultConfiguration()
        config.symbolVariant = .outlined
        #expect(config.symbolVariant == .outlined)
    }

    @Test("SymbolPickerDefaultConfiguration supportedTypes can be narrowed to [.symbol]")
    func testMutatingSupportedTypes() {
        var config = SymbolPickerDefaultConfiguration()
        config.supportedTypes = [.symbol]
        #expect(config.supportedTypes == [.symbol])
    }

    @Test("SymbolPickerDefaultConfiguration defaultType can be changed to .emoji")
    func testMutatingDefaultType() {
        var config = SymbolPickerDefaultConfiguration()
        config.defaultType = .emoji
        #expect(config.defaultType == .emoji)
    }

    @Test("SymbolPickerDefaultConfiguration allowSearching can be set to false")
    func testMutatingAllowSearching() {
        var config = SymbolPickerDefaultConfiguration()
        config.allowSearching = false
        #expect(config.allowSearching == false)
    }

    @Test("SymbolPickerDefaultConfiguration displayStyle can be set to .plain")
    func testMutatingDisplayStyle() {
        var config = SymbolPickerDefaultConfiguration()
        config.displayStyle = .plain
        #expect(config.displayStyle == .plain)
    }

    // MARK: - Method: presentationConfiguration()

    @Test("SymbolPickerDefaultConfiguration presentationConfiguration() returns without crash")
    func testPresentationConfigurationReturns() {
        let config = SymbolPickerDefaultConfiguration()
        let result = config.presentationConfiguration()
        _ = result // type is SPPresentationConfiguration
    }

    @Test("SymbolPickerDefaultConfiguration custom presentationConfiguration closure is called")
    func testCustomPresentationClosure() {
        var config = SymbolPickerDefaultConfiguration()
        var called = false
        config.currentPresentationConfiguration = { style in
            called = true
            return SPPresentationConfiguration(style: style)
        }
        _ = config.presentationConfiguration()
        #expect(called)
    }

    // MARK: - Method: colorPickerConfiguration()

    @Test("SymbolPickerDefaultConfiguration colorPickerConfiguration() returns non-nil by default")
    func testColorPickerConfigurationNonNilDefault() {
        let config = SymbolPickerDefaultConfiguration()
        #expect(config.colorPickerConfiguration() != nil)
    }

    @Test("SymbolPickerDefaultConfiguration custom colorPickerConfiguration closure returning nil")
    func testCustomColorPickerClosureNil() {
        var config = SymbolPickerDefaultConfiguration()
        config.currentColorPickerConfiguration = { _ in nil }
        #expect(config.colorPickerConfiguration() == nil)
    }

    @Test("SymbolPickerDefaultConfiguration custom colorPickerConfiguration closure is called")
    func testCustomColorPickerClosureCalled() {
        var config = SymbolPickerDefaultConfiguration()
        var called = false
        config.currentColorPickerConfiguration = { style in
            called = true
            return SPColorPickerConfiguration(style: style)
        }
        _ = config.colorPickerConfiguration()
        #expect(called)
    }

    // MARK: - Method: optionListConfiguration()

    @Test("SymbolPickerDefaultConfiguration optionListConfiguration() returns without crash")
    func testOptionListConfigurationReturns() {
        let config = SymbolPickerDefaultConfiguration()
        _ = config.optionListConfiguration()
    }

    @Test("SymbolPickerDefaultConfiguration custom optionListConfiguration closure is called")
    func testCustomOptionListClosure() {
        var config = SymbolPickerDefaultConfiguration()
        var called = false
        config.currentOptionListConfiguration = { style in
            called = true
            return SPOptionListConfiguration(style: style)
        }
        _ = config.optionListConfiguration()
        #expect(called)
    }

    // MARK: - Method: selectionPreviewConfiguration()

    @Test("SymbolPickerDefaultConfiguration selectionPreviewConfiguration() returns without crash")
    func testSelectionPreviewConfigurationReturns() {
        let config = SymbolPickerDefaultConfiguration()
        _ = config.selectionPreviewConfiguration()
    }

    @Test("SymbolPickerDefaultConfiguration custom selectionPreviewConfiguration closure is called")
    func testCustomSelectionPreviewClosure() {
        var config = SymbolPickerDefaultConfiguration()
        var called = false
        config.currentSelectionPreviewConfiguration = { _ in
            called = true
            return SPSelectionPreviewConfiguration()
        }
        _ = config.selectionPreviewConfiguration()
        #expect(called)
    }

    // MARK: - Method: insetViewsConfiguration()

    @Test("SymbolPickerDefaultConfiguration insetViewsConfiguration() returns an array")
    func testInsetViewsConfigurationReturnsArray() {
        let config = SymbolPickerDefaultConfiguration()
        let views = config.insetViewsConfiguration()
        _ = views // [SPInsetedView], may be empty on .plain displayStyle
    }

    @Test("SymbolPickerDefaultConfiguration insetViews is empty when displayStyle is .plain")
    func testInsetViewsEmptyForPlainDisplayStyle() {
        var config = SymbolPickerDefaultConfiguration()
        config.displayStyle = .plain
        let views = config.insetViewsConfiguration()
        #expect(views.isEmpty)
    }

    @Test("SymbolPickerDefaultConfiguration custom insetViewConfiguration closure is called")
    func testCustomInsetViewClosure() {
        var config = SymbolPickerDefaultConfiguration()
        var called = false
        config.currentInsetViewConfiguration = { _, _ in
            called = true
            return []
        }
        _ = config.insetViewsConfiguration()
        #expect(called)
    }

    // MARK: - Method: spacingConfiguration()

    @Test("SymbolPickerDefaultConfiguration spacingConfiguration() returns non-empty array")
    func testSpacingConfigurationNonEmpty() {
        let config = SymbolPickerDefaultConfiguration()
        let spacings = config.spacingConfiguration()
        #expect(!spacings.isEmpty)
    }

    @Test("SymbolPickerDefaultConfiguration spacingConfiguration() covers all components")
    func testSpacingConfigurationCoversAllComponents() {
        let config = SymbolPickerDefaultConfiguration()
        let spacings = config.spacingConfiguration()
        for component in SPSpacing.Component.allCases {
            let width = spacings.getValue(.width, for: component, at: .large)
            #expect(width > 0, "Expected positive width for component \(component)")
        }
    }

    @Test("SymbolPickerDefaultConfiguration custom spacingConfiguration closure returns custom spacings")
    func testCustomSpacingClosure() {
        var config = SymbolPickerDefaultConfiguration()
        let sentinel = SPSpacing(component: .colorPicker, width: 777)
        config.currentSpacingConfiguration = { _ in [sentinel] }
        let spacings = config.spacingConfiguration()
        #expect(spacings.getValue(.width, for: .colorPicker, at: .large) == 777)
    }

    // MARK: - Protocol conformance: defaultSpacingConfiguration()

    @Test("SymbolPickerDefaultConfiguration.defaultSpacingConfiguration() returns non-empty")
    func testStaticDefaultSpacingNonEmpty() {
        let spacings = SymbolPickerDefaultConfiguration.defaultSpacingConfiguration()
        #expect(!spacings.isEmpty)
    }

    @Test("SymbolPickerDefaultConfiguration.defaultInsetViews for .plain returns empty")
    func testStaticDefaultInsetViewsPlain() {
        let views = SymbolPickerDefaultConfiguration.defaultInsetViews(for: .plain, colorPicker: nil)
        #expect(views.isEmpty)
    }

    @Test("SymbolPickerDefaultConfiguration.defaultInsetViews for non-plain displayStyle returns views")
    func testStaticDefaultInsetViewsNonPlain() {
        let views = SymbolPickerDefaultConfiguration.defaultInsetViews(for: .compact, colorPicker: nil)
        #expect(!views.isEmpty)
    }
}
#endif
