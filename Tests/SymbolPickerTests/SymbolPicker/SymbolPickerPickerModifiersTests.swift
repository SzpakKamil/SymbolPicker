//
//  SymbolPickerPickerModifiersTests.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 28/03/2026.
//

import SwiftUI
import ColorKit
#if canImport(Testing)
import Testing
@testable import SymbolPicker

// MARK: - SymbolPicker-PickerModifiers Tests
//
// Tests for all modifiers declared in SymbolPicker-PickerModifiers.swift.
// The file defines two parallel extension blocks:
//   • `public extension SymbolPicker where Configuration == SymbolPickerDefaultConfiguration`
//   • `public extension SymbolPickerModifier where Configuration == SymbolPickerDefaultConfiguration`
//
// Strategy: each modifier mutates a copy's `style` (SymbolPickerDefaultConfiguration).
// Tests apply the modifier, then inspect `style.*Configuration()` to confirm the
// expected property was set. `SymbolPicker.style` and `SymbolPickerModifier.style`
// are both `internal`, accessible via `@testable import`.
//
// NOTE — spColorPickerSupportsOpacity source bug:
//   `spColorPickerSupportsOpacity(_ value: Bool)` contains a self-assignment:
//     `results.supportOpacity = supportOpacity`   // should be `value`
//   The `value` argument is silently ignored. Tests document actual behavior.

@MainActor
struct SymbolPickerPickerModifiersTests {

    // MARK: - Helpers

    private var defaultSelection: SPSelection<SPSymbol> {
        SPSelection(symbol: SPSymbol(systemName: "star.fill"))
    }
    private var defaultEmoji: SPEmoji { SPEmoji("1F600") }
    private var defaultCKColor: CKColor { CKColor(red: 0, green: 0.5, blue: 1, opacity: 1) }
    private var red: CKColor { CKColor(red: 1, green: 0, blue: 0, opacity: 1) }
    private var blue: CKColor { CKColor(red: 0, green: 0, blue: 1, opacity: 1) }

    /// A basic SymbolPickerModifier used for the SymbolPickerModifier extension tests.
    private var defaultModifier: SymbolPickerModifier<SPSymbol, SymbolPickerDefaultConfiguration, EmptyView> {
        EmptyView().symbolPicker(
            isPresented: .constant(false),
            systemImage: .constant("star.fill")
        )
    }

    // =========================================================================
    // MARK: - SymbolPicker extension tests
    // =========================================================================

    // MARK: spDisplayStyle

    @available(iOS 16.4, *)
    @Test("SymbolPicker.spDisplayStyle(.detail) sets displayStyle to .detail")
    func testPickerDisplayStyleDetail() {
        let picker = SymbolPicker(selection: .constant(defaultSelection))
            .spDisplayStyle(.detail)
        #expect(picker.style.displayStyle == .detail)
    }

    @available(iOS 16.4, *)
    @Test("SymbolPicker.spDisplayStyle(.plain) sets displayStyle to .plain")
    func testPickerDisplayStylePlain() {
        let picker = SymbolPicker(selection: .constant(defaultSelection))
            .spDisplayStyle(.plain)
        #expect(picker.style.displayStyle == .plain)
    }

    // MARK: spSymbolsVariant

    @Test("SymbolPicker.spSymbolsVariant(.outlined) sets symbolVariant to .outlined")
    func testPickerSymbolVariantOutlined() {
        let picker = SymbolPicker(selection: .constant(defaultSelection))
            .spSymbolsVariant(.outlined)
        #expect(picker.style.symbolVariant == .outlined)
    }

    @Test("SymbolPicker.spSymbolsVariant(.filled) sets symbolVariant to .filled")
    func testPickerSymbolVariantFilled() {
        let picker = SymbolPicker(selection: .constant(defaultSelection))
            .spSymbolsVariant(.filled)
        #expect(picker.style.symbolVariant == .filled)
    }

    // MARK: spAllowSearching

    @Test("SymbolPicker.spAllowSearching(false) sets allowSearching to false")
    func testPickerAllowSearchingFalse() {
        let picker = SymbolPicker(selection: .constant(defaultSelection))
            .spAllowSearching(false)
        #expect(picker.style.allowSearching == false)
    }

    @Test("SymbolPicker.spAllowSearching(true) keeps allowSearching as true")
    func testPickerAllowSearchingTrue() {
        let picker = SymbolPicker(selection: .constant(defaultSelection))
            .spAllowSearching(true)
        #expect(picker.style.allowSearching == true)
    }

    // MARK: spPageTypes (variadic)

