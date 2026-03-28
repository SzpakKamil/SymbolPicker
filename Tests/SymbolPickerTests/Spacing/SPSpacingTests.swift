//
//  SPSpacingTests.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 28/03/2026.
//

import SwiftUI
#if canImport(Testing)
import Testing
@testable import SymbolPicker

struct SPSpacingTests {

    // MARK: - SPSpacing.Sizing

    @Test("SPSpacing.Sizing default init has all nil fields")
    func testSizingDefaultInit() {
        let sizing = SPSpacing.Sizing()
        #expect(sizing.width == nil)
        #expect(sizing.height == nil)
        #expect(sizing.horizontalPadding == nil)
        #expect(sizing.verticalPadding == nil)
    }

    @Test("SPSpacing.Sizing stores explicit values")
    func testSizingExplicitValues() {
        let sizing = SPSpacing.Sizing(width: 100, height: 50, horizontalPadding: 10, verticalPadding: 5)
        #expect(sizing.width == 100)
        #expect(sizing.height == 50)
        #expect(sizing.horizontalPadding == 10)
        #expect(sizing.verticalPadding == 5)
    }

    @Test("SPSpacing.Sizing partial init leaves unspecified fields nil")
    func testSizingPartialInit() {
        let sizing = SPSpacing.Sizing(width: 80)
        #expect(sizing.width == 80)
        #expect(sizing.height == nil)
        #expect(sizing.horizontalPadding == nil)
        #expect(sizing.verticalPadding == nil)
    }

    // MARK: - SPSpacing.Component

    @Test("SPSpacing.Component allCases contains exactly three components")
    func testComponentAllCases() {
        #expect(SPSpacing.Component.allCases.count == 3)
        #expect(SPSpacing.Component.allCases.contains(.colorPicker))
        #expect(SPSpacing.Component.allCases.contains(.optionList))
        #expect(SPSpacing.Component.allCases.contains(.previewSelection))
    }

    @Test("SPSpacing.Component equality is correct")
    func testComponentEquality() {
        #expect(SPSpacing.Component.colorPicker == .colorPicker)
        #expect(SPSpacing.Component.optionList != .colorPicker)
        #expect(SPSpacing.Component.previewSelection != .optionList)
    }

    // MARK: - SPSpacing.Attribute

    @Test("SPSpacing.Attribute cases are distinct")
    func testAttributeDistinct() {
        let attrs: [SPSpacing.Attribute] = [.width, .height, .horizontalPadding, .verticalPadding]
        // All four must be representable and switch-exhausted
        for attr in attrs {
            switch attr {
            case .width, .height, .horizontalPadding, .verticalPadding: break
            }
        }
        #expect(attrs.count == 4)
    }

    // MARK: - SPSpacing.getValue(for:at:) — explicit values

    @Test("SPSpacing getValue returns explicit width for .width attribute")
    func testGetValueExplicitWidth() {
        let spacing = SPSpacing(component: .colorPicker, width: 120)
        #expect(spacing.getValue(for: .width, at: .large) == 120)
    }

    @Test("SPSpacing getValue returns explicit height for .height attribute")
    func testGetValueExplicitHeight() {
        let spacing = SPSpacing(component: .colorPicker, height: 60)
        #expect(spacing.getValue(for: .height, at: .large) == 60)
    }

    @Test("SPSpacing getValue returns explicit horizontalPadding")
    func testGetValueExplicitHorizontalPadding() {
        let spacing = SPSpacing(component: .optionList, horizontalPadding: 20)
        #expect(spacing.getValue(for: .horizontalPadding, at: .large) == 20)
    }

    @Test("SPSpacing getValue returns explicit verticalPadding")
    func testGetValueExplicitVerticalPadding() {
        let spacing = SPSpacing(component: .optionList, verticalPadding: 8)
        #expect(spacing.getValue(for: .verticalPadding, at: .large) == 8)
    }

    @Test("SPSpacing getValue returns all four explicit attributes correctly")
    func testGetValueAllExplicitAttributes() {
        let spacing = SPSpacing(
            component: .previewSelection,
            width: 100,
            height: 50,
            horizontalPadding: 10,
            verticalPadding: 5
        )
        #expect(spacing.getValue(for: .width, at: .large) == 100)
        #expect(spacing.getValue(for: .height, at: .large) == 50)
        #expect(spacing.getValue(for: .horizontalPadding, at: .large) == 10)
        #expect(spacing.getValue(for: .verticalPadding, at: .large) == 5)
    }

    // MARK: - SPSpacing.getValue — DynamicTypeSize routing

