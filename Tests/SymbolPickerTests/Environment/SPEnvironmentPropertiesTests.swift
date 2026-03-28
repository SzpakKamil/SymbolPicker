//
//  SPEnvironmentPropertiesTests.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 28/03/2026.
//

import SwiftUI
import ColorKit
#if canImport(Testing)
import Testing
@testable import SymbolPicker

// MARK: - Environment Properties Tests
//
// Tests for all 10 EnvironmentKey extensions in the Environment/ directory.
//
// Public environment properties (public extension EnvironmentValues):
//   spSymbolVariant           SPSymbolVariantEnvironment.swift          default: .filled
//   spSearchText              SPSearchTextEnvironmentProperty.swift      default: .constant("")
//   spSelection               SPSelectionEnviromentProperty.swift        default: .constant(SPSelection<SPSymbol>(...))
//   spPageType                SPPageTypeEnvironmentProperty.swift        default: .constant(.symbol)
//   spAllowedPageTypes        SPAllowedPageTypesEnvironmentProperty.swift default: SPPageType.allCases
//   spAllowsColorSelection    SPAllowsColorSelectionEnvironmentProperty.swift default: true
//   symbolPickerStyle         SymbolPickerStyleEnvironment.swift         default: SymbolPickerDefaultConfiguration()
//
// Internal environment properties (extension EnvironmentValues, no public):
//   spHorizontalPadding       SPHorizontalPaddingValueEnvironmentProperty.swift  default: 0
//   spPreviewCalculateOffset  SPPreviewCalculateOffsetEnvironmentProperty.swift  default: 0
//   spPreviewCalculateScale   SPPreviewCalculateScaleEnvironmentProperty.swift   default: 1.0
//
// Also tested: `Binding.eraseToAnySPSelectionProtocol()` defined alongside spSelection.
//
// Strategy: `EnvironmentValues()` produces a fresh environment where every key
// returns its `defaultValue`. Set/get is verified by mutating a local `var env`.

@MainActor
struct SPEnvironmentPropertiesTests {

    // =========================================================================
    // MARK: - spSymbolVariant
    // =========================================================================

    @Test("spSymbolVariant default value is .filled")
    func testSymbolVariantDefault() {
        let env = EnvironmentValues()
        #expect(env.spSymbolVariant == .filled)
    }

    @Test("spSymbolVariant can be set to .outlined")
    func testSymbolVariantSetOutlined() {
        var env = EnvironmentValues()
        env.spSymbolVariant = .outlined
        #expect(env.spSymbolVariant == .outlined)
    }

    // =========================================================================
    // MARK: - spSearchText
    // =========================================================================

    @Test("spSearchText default wrappedValue is empty string")
    func testSearchTextDefaultEmpty() {
        let env = EnvironmentValues()
        #expect(env.spSearchText.wrappedValue == "")
    }

    @Test("spSearchText can be set to a constant binding with a non-empty string")
    func testSearchTextSetNonEmpty() {
        var env = EnvironmentValues()
        env.spSearchText = .constant("star")
        #expect(env.spSearchText.wrappedValue == "star")
    }

    @Test("spSearchText wrappedValue reflects a live binding")
    func testSearchTextLiveBinding() {
        var env = EnvironmentValues()
        var text = "hello"
        env.spSearchText = Binding(get: { text }, set: { text = $0 })
        #expect(env.spSearchText.wrappedValue == "hello")
        env.spSearchText.wrappedValue = "world"
        #expect(text == "world")
    }

    // =========================================================================
    // MARK: - spPageType
    // =========================================================================

    @Test("spPageType default wrappedValue is .symbol")
    func testPageTypeDefaultSymbol() {
        let env = EnvironmentValues()
        #expect(env.spPageType.wrappedValue == .symbol)
    }

    @Test("spPageType can be set to a constant binding with .emoji")
    func testPageTypeSetEmoji() {
        var env = EnvironmentValues()
        env.spPageType = .constant(.emoji)
        #expect(env.spPageType.wrappedValue == .emoji)
    }