    @Test("SymbolPicker.spPageTypes variadic sets supportedTypes and defaultType")
    func testPickerPageTypesVariadic() {
        let picker = SymbolPicker(selection: .constant(defaultSelection))
            .spPageTypes(.symbol, .emoji, defaultType: .symbol)
        #expect(picker.style.supportedTypes == [.symbol, .emoji])
        #expect(picker.style.defaultType == .symbol)
    }

    @Test("SymbolPicker.spPageTypes variadic single-type sets [.emoji] and defaultType .emoji")
    func testPickerPageTypesVariadicSingle() {
        let picker = SymbolPicker(selection: .constant(defaultSelection))
            .spPageTypes(.emoji, defaultType: .emoji)
        #expect(picker.style.supportedTypes == [.emoji])
        #expect(picker.style.defaultType == .emoji)
    }

    // MARK: spPageTypes (array overload)

    @Test("SymbolPicker.spPageTypes array sets supportedTypes and defaultType")
    func testPickerPageTypesArray() {
        let picker = SymbolPicker(selection: .constant(defaultSelection))
            .spPageTypes([.symbol], defaultType: .symbol)
        #expect(picker.style.supportedTypes == [.symbol])
        #expect(picker.style.defaultType == .symbol)
    }

    @Test("SymbolPicker.spPageTypes array with all cases sets allCases and defaultType")
    func testPickerPageTypesArrayAllCases() {
        let picker = SymbolPicker(selection: .constant(defaultSelection))
            .spPageTypes(SPPageType.allCases, defaultType: .emoji)
        #expect(picker.style.supportedTypes == SPPageType.allCases)
        #expect(picker.style.defaultType == .emoji)
    }

    // MARK: spInsetedViews

    @Test("SymbolPicker.spInsetedViews appends custom view when displayStyle is .plain")
    func testPickerInsetedViewsAppends() {
        var picker = SymbolPicker(selection: .constant(defaultSelection))
            .spInsetedViews {
                SPInsetedView(placement: .safeAreaTop) { Text("custom") }
            }
        picker.style.displayStyle = .plain // ensures default views are empty
        let views = picker.style.insetViewsConfiguration()
        #expect(views.count == 1)
        #expect(views[0].placement == .safeAreaTop)
    }

    @Test("SymbolPicker.spInsetedViews(replaceDefaults: true) replaces existing placement")
    func testPickerInsetedViewsReplaceDefaults() {
        // Seed two views via a first spInsetedViews call (with .plain display style so defaults are []).
        var picker = SymbolPicker(selection: .constant(defaultSelection))
        picker.style.displayStyle = .plain
        picker = picker.spInsetedViews {
            SPInsetedView(placement: .safeAreaTop) { Text("original") }
            SPInsetedView(placement: .safeAreaBottom) { Text("other") }
        }
        // Replace the .safeAreaTop view (count should remain 2, not grow to 3).
        picker = picker.spInsetedViews(replaceDefaults: true) {
            SPInsetedView(placement: .safeAreaTop) { Text("replaced") }
        }
        let views = picker.style.insetViewsConfiguration()
        #expect(views.count == 2)
    }

    @Test("SymbolPicker.spInsetedViews(replaceDefaults: false) appends even at existing placement")
    func testPickerInsetedViewsAppendDuplicate() {
        var picker = SymbolPicker(selection: .constant(defaultSelection))
        picker.style.displayStyle = .plain
        picker = picker.spInsetedViews {
            SPInsetedView(placement: .safeAreaTop) { Text("first") }
        }
        picker = picker.spInsetedViews(replaceDefaults: false) {
            SPInsetedView(placement: .safeAreaTop) { Text("second") }
        }
        let views = picker.style.insetViewsConfiguration()
        #expect(views.count == 2)
    }

    // MARK: spSpacing

    @Test("SymbolPicker.spSpacing replaces spacing for the given component")
    func testPickerSpacingReplace() {
        let picker = SymbolPicker(selection: .constant(defaultSelection))
            .spSpacing {
                SPSpacing(component: .colorPicker, width: 888)
            }
        let spacings = picker.style.spacingConfiguration()
        #expect(spacings.getValue(.width, for: .colorPicker, at: .large) == 888)
    }

    @Test("SymbolPicker.spSpacing does not affect other components")
    func testPickerSpacingDoesNotAffectOthers() {
        let before = SymbolPicker(selection: .constant(defaultSelection))
            .style.spacingConfiguration()
            .getValue(.width, for: .optionList, at: .large)

        let after = SymbolPicker(selection: .constant(defaultSelection))
            .spSpacing { SPSpacing(component: .colorPicker, width: 777) }
            .style.spacingConfiguration()
            .getValue(.width, for: .optionList, at: .large)

        #expect(before == after)
    }

    // MARK: spColorPickerEnabled

