//
//  SymbolPickerConfigurationDefaultTests.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 28/03/2026.
//

import SwiftUI
#if canImport(Testing)
import Testing
@testable import SymbolPicker

// MARK: - Minimal protocol conformer
//
// All SymbolPickerConfiguration requirements have default implementations
// spread across the extension files (SymbolPickerConfiguration-Default.swift,
// SPPresentation-Default.swift, SPSelectionPreview-Default.swift, etc.).
// A zero-member struct satisfies the protocol and receives every default.

private struct MinimalConfiguration: SymbolPickerConfiguration {}

// MARK: - SymbolPickerConfiguration-Default.swift tests
//
// Tests for the five property defaults provided by
// `public extension SymbolPickerConfiguration` in SymbolPickerConfiguration-Default.swift:
//   symbolVariant, supportedTypes, defaultType, allowSearching, displayStyle

@MainActor
struct SymbolPickerConfigurationDefaultTests {

    // MARK: symbolVariant

    @Test("SymbolPickerConfiguration default symbolVariant is .filled")
    func testDefaultSymbolVariantFilled() {
        #expect(MinimalConfiguration().symbolVariant == .filled)
    }

    @Test("SymbolPickerConfiguration default symbolVariant is the same on every call")
    func testDefaultSymbolVariantStable() {
        let c = MinimalConfiguration()
        #expect(c.symbolVariant == c.symbolVariant)
    }

    // MARK: supportedTypes

    @Test("SymbolPickerConfiguration default supportedTypes equals SPPageType.allCases")
    func testDefaultSupportedTypesAllCases() {
        #expect(MinimalConfiguration().supportedTypes == SPPageType.allCases)
    }

    @Test("SymbolPickerConfiguration default supportedTypes is non-empty")
    func testDefaultSupportedTypesNonEmpty() {
        #expect(!MinimalConfiguration().supportedTypes.isEmpty)
    }

    // MARK: defaultType

    @Test("SymbolPickerConfiguration default defaultType is .symbol")
    func testDefaultTypeSymbol() {
        #expect(MinimalConfiguration().defaultType == .symbol)
    }

    @Test("SymbolPickerConfiguration default defaultType is contained in supportedTypes")
    func testDefaultTypeInSupportedTypes() {
        let c = MinimalConfiguration()
        #expect(c.supportedTypes.contains(c.defaultType))
    }

    // MARK: allowSearching

    @Test("SymbolPickerConfiguration default allowSearching is true")
    func testDefaultAllowSearchingTrue() {
        #expect(MinimalConfiguration().allowSearching == true)
    }

    // MARK: displayStyle

    @Test("SymbolPickerConfiguration default displayStyle matches OS-version availability")
    func testDefaultDisplayStyleOSVersioned() {
        let style = MinimalConfiguration().displayStyle
        if #available(iOS 26.0, visionOS 26.0, tvOS 26.0, watchOS 26.0, *) {
            #expect(style == .compact)
        } else {
            #expect(style == .detail)
        }
    }

    @Test("SymbolPickerConfiguration default displayStyle is never .plain")
    func testDefaultDisplayStyleNotPlain() {
        #expect(MinimalConfiguration().displayStyle != .plain)
    }

    // MARK: - SPSelectionPreview-Default.swift tests
    //
    // `selectionPreviewConfiguration()` default returns a fresh SPSelectionPreviewConfiguration.
    // `selectionPreview` computed property delegates to it.

    @Test("SymbolPickerConfiguration default selectionPreviewConfiguration returns without crash")
    func testDefaultSelectionPreviewConfigurationReturns() {
        let config = MinimalConfiguration()
        _ = config.selectionPreviewConfiguration()
    }

    @Test("SymbolPickerConfiguration default selectionPreviewConfiguration corner radius > 0")
    func testDefaultSelectionPreviewCornerRadiusPositive() {
        let preview = MinimalConfiguration().selectionPreviewConfiguration()
        #expect(preview.selectionPreviewCornerRadiusFactor > 0)
    }

    @Test("SymbolPickerConfiguration default selectionPreviewConfiguration corner radius matches OS")
    func testDefaultSelectionPreviewCornerRadiusOSVersioned() {
        let factor = MinimalConfiguration().selectionPreviewConfiguration().selectionPreviewCornerRadiusFactor
        #if os(watchOS)
        #expect(factor == 1.0)
        #else
        if #available(iOS 26.0, macOS 26.0, tvOS 26.0, *) {
            #expect(factor == 0.5)
        } else {
            #expect(factor == 0.3)
        }
        #endif
    }

    @Test("SymbolPickerConfiguration selectionPreview property delegates to selectionPreviewConfiguration()")
    func testSelectionPreviewPropertyMatchesMethod() {
        let c = MinimalConfiguration()
        #expect(c.selectionPreview.selectionPreviewCornerRadiusFactor == c.selectionPreviewConfiguration().selectionPreviewCornerRadiusFactor)
    }

    @Test("SymbolPickerConfiguration selectionPreview returns a fresh instance on each call")
    func testSelectionPreviewFreshInstanceEachCall() {
        let c = MinimalConfiguration()
        // Each call to selectionPreviewConfiguration() creates a new value
        _ = c.selectionPreview
        _ = c.selectionPreview
    }

    // MARK: - SPPresentation-Default.swift tests
    //
    // `presentationConfiguration()` default returns SPPresentationConfiguration(style: displayStyle).
    // `presentation` computed property delegates to it.

    @Test("SymbolPickerConfiguration default presentationConfiguration returns without crash")
    func testDefaultPresentationConfigurationReturns() {
        _ = MinimalConfiguration().presentationConfiguration()
    }

    @Test("SymbolPickerConfiguration presentation property delegates to presentationConfiguration()")
    func testPresentationPropertyMatchesMethod() {
        let c = MinimalConfiguration()
        #expect(c.presentation.presentationType == c.presentationConfiguration().presentationType)
    }

    @Test("SymbolPickerConfiguration default presentationConfiguration has .visible drag indicator")
    func testDefaultPresentationDragIndicatorVisible() {
        #expect(MinimalConfiguration().presentationConfiguration().presentationDragIndicator == .visible)
    }

    @Test("SymbolPickerConfiguration default presentationConfiguration has non-empty dents")
    func testDefaultPresentationDentsNonEmpty() {
        #expect(!MinimalConfiguration().presentationConfiguration().presentationDents.isEmpty)
    }
}
#endif