    @Test("spPageType wrappedValue reflects a live binding")
    func testPageTypeLiveBinding() {
        var env = EnvironmentValues()
        var page: SPPageType = .symbol
        env.spPageType = Binding(get: { page }, set: { page = $0 })
        #expect(env.spPageType.wrappedValue == .symbol)
        env.spPageType.wrappedValue = .emoji
        #expect(page == .emoji)
    }

    // =========================================================================
    // MARK: - spAllowedPageTypes
    // =========================================================================

    @Test("spAllowedPageTypes default is SPPageType.allCases")
    func testAllowedPageTypesDefault() {
        let env = EnvironmentValues()
        #expect(env.spAllowedPageTypes == SPPageType.allCases)
    }

    @Test("spAllowedPageTypes can be set to [.symbol]")
    func testAllowedPageTypesSetSymbolOnly() {
        var env = EnvironmentValues()
        env.spAllowedPageTypes = [.symbol]
        #expect(env.spAllowedPageTypes == [.symbol])
    }

    @Test("spAllowedPageTypes can be set to [.emoji, .symbol]")
    func testAllowedPageTypesSetMultiple() {
        var env = EnvironmentValues()
        env.spAllowedPageTypes = [.emoji, .symbol]
        #expect(env.spAllowedPageTypes == [.emoji, .symbol])
    }

    @Test("spAllowedPageTypes can be set to empty array")
    func testAllowedPageTypesSetEmpty() {
        var env = EnvironmentValues()
        env.spAllowedPageTypes = []
        #expect(env.spAllowedPageTypes.isEmpty)
    }

    // =========================================================================
    // MARK: - spAllowsColorSelection
    // =========================================================================

    @Test("spAllowsColorSelection default is true")
    func testAllowsColorSelectionDefault() {
        let env = EnvironmentValues()
        #expect(env.spAllowsColorSelection == true)
    }

    @Test("spAllowsColorSelection can be set to false")
    func testAllowsColorSelectionSetFalse() {
        var env = EnvironmentValues()
        env.spAllowsColorSelection = false
        #expect(env.spAllowsColorSelection == false)
    }

    @Test("spAllowsColorSelection can be set back to true")
    func testAllowsColorSelectionSetTrue() {
        var env = EnvironmentValues()
        env.spAllowsColorSelection = false
        env.spAllowsColorSelection = true
        #expect(env.spAllowsColorSelection == true)
    }

    // =========================================================================
    // MARK: - spHorizontalPadding (internal)
    // =========================================================================

    @Test("spHorizontalPadding default is 0")
    func testHorizontalPaddingDefault() {
        let env = EnvironmentValues()
        #expect(env.spHorizontalPadding == 0)
    }

    @Test("spHorizontalPadding can be set to a positive value")
    func testHorizontalPaddingSetPositive() {
        var env = EnvironmentValues()
        env.spHorizontalPadding = 16
        #expect(env.spHorizontalPadding == 16)
    }

    @Test("spHorizontalPadding can be set to a negative value")
    func testHorizontalPaddingSetNegative() {
        var env = EnvironmentValues()
        env.spHorizontalPadding = -8
        #expect(env.spHorizontalPadding == -8)
    }

    @Test("spHorizontalPadding round-trips through set then get")
    func testHorizontalPaddingRoundTrip() {
        var env = EnvironmentValues()
        env.spHorizontalPadding = 24.5
        #expect(env.spHorizontalPadding == 24.5)
    }

    // =========================================================================
    // MARK: - spPreviewCalculateOffset (internal)
    // =========================================================================

    @Test("spPreviewCalculateOffset default is 0")
    func testPreviewCalculateOffsetDefault() {
        let env = EnvironmentValues()
        #expect(env.spPreviewCalculateOffset == 0)
    }