    @Test("SPSpacing getValue routes DynamicTypeSize through configuration closure")
    func testGetValueDynamicTypeSize() {
        let spacing = SPSpacing(component: .colorPicker) { typeSize in
            switch typeSize {
            case .xSmall: return .init(width: 30)
            default: return .init(width: 60)
            }
        }
        #expect(spacing.getValue(for: .width, at: .xSmall) == 30)
        #expect(spacing.getValue(for: .width, at: .large) == 60)
        #expect(spacing.getValue(for: .width, at: .accessibility5) == 60)
    }

    // MARK: - SPSpacing.getValue — nil falls back to default

    @Test("SPSpacing getValue falls back to default when width is nil")
    func testGetValueFallsBackToDefault() {
        let spacingWithNil = SPSpacing(component: .colorPicker, width: nil)
        let defaults = SymbolPickerDefaultConfiguration.defaultSpacingConfiguration()
        let expected = defaults.getValue(.width, for: .colorPicker, at: .large)
        #expect(spacingWithNil.getValue(for: .width, at: .large) == expected)
    }

    @Test("SPSpacing getValue default fallback returns positive value for standard type size")
    func testGetValueDefaultIsPositive() {
        let spacing = SPSpacing(component: .colorPicker)
        #expect(spacing.getValue(for: .width, at: .large) > 0)
        #expect(spacing.getValue(for: .height, at: .large) > 0)
    }

    // MARK: - Sequence.getValue extension

    @Test("Sequence.getValue returns 0 when component is absent")
    func testSequenceGetValueComponentAbsent() {
        let spacings: [SPSpacing] = [SPSpacing(component: .optionList, width: 100)]
        #expect(spacings.getValue(.width, for: .colorPicker, at: .large) == 0)
    }

    @Test("Sequence.getValue returns 0 for empty sequence")
    func testSequenceGetValueEmpty() {
        let spacings: [SPSpacing] = []
        #expect(spacings.getValue(.width, for: .colorPicker, at: .large) == 0)
        #expect(spacings.getValue(.height, for: .optionList, at: .large) == 0)
    }

    @Test("Sequence.getValue returns value for matching component")
    func testSequenceGetValueMatchingComponent() {
        let spacings: [SPSpacing] = [SPSpacing(component: .colorPicker, width: 42)]
        #expect(spacings.getValue(.width, for: .colorPicker, at: .large) == 42)
    }

    @Test("Sequence.getValue picks the first matching component")
    func testSequenceGetValueFirstMatchWins() {
        let s1 = SPSpacing(component: .colorPicker, width: 100)
        let s2 = SPSpacing(component: .colorPicker, width: 200)
        let spacings = [s1, s2]
        #expect(spacings.getValue(.width, for: .colorPicker, at: .large) == 100)
    }

    @Test("Sequence.getValue resolves correct component when multiple components present")
    func testSequenceGetValueMultipleComponents() {
        let s1 = SPSpacing(component: .colorPicker, width: 50)
        let s2 = SPSpacing(component: .optionList, width: 80)
        let s3 = SPSpacing(component: .previewSelection, width: 120)
        let spacings = [s1, s2, s3]
        #expect(spacings.getValue(.width, for: .colorPicker, at: .large) == 50)
        #expect(spacings.getValue(.width, for: .optionList, at: .large) == 80)
        #expect(spacings.getValue(.width, for: .previewSelection, at: .large) == 120)
    }

    @Test("Sequence.getValue respects DynamicTypeSize through the matched spacing")
    func testSequenceGetValueDynamicTypeSize() {
        let spacing = SPSpacing(component: .colorPicker) { typeSize in
            typeSize == .xSmall ? .init(width: 10) : .init(width: 99)
        }
        let spacings = [spacing]
        #expect(spacings.getValue(.width, for: .colorPicker, at: .xSmall) == 10)
        #expect(spacings.getValue(.width, for: .colorPicker, at: .large) == 99)
    }

    // MARK: - Default spacing configuration

    @Test("defaultSpacingConfiguration returns spacings for all three components")
    func testDefaultSpacingConfigurationCoversAllComponents() {
        let defaults = SymbolPickerDefaultConfiguration.defaultSpacingConfiguration()
        for component in SPSpacing.Component.allCases {
            let width = defaults.getValue(.width, for: component, at: .large)
            #expect(width > 0, "Expected positive default width for \(component)")
        }
    }

    @Test("defaultSpacingConfiguration values scale with DynamicTypeSize")
    func testDefaultSpacingScalesWithTypeSize() {
        let defaults = SymbolPickerDefaultConfiguration.defaultSpacingConfiguration()
        let small = defaults.getValue(.width, for: .colorPicker, at: .xSmall)
        let large = defaults.getValue(.width, for: .colorPicker, at: .accessibility5)
        // Larger type size should produce a larger or equal width
        #expect(large >= small)
    }
}
#endif