    @Test("SymbolPicker.spColorPickerEnabled(false) makes colorPickerConfiguration return nil")
    func testPickerColorPickerDisabled() {
        let picker = SymbolPicker(selection: .constant(defaultSelection))
            .spColorPickerEnabled(false)
        #expect(picker.style.colorPickerConfiguration() == nil)
    }

    @Test("SymbolPicker.spColorPickerEnabled(true) keeps colorPickerConfiguration non-nil")
    func testPickerColorPickerEnabled() {
        let picker = SymbolPicker(selection: .constant(defaultSelection))
            .spColorPickerEnabled(true)
        #expect(picker.style.colorPickerConfiguration() != nil)
    }

    // MARK: spColorPickerColors (variadic)

    @Test("SymbolPicker.spColorPickerColors variadic sets the colors array")
    func testPickerColorPickerColorsVariadic() {
        let picker = SymbolPicker(selection: .constant(defaultSelection))
            .spColorPickerColors(red, blue)
        #expect(picker.style.colorPickerConfiguration()?.colors.count == 2)
    }

    @Test("SymbolPicker.spColorPickerColors variadic single color")
    func testPickerColorPickerColorsSingleVariadic() {
        let picker = SymbolPicker(selection: .constant(defaultSelection))
            .spColorPickerColors(red)
        #expect(picker.style.colorPickerConfiguration()?.colors.count == 1)
    }

    // MARK: spColorPickerColors (array)

    @Test("SymbolPicker.spColorPickerColors array sets the colors array")
    func testPickerColorPickerColorsArray() {
        let picker = SymbolPicker(selection: .constant(defaultSelection))
            .spColorPickerColors([red, blue, defaultCKColor])
        #expect(picker.style.colorPickerConfiguration()?.colors.count == 3)
    }

    @Test("SymbolPicker.spColorPickerColors empty array clears colors")
    func testPickerColorPickerColorsEmptyArray() {
        let picker = SymbolPicker(selection: .constant(defaultSelection))
            .spColorPickerColors([CKColor]())
        #expect(picker.style.colorPickerConfiguration()?.colors.isEmpty == true)
    }

    // MARK: spColorPickerLayout

    @Test("SymbolPicker.spColorPickerLayout(.grid) sets type to .grid")
    func testPickerColorPickerLayoutGrid() {
        let picker = SymbolPicker(selection: .constant(defaultSelection))
            .spColorPickerLayout(.grid)
        #expect(picker.style.colorPickerConfiguration()?.type == .grid)
    }

    @Test("SymbolPicker.spColorPickerLayout(.row) sets type to .row")
    func testPickerColorPickerLayoutRow() {
        let picker = SymbolPicker(selection: .constant(defaultSelection))
            .spColorPickerLayout(.row)
        #expect(picker.style.colorPickerConfiguration()?.type == .row)
    }

    @Test("SymbolPicker.spColorPickerLayout with spacing sets spacing")
    func testPickerColorPickerLayoutSpacing() {
        let picker = SymbolPicker(selection: .constant(defaultSelection))
            .spColorPickerLayout(.grid, spacing: 8)
        #expect(picker.style.colorPickerConfiguration()?.spacing == 8)
    }

    @Test("SymbolPicker.spColorPickerLayout without spacing leaves spacing nil")
    func testPickerColorPickerLayoutNoSpacing() {
        let picker = SymbolPicker(selection: .constant(defaultSelection))
            .spColorPickerLayout(.row)
        #expect(picker.style.colorPickerConfiguration()?.spacing == nil)
    }

    // MARK: spColorPickerSupportsOpacity — source bug documented

    @Test("SymbolPicker.spColorPickerSupportsOpacity has no effect (source self-assignment bug)")
    func testPickerColorPickerSupportsOpacityBug() {
        // SPColorPickerConfiguration.spColorPickerSupportsOpacity assigns `supportOpacity`
        // to itself (ignores the passed value). Default is false — remains false after the call.
        let picker = SymbolPicker(selection: .constant(defaultSelection))
            .spColorPickerSupportsOpacity(true)
        #expect(picker.style.colorPickerConfiguration()?.supportOpacity == false)
    }

    // MARK: spColorPickerSupportsCustomColor

    @Test("SymbolPicker.spColorPickerSupportsCustomColor(false) sets supportCustomColor to false")
    func testPickerColorPickerSupportsCustomColorFalse() {
        let picker = SymbolPicker(selection: .constant(defaultSelection))
            .spColorPickerSupportsCustomColor(false)
        #expect(picker.style.colorPickerConfiguration()?.supportCustomColor == false)
    }

    @Test("SymbolPicker.spColorPickerSupportsCustomColor(true) keeps supportCustomColor true")
    func testPickerColorPickerSupportsCustomColorTrue() {
        let picker = SymbolPicker(selection: .constant(defaultSelection))
            .spColorPickerSupportsCustomColor(true)
        #expect(picker.style.colorPickerConfiguration()?.supportCustomColor == true)
    }