    @Test("spPreviewCalculateOffset can be set to a positive value")
    func testPreviewCalculateOffsetSetPositive() {
        var env = EnvironmentValues()
        env.spPreviewCalculateOffset = 10
        #expect(env.spPreviewCalculateOffset == 10)
    }

    @Test("spPreviewCalculateOffset can be set to a negative value")
    func testPreviewCalculateOffsetSetNegative() {
        var env = EnvironmentValues()
        env.spPreviewCalculateOffset = -30
        #expect(env.spPreviewCalculateOffset == -30)
    }

    // =========================================================================
    // MARK: - spPreviewCalculateScale (internal)
    // =========================================================================

    @Test("spPreviewCalculateScale default is 1.0")
    func testPreviewCalculateScaleDefault() {
        let env = EnvironmentValues()
        #expect(env.spPreviewCalculateScale == 1.0)
    }

    @Test("spPreviewCalculateScale can be set to 0.5")
    func testPreviewCalculateScaleSetHalf() {
        var env = EnvironmentValues()
        env.spPreviewCalculateScale = 0.5
        #expect(env.spPreviewCalculateScale == 0.5)
    }

    @Test("spPreviewCalculateScale can be set to 2.0")
    func testPreviewCalculateScaleSetDouble() {
        var env = EnvironmentValues()
        env.spPreviewCalculateScale = 2.0
        #expect(env.spPreviewCalculateScale == 2.0)
    }

    @Test("spPreviewCalculateScale can be set to 0.0")
    func testPreviewCalculateScaleSetZero() {
        var env = EnvironmentValues()
        env.spPreviewCalculateScale = 0.0
        #expect(env.spPreviewCalculateScale == 0.0)
    }

    // =========================================================================
    // MARK: - symbolPickerStyle
    // =========================================================================

    @Test("symbolPickerStyle default is SymbolPickerDefaultConfiguration")
    func testSymbolPickerStyleDefaultType() {
        let env = EnvironmentValues()
        #expect(env.symbolPickerStyle is SymbolPickerDefaultConfiguration)
    }

    @Test("symbolPickerStyle default allowSearching is true")
    func testSymbolPickerStyleDefaultAllowSearching() {
        let env = EnvironmentValues()
        let config = env.symbolPickerStyle as? SymbolPickerDefaultConfiguration
        #expect(config?.allowSearching == true)
    }

    @Test("symbolPickerStyle can be set to a modified SymbolPickerDefaultConfiguration")
    func testSymbolPickerStyleSetModified() {
        var env = EnvironmentValues()
        var config = SymbolPickerDefaultConfiguration()
        config.allowSearching = false
        env.symbolPickerStyle = config
        let retrieved = env.symbolPickerStyle as? SymbolPickerDefaultConfiguration
        #expect(retrieved?.allowSearching == false)
    }

    @Test("symbolPickerStyle symbolVariant survives round-trip through EnvironmentValues")
    func testSymbolPickerStyleSymbolVariantRoundTrip() {
        var env = EnvironmentValues()
        var config = SymbolPickerDefaultConfiguration()
        config.symbolVariant = .outlined
        env.symbolPickerStyle = config
        let retrieved = env.symbolPickerStyle as? SymbolPickerDefaultConfiguration
        #expect(retrieved?.symbolVariant == .outlined)
    }

    // =========================================================================
    // MARK: - spSelection
    // =========================================================================

    @Test("spSelection default wrappedValue is SPSelection<SPSymbol>")
    func testSelectionDefaultType() {
        let env = EnvironmentValues()
        #expect(env.spSelection.wrappedValue is SPSelection<SPSymbol>)
    }

    @Test("spSelection can be set to a constant binding wrapping SPSelection<SPSymbol>")
    func testSelectionSetSymbol() {
        var env = EnvironmentValues()
        let selection = SPSelection<SPSymbol>(symbol: SPSymbol(systemName: "star.fill"))
        env.spSelection = Binding.constant(selection).eraseToAnySPSelectionProtocol()
        #expect(env.spSelection.wrappedValue is SPSelection<SPSymbol>)
    }