    // MARK: spOptionListCornerRadiusFactor

    @Test("SymbolPicker.spOptionListCornerRadiusFactor sets the factor")
    func testPickerOptionListCornerRadiusFactor() {
        let picker = SymbolPicker(selection: .constant(defaultSelection))
            .spOptionListCornerRadiusFactor(0.9)
        #expect(picker.style.optionListConfiguration().optionListCornerRadiusFactor == 0.9)
    }

    // MARK: spOptionListInnerPaddingFactor

    @Test("SymbolPicker.spOptionListInnerPaddingFactor sets the factor")
    func testPickerOptionListInnerPaddingFactor() {
        let picker = SymbolPicker(selection: .constant(defaultSelection))
            .spOptionListInnerPaddingFactor(0.5)
        #expect(picker.style.optionListConfiguration().optionListInnerPaddingFactor == 0.5)
    }

    // MARK: spOptionListForeground

    @Test("SymbolPicker.spOptionListForeground sets optionListForeground")
    func testPickerOptionListForeground() {
        let picker = SymbolPicker(selection: .constant(defaultSelection))
            .spOptionListForeground(.red)
        #expect(picker.style.optionListConfiguration().optionListForeground == .red)
    }

    // MARK: spOptionListForegroundSelected

    @Test("SymbolPicker.spOptionListForegroundSelected sets optionListForegroundSelected")
    func testPickerOptionListForegroundSelected() {
        let picker = SymbolPicker(selection: .constant(defaultSelection))
            .spOptionListForegroundSelected(.blue)
        #expect(picker.style.optionListConfiguration().optionListForegroundSelected == .blue)
    }

    // MARK: spOptionListForegroundFocused

    @Test("SymbolPicker.spOptionListForegroundFocused sets optionListForegroundFocused")
    func testPickerOptionListForegroundFocused() {
        let picker = SymbolPicker(selection: .constant(defaultSelection))
            .spOptionListForegroundFocused(.green)
        #expect(picker.style.optionListConfiguration().optionListForegroundFocused == .green)
    }

    // MARK: spOptionListForegroundPressed

    @Test("SymbolPicker.spOptionListForegroundPressed sets optionListForegroundPressed")
    func testPickerOptionListForegroundPressed() {
        let picker = SymbolPicker(selection: .constant(defaultSelection))
            .spOptionListForegroundPressed(.yellow)
        #expect(picker.style.optionListConfiguration().optionListForegroundPressed == .yellow)
    }

    // MARK: spOptionListBackground

    @Test("SymbolPicker.spOptionListBackground sets optionListBackground")
    func testPickerOptionListBackground() {
        let picker = SymbolPicker(selection: .constant(defaultSelection))
            .spOptionListBackground(.black)
        #expect(picker.style.optionListConfiguration().optionListBackground == .black)
    }

    // MARK: spOptionListBackgroundSelected

    @Test("SymbolPicker.spOptionListBackgroundSelected sets optionListBackgroundSelected")
    func testPickerOptionListBackgroundSelected() {
        let picker = SymbolPicker(selection: .constant(defaultSelection))
            .spOptionListBackgroundSelected(.white)
        #expect(picker.style.optionListConfiguration().optionListBackgroundSelected == .white)
    }

    // MARK: spOptionListBackgroundFocused

    @Test("SymbolPicker.spOptionListBackgroundFocused sets optionListBackgroundFocused")
    func testPickerOptionListBackgroundFocused() {
        let picker = SymbolPicker(selection: .constant(defaultSelection))
            .spOptionListBackgroundFocused(.gray)
        #expect(picker.style.optionListConfiguration().optionListBackgroundFocused == .gray)
    }

    // MARK: spOptionListBackgroundPressed

    @Test("SymbolPicker.spOptionListBackgroundPressed sets optionListBackgroundPressed")
    func testPickerOptionListBackgroundPressed() {
        let picker = SymbolPicker(selection: .constant(defaultSelection))
            .spOptionListBackgroundPressed(.orange)
        #expect(picker.style.optionListConfiguration().optionListBackgroundPressed == .orange)
    }

    // MARK: spSelectionPreviewCornerRadiusFactor

    @Test("SymbolPicker.spSelectionPreviewCornerRadiusFactor sets the factor")
    func testPickerSelectionPreviewCornerRadiusFactor() {
        let picker = SymbolPicker(selection: .constant(defaultSelection))
            .spSelectionPreviewCornerRadiusFactor(0.8)
        #expect(picker.style.selectionPreviewConfiguration().selectionPreviewCornerRadiusFactor == 0.8)
    }

    // MARK: Chaining

    @Test("SymbolPicker modifiers can be chained and each takes effect independently")
    func testPickerModifierChaining() {
        let picker = SymbolPicker(selection: .constant(defaultSelection))
            .spSymbolsVariant(.outlined)
            .spAllowSearching(false)
            .spColorPickerSupportsCustomColor(false)
            .spOptionListCornerRadiusFactor(0.75)
        #expect(picker.style.symbolVariant == .outlined)
        #expect(picker.style.allowSearching == false)
        #expect(picker.style.colorPickerConfiguration()?.supportCustomColor == false)
        #expect(picker.style.optionListConfiguration().optionListCornerRadiusFactor == 0.75)
    }

    // =========================================================================
    // MARK: - SymbolPickerModifier extension tests
    // =========================================================================

    // MARK: spDisplayStyle

    @available(iOS 16.4, *)
    @Test("SymbolPickerModifier.spDisplayStyle(.detail) sets displayStyle to .detail")
    func testModifierDisplayStyleDetail() {
        let modifier = defaultModifier.spDisplayStyle(.detail)
        #expect(modifier.style.displayStyle == .detail)
    }

    @available(iOS 16.4, *)
    @Test("SymbolPickerModifier.spDisplayStyle(.plain) sets displayStyle to .plain")
    func testModifierDisplayStylePlain() {
        let modifier = defaultModifier.spDisplayStyle(.plain)
        #expect(modifier.style.displayStyle == .plain)
    }

    // MARK: spSymbolsVariant

    @Test("SymbolPickerModifier.spSymbolsVariant(.outlined) sets symbolVariant")
    func testModifierSymbolVariant() {
        let modifier = defaultModifier.spSymbolsVariant(.outlined)
        #expect(modifier.style.symbolVariant == .outlined)
    }

    // MARK: spAllowSearching

    @Test("SymbolPickerModifier.spAllowSearching(false) sets allowSearching to false")
    func testModifierAllowSearching() {
        let modifier = defaultModifier.spAllowSearching(false)
        #expect(modifier.style.allowSearching == false)
    }

    // MARK: spPageTypes (variadic)

    @Test("SymbolPickerModifier.spPageTypes variadic sets supportedTypes and defaultType")
    func testModifierPageTypesVariadic() {
        let modifier = defaultModifier.spPageTypes(.symbol, .emoji, defaultType: .emoji)
        #expect(modifier.style.supportedTypes == [.symbol, .emoji])
        #expect(modifier.style.defaultType == .emoji)
    }

    // MARK: spPageTypes (array)

    @Test("SymbolPickerModifier.spPageTypes array sets supportedTypes and defaultType")
    func testModifierPageTypesArray() {
        let modifier = defaultModifier.spPageTypes([.symbol], defaultType: .symbol)
        #expect(modifier.style.supportedTypes == [.symbol])
        #expect(modifier.style.defaultType == .symbol)
    }

    // MARK: spInsetedViews

    @Test("SymbolPickerModifier.spInsetedViews appends custom view when displayStyle is .plain")
    func testModifierInsetedViewsAppends() {
        var modifier = defaultModifier
            .spInsetedViews {
                SPInsetedView(placement: .scrollContentBottom) { Text("mod") }
            }
        modifier.style.displayStyle = .plain
        let views = modifier.style.insetViewsConfiguration()
        #expect(views.count == 1)
        #expect(views[0].placement == .scrollContentBottom)
    }

    @Test("SymbolPickerModifier.spInsetedViews(replaceDefaults: true) replaces existing placement")
    func testModifierInsetedViewsReplaceDefaults() {
        var modifier = defaultModifier
        modifier.style.displayStyle = .plain
        modifier = modifier.spInsetedViews {
            SPInsetedView(placement: .safeAreaTop) { Text("a") }
            SPInsetedView(placement: .safeAreaBottom) { Text("b") }
        }
        modifier = modifier.spInsetedViews(replaceDefaults: true) {
            SPInsetedView(placement: .safeAreaTop) { Text("replaced") }
        }
        let views = modifier.style.insetViewsConfiguration()
        #expect(views.count == 2)
    }

    // MARK: spSpacing

    @Test("SymbolPickerModifier.spSpacing replaces spacing for the given component")
    func testModifierSpacing() {
        let modifier = defaultModifier
            .spSpacing { SPSpacing(component: .optionList, width: 555) }
        let spacings = modifier.style.spacingConfiguration()
        #expect(spacings.getValue(.width, for: .optionList, at: .large) == 555)
    }

    // MARK: spColorPickerEnabled

    @Test("SymbolPickerModifier.spColorPickerEnabled(false) makes colorPickerConfiguration nil")
    func testModifierColorPickerDisabled() {
        let modifier = defaultModifier.spColorPickerEnabled(false)
        #expect(modifier.style.colorPickerConfiguration() == nil)
    }