    @Test("spSelection can be set to a constant binding wrapping SPSelection<SPEmoji>")
    func testSelectionSetEmoji() {
        var env = EnvironmentValues()
        let selection = SPSelection<SPEmoji>(emoji: SPEmoji("1F600"))
        env.spSelection = Binding.constant(selection).eraseToAnySPSelectionProtocol()
        #expect(env.spSelection.wrappedValue is SPSelection<SPEmoji>)
    }

    // =========================================================================
    // MARK: - Binding.eraseToAnySPSelectionProtocol()
    // =========================================================================

    @Test("eraseToAnySPSelectionProtocol wrappedValue returns the original selection")
    func testEraseWrappedValueType() {
        let selection = SPSelection<SPSymbol>(symbol: SPSymbol(systemName: "star.fill"))
        let erased = Binding.constant(selection).eraseToAnySPSelectionProtocol()
        #expect(erased.wrappedValue is SPSelection<SPSymbol>)
    }

    @Test("eraseToAnySPSelectionProtocol setter updates underlying value when type matches")
    func testEraseSetterMatchingType() {
        var value = SPSelection<SPSymbol>(symbol: SPSymbol(systemName: "star.fill"))
        let erased = Binding<SPSelection<SPSymbol>>(
            get: { value },
            set: { value = $0 }
        ).eraseToAnySPSelectionProtocol()

        let newSelection = SPSelection<SPSymbol>(symbol: SPSymbol(systemName: "heart.fill"))
        erased.wrappedValue = newSelection

        guard let updated = value.getSymbol() else {
            Issue.record("Expected underlying value to be updated to heart.fill")
            return
        }
        #expect(updated.filledName == "heart.fill")
    }

    @Test("eraseToAnySPSelectionProtocol setter is no-op when type does not match")
    func testEraseSetterNonMatchingType() {
        var value = SPSelection<SPSymbol>(symbol: SPSymbol(systemName: "star.fill"))
        let original = value

        let erased = Binding<SPSelection<SPSymbol>>(
            get: { value },
            set: { value = $0 }
        ).eraseToAnySPSelectionProtocol()

        // Setting with SPSelection<SPEmoji> (wrong concrete type) should be silently ignored.
        let emojiSelection = SPSelection<SPEmoji>(emoji: SPEmoji("1F600"))
        erased.wrappedValue = emojiSelection

        #expect(value == original)
    }

    @Test("eraseToAnySPSelectionProtocol getter reflects live binding changes")
    func testEraseGetterReflectsLiveChanges() {
        var value = SPSelection<SPSymbol>(symbol: SPSymbol(systemName: "star.fill"))
        let erased = Binding<SPSelection<SPSymbol>>(
            get: { value },
            set: { value = $0 }
        ).eraseToAnySPSelectionProtocol()

        #expect(erased.wrappedValue is SPSelection<SPSymbol>)

        // Mutate the underlying value directly and confirm the erased binding reflects it.
        value = SPSelection<SPSymbol>(symbol: SPSymbol(systemName: "moon.fill"))
        let symbol = (erased.wrappedValue as? SPSelection<SPSymbol>)?.getSymbol()
        #expect(symbol?.filledName == "moon.fill")
    }

    @Test("eraseToAnySPSelectionProtocol works with SPSelection<SPEmoji>")
    func testEraseWithEmojiSelection() {
        var value = SPSelection<SPEmoji>(emoji: SPEmoji("1F600"))
        let erased = Binding<SPSelection<SPEmoji>>(
            get: { value },
            set: { value = $0 }
        ).eraseToAnySPSelectionProtocol()

        #expect(erased.wrappedValue is SPSelection<SPEmoji>)

        let newEmoji = SPSelection<SPEmoji>(emoji: SPEmoji("1F602"))
        erased.wrappedValue = newEmoji
        #expect((erased.wrappedValue as? SPSelection<SPEmoji>)?.getEmoji()?.id == "1F602")
    }
}
#endif