    @Test("SymbolPickerModifier.spColorPickerEnabled(true) keeps colorPickerConfiguration non-nil")
    func testModifierColorPickerEnabled() {
        let modifier = defaultModifier.spColorPickerEnabled(true)
        #expect(modifier.style.colorPickerConfiguration() != nil)
    }

    // MARK: spColorPickerColors

    @Test("SymbolPickerModifier.spColorPickerColors variadic sets colors")
    func testModifierColorPickerColorsVariadic() {
        let modifier = defaultModifier.spColorPickerColors(red, blue)
        #expect(modifier.style.colorPickerConfiguration()?.colors.count == 2)
    }

    @Test("SymbolPickerModifier.spColorPickerColors array sets colors")
    func testModifierColorPickerColorsArray() {
        let modifier = defaultModifier.spColorPickerColors([red, blue, defaultCKColor])
        #expect(modifier.style.colorPickerConfiguration()?.colors.count == 3)
    }

    // MARK: spColorPickerLayout

    @Test("SymbolPickerModifier.spColorPickerLayout(.grid) sets type to .grid")
    func testModifierColorPickerLayoutGrid() {
        let modifier = defaultModifier.spColorPickerLayout(.grid)
        #expect(modifier.style.colorPickerConfiguration()?.type == .grid)
    }

    @Test("SymbolPickerModifier.spColorPickerLayout with spacing sets spacing value")
    func testModifierColorPickerLayoutSpacing() {
        let modifier = defaultModifier.spColorPickerLayout(.row, spacing: 12)
        #expect(modifier.style.colorPickerConfiguration()?.spacing == 12)
    }

    // MARK: spColorPickerSupportsOpacity — source bug documented

    @Test("SymbolPickerModifier.spColorPickerSupportsOpacity has no effect (source self-assignment bug)")
    func testModifierColorPickerSupportsOpacityBug() {
        let modifier = defaultModifier.spColorPickerSupportsOpacity(true)
        // Same bug as SymbolPicker extension: supportOpacity is self-assigned and stays false.
        #expect(modifier.style.colorPickerConfiguration()?.supportOpacity == false)
    }

    // MARK: spColorPickerSupportsCustomColor

    @Test("SymbolPickerModifier.spColorPickerSupportsCustomColor(false) sets supportCustomColor false")
    func testModifierColorPickerSupportsCustomColorFalse() {
        let modifier = defaultModifier.spColorPickerSupportsCustomColor(false)
        #expect(modifier.style.colorPickerConfiguration()?.supportCustomColor == false)
    }

    // MARK: spOptionListCornerRadiusFactor

    @Test("SymbolPickerModifier.spOptionListCornerRadiusFactor sets the factor")
    func testModifierOptionListCornerRadiusFactor() {
        let modifier = defaultModifier.spOptionListCornerRadiusFactor(0.6)
        #expect(modifier.style.optionListConfiguration().optionListCornerRadiusFactor == 0.6)
    }

    // MARK: spOptionListInnerPaddingFactor

    @Test("SymbolPickerModifier.spOptionListInnerPaddingFactor sets the factor")
    func testModifierOptionListInnerPaddingFactor() {
        let modifier = defaultModifier.spOptionListInnerPaddingFactor(0.4)
        #expect(modifier.style.optionListConfiguration().optionListInnerPaddingFactor == 0.4)
    }

    // MARK: spOptionListForeground

    @Test("SymbolPickerModifier.spOptionListForeground sets optionListForeground")
    func testModifierOptionListForeground() {
        let modifier = defaultModifier.spOptionListForeground(.red)
        #expect(modifier.style.optionListConfiguration().optionListForeground == .red)
    }

    // MARK: spOptionListForegroundSelected

    @Test("SymbolPickerModifier.spOptionListForegroundSelected sets optionListForegroundSelected")
    func testModifierOptionListForegroundSelected() {
        let modifier = defaultModifier.spOptionListForegroundSelected(.blue)
        #expect(modifier.style.optionListConfiguration().optionListForegroundSelected == .blue)
    }

    // MARK: spOptionListForegroundFocused

    @Test("SymbolPickerModifier.spOptionListForegroundFocused sets optionListForegroundFocused")
    func testModifierOptionListForegroundFocused() {
        let modifier = defaultModifier.spOptionListForegroundFocused(.green)
        #expect(modifier.style.optionListConfiguration().optionListForegroundFocused == .green)
    }

    // MARK: spOptionListForegroundPressed

    @Test("SymbolPickerModifier.spOptionListForegroundPressed sets optionListForegroundPressed")
    func testModifierOptionListForegroundPressed() {
        let modifier = defaultModifier.spOptionListForegroundPressed(.purple)
        #expect(modifier.style.optionListConfiguration().optionListForegroundPressed == .purple)
    }

    // MARK: spOptionListBackground

    @Test("SymbolPickerModifier.spOptionListBackground sets optionListBackground")
    func testModifierOptionListBackground() {
        let modifier = defaultModifier.spOptionListBackground(.black)
        #expect(modifier.style.optionListConfiguration().optionListBackground == .black)
    }

    // MARK: spOptionListBackgroundSelected

    @Test("SymbolPickerModifier.spOptionListBackgroundSelected sets optionListBackgroundSelected")
    func testModifierOptionListBackgroundSelected() {
        let modifier = defaultModifier.spOptionListBackgroundSelected(.white)
        #expect(modifier.style.optionListConfiguration().optionListBackgroundSelected == .white)
    }

    // MARK: spOptionListBackgroundFocused

    @Test("SymbolPickerModifier.spOptionListBackgroundFocused sets optionListBackgroundFocused")
    func testModifierOptionListBackgroundFocused() {
        let modifier = defaultModifier.spOptionListBackgroundFocused(.gray)
        #expect(modifier.style.optionListConfiguration().optionListBackgroundFocused == .gray)
    }

    // MARK: spOptionListBackgroundPressed

    @Test("SymbolPickerModifier.spOptionListBackgroundPressed sets optionListBackgroundPressed")
    func testModifierOptionListBackgroundPressed() {
        let modifier = defaultModifier.spOptionListBackgroundPressed(.orange)
        #expect(modifier.style.optionListConfiguration().optionListBackgroundPressed == .orange)
    }

    // MARK: spSelectionPreviewCornerRadiusFactor

    @Test("SymbolPickerModifier.spSelectionPreviewCornerRadiusFactor sets the factor")
    func testModifierSelectionPreviewCornerRadiusFactor() {
        let modifier = defaultModifier.spSelectionPreviewCornerRadiusFactor(0.7)
        #expect(modifier.style.selectionPreviewConfiguration().selectionPreviewCornerRadiusFactor == 0.7)
    }

    // =========================================================================
    // MARK: - SymbolPickerModifier-only: Presentation modifiers
    // =========================================================================

    // MARK: spPresentationCornerRadius

    @Test("SymbolPickerModifier.spPresentationCornerRadius sets presentationCornerRadius")
    func testModifierPresentationCornerRadius() {
        let modifier = defaultModifier.spPresentationCornerRadius(24)
        #expect(modifier.style.presentationConfiguration().presentationCornerRadius == 24)
    }

    // MARK: spPresentationType

    @Test("SymbolPickerModifier.spPresentationType(.sheet) sets presentationType to .sheet")
    func testModifierPresentationTypeSheet() {
        let modifier = defaultModifier.spPresentationType(.sheet)
        let config = modifier.style.presentationConfiguration()
        // DisplayType has no associated values → == operator available
        #expect(config.presentationType == .sheet)
    }

    @Test("SymbolPickerModifier.spPresentationType(.popover) sets presentationType to .popover")
    func testModifierPresentationTypePopover() {
        let modifier = defaultModifier.spPresentationType(.popover)
        #expect(modifier.style.presentationConfiguration().presentationType == .popover)
    }

    @Test("SymbolPickerModifier.spPresentationType(.fullScreenCover) sets correct type")
    func testModifierPresentationTypeFullScreenCover() {
        let modifier = defaultModifier.spPresentationType(.fullScreenCover)
        #expect(modifier.style.presentationConfiguration().presentationType == .fullScreenCover)
    }

    // MARK: spPresentationDragIndicator

    @Test("SymbolPickerModifier.spPresentationDragIndicator(.hidden) sets drag indicator")
    func testModifierPresentationDragIndicatorHidden() {
        let modifier = defaultModifier.spPresentationDragIndicator(.hidden)
        #expect(modifier.style.presentationConfiguration().presentationDragIndicator == .hidden)
    }

    @Test("SymbolPickerModifier.spPresentationDragIndicator(.visible) sets drag indicator")
    func testModifierPresentationDragIndicatorVisible() {
        let modifier = defaultModifier.spPresentationDragIndicator(.visible)
        #expect(modifier.style.presentationConfiguration().presentationDragIndicator == .visible)
    }

    // MARK: spPresentationBackgroundColor

    @Test("SymbolPickerModifier.spPresentationBackgroundColor sets background color")
    func testModifierPresentationBackgroundColor() {
        let modifier = defaultModifier.spPresentationBackgroundColor(.red)
        #expect(modifier.style.presentationConfiguration().presentationBackgroundColor == .red)
    }

    // MARK: spPresentationContentInteraction

    @Test("SymbolPickerModifier.spPresentationContentInteraction(.resizes) sets correct value")
    func testModifierPresentationContentInteractionResizes() {
        let modifier = defaultModifier.spPresentationContentInteraction(.resizes)
        // ContentInteraction has no associated values → == operator available
        #expect(modifier.style.presentationConfiguration().presentationContentInteraction == .resizes)
    }

    @Test("SymbolPickerModifier.spPresentationContentInteraction(.scrolls) sets correct value")
    func testModifierPresentationContentInteractionScrolls() {
        let modifier = defaultModifier.spPresentationContentInteraction(.scrolls)
        #expect(modifier.style.presentationConfiguration().presentationContentInteraction == .scrolls)
    }

    // MARK: spPresentationBackgroundInteraction

    @Test("SymbolPickerModifier.spPresentationBackgroundInteraction(.enabled) sets correct value")
    func testModifierPresentationBackgroundInteractionEnabled() {
        let modifier = defaultModifier.spPresentationBackgroundInteraction(.enabled)
        let interaction = modifier.style.presentationConfiguration().presentationBackgroundInteraction
        // BackgroundInteraction has associated values in .available — use pattern matching
        let isEnabled: Bool
        if case .enabled = interaction { isEnabled = true } else { isEnabled = false }
        #expect(isEnabled)
    }

    @Test("SymbolPickerModifier.spPresentationBackgroundInteraction(.disabled) sets correct value")
    func testModifierPresentationBackgroundInteractionDisabled() {
        let modifier = defaultModifier.spPresentationBackgroundInteraction(.disabled)
        let interaction = modifier.style.presentationConfiguration().presentationBackgroundInteraction
        let isDisabled: Bool
        if case .disabled = interaction { isDisabled = true } else { isDisabled = false }
        #expect(isDisabled)
    }

    @Test("SymbolPickerModifier.spPresentationBackgroundInteraction(.automatic) sets correct value")
    func testModifierPresentationBackgroundInteractionAutomatic() {
        let modifier = defaultModifier.spPresentationBackgroundInteraction(.automatic)
        let interaction = modifier.style.presentationConfiguration().presentationBackgroundInteraction
        let isAutomatic: Bool
        if case .automatic = interaction { isAutomatic = true } else { isAutomatic = false }
        #expect(isAutomatic)
    }

    // MARK: spPresentationDents

    @Test("SymbolPickerModifier.spPresentationDents([.medium]) sets dents to [.medium]")
    func testModifierPresentationDentsMedium() {
        let modifier = defaultModifier.spPresentationDents([.medium])
        // PresentationDents: Hashable → Set comparison works
        #expect(modifier.style.presentationConfiguration().presentationDents == [.medium])
    }

    @Test("SymbolPickerModifier.spPresentationDents([.large]) sets dents to [.large]")
    func testModifierPresentationDentsLarge() {
        let modifier = defaultModifier.spPresentationDents([.large])
        #expect(modifier.style.presentationConfiguration().presentationDents == [.large])
    }

    @Test("SymbolPickerModifier.spPresentationDents([.medium, .large]) sets both dents")
    func testModifierPresentationDentsBoth() {
        let modifier = defaultModifier.spPresentationDents([.medium, .large])
        #expect(modifier.style.presentationConfiguration().presentationDents == [.medium, .large])
    }

    @Test("SymbolPickerModifier.spPresentationDents with fraction dent")
    func testModifierPresentationDentsFraction() {
        let modifier = defaultModifier.spPresentationDents([.fraction(0.5)])
        #expect(modifier.style.presentationConfiguration().presentationDents == [.fraction(0.5)])
    }

    @Test("SymbolPickerModifier.spPresentationDents with height dent")
    func testModifierPresentationDentsHeight() {
        let modifier = defaultModifier.spPresentationDents([.height(300)])
        #expect(modifier.style.presentationConfiguration().presentationDents == [.height(300)])
    }

    // MARK: Chaining (SymbolPickerModifier)

    @Test("SymbolPickerModifier modifiers can be chained and each takes effect independently")
    func testModifierChaining() {
        let modifier = defaultModifier
            .spSymbolsVariant(.outlined)
            .spAllowSearching(false)
            .spPresentationType(.sheet)
            .spPresentationCornerRadius(16)
            .spOptionListCornerRadiusFactor(0.5)
        #expect(modifier.style.symbolVariant == .outlined)
        #expect(modifier.style.allowSearching == false)
        #expect(modifier.style.presentationConfiguration().presentationType == .sheet)
        #expect(modifier.style.presentationConfiguration().presentationCornerRadius == 16)
        #expect(modifier.style.optionListConfiguration().optionListCornerRadiusFactor == 0.5)
    }
}
#endif
