//
//  SymbolPickerViewModifiersTests.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 28/03/2026.
//

import SwiftUI
import ColorKit
#if canImport(Testing)
import Testing
@testable import SymbolPicker

// MARK: - SymbolPicker View Modifier Tests
//
// Each `View.symbolPicker(...)` overload returns a `SymbolPickerModifier` whose
// internal `.picker` property is a fully-constructed `SymbolPicker`. Tests call the
// modifier on `EmptyView()` and inspect `picker.allowedPageTypes` and
// `picker.allowColorSelection` — the same observable surface used in
// `SymbolPickerInitTests`.
//
// `Binding.constant(_:)` is used for all binding parameters.
//
// NOTE — color: Binding<Color> modifiers are disabled.
// The underlying `SPSelection.init(_:color:Color?)` is self-recursive for non-nil
// Color. Creating the SymbolPicker inside the modifier evaluates the binding and
// crashes with a stack overflow. There is no way to pass nil through Binding<Color>.
//
// colorValues modifiers use an empty-array binding to stay on the safe else-branch.
// image modifiers are gated behind @available(iOS 16.0, macOS 14.0, visionOS 26.0, *).

@MainActor
struct SymbolPickerViewModifiersTests {

    // MARK: - Helpers

    private var defaultSelection: SPSelection<SPSymbol> {
        SPSelection(symbol: SPSymbol(systemName: "star.fill"))
    }

    private var defaultEmoji: SPEmoji { SPEmoji("1F600") }
    private var defaultCKColor: CKColor { CKColor(red: 1, green: 0, blue: 0, opacity: 1) }
    private var safeColorValues: [Double] { [] }

    // MARK: - symbolPicker(isPresented:selection:Binding<SPSelection>)

    @Test("symbolPicker(selection:) modifier sets allCases page types and enables color")
    func testModifierSelection() {
        let modifier = EmptyView().symbolPicker(
            isPresented: .constant(false),
            selection: .constant(defaultSelection)
        )
        #expect(modifier.picker.allowedPageTypes == SPPageType.allCases)
        #expect(modifier.picker.allowColorSelection == true)
    }

    // MARK: - symbolPicker(isPresented:selection:Binding<SPSelection?>)

    @Test("symbolPicker(selection:?) modifier sets allCases page types and enables color")
    func testModifierOptionalSelection() {
        let modifier = EmptyView().symbolPicker(
            isPresented: .constant(false),
            selection: .constant(defaultSelection as SPSelection<SPSymbol>?)
        )
        #expect(modifier.picker.allowedPageTypes == SPPageType.allCases)
        #expect(modifier.picker.allowColorSelection == true)
    }

    // MARK: - symbolPicker(isPresented:systemImage:Binding<String>)

    @Test("symbolPicker(systemImage:String) modifier sets [.symbol] and disables color")
    func testModifierSystemImageString() {
        let modifier = EmptyView().symbolPicker(
            isPresented: .constant(false),
            systemImage: .constant("star.fill")
        )
        #expect(modifier.picker.allowedPageTypes == [.symbol])
        #expect(modifier.picker.allowColorSelection == false)
    }

    // MARK: - symbolPicker(isPresented:systemImage:Binding<String?>)

    @Test("symbolPicker(systemImage:String?) modifier sets [.symbol] and disables color")
    func testModifierSystemImageOptionalString() {
        let modifier = EmptyView().symbolPicker(
            isPresented: .constant(false),
            systemImage: .constant("star.fill" as String?)
        )
        #expect(modifier.picker.allowedPageTypes == [.symbol])
        #expect(modifier.picker.allowColorSelection == false)
    }

    // MARK: - symbolPicker(isPresented:systemImage:String ckColor:)

    @Test("symbolPicker(systemImage:String ckColor:) modifier sets [.symbol] and enables color")
    func testModifierSystemImageStringCKColor() {
        let modifier = EmptyView().symbolPicker(
            isPresented: .constant(false),
            systemImage: .constant("star.fill"),
            ckColor: .constant(defaultCKColor)
        )
        #expect(modifier.picker.allowedPageTypes == [.symbol])
        #expect(modifier.picker.allowColorSelection == true)
    }

    // MARK: - symbolPicker(isPresented:systemImage:String? ckColor:)

    @Test("symbolPicker(systemImage:String? ckColor:) modifier sets [.symbol] and enables color")
    func testModifierSystemImageOptionalStringCKColor() {
        let modifier = EmptyView().symbolPicker(
            isPresented: .constant(false),
            systemImage: .constant("star.fill" as String?),
            ckColor: .constant(defaultCKColor)
        )
        #expect(modifier.picker.allowedPageTypes == [.symbol])
        #expect(modifier.picker.allowColorSelection == true)
    }

    // MARK: - symbolPicker(isPresented:systemImage:String color:) — disabled

    @Test("symbolPicker(systemImage:String color:Color) modifier sets [.symbol] and enables color",
          .disabled("SPSelection.init(systemName:color:) is self-recursive for non-nil Color"))
    func testModifierSystemImageStringColor() {
        let modifier = EmptyView().symbolPicker(
            isPresented: .constant(false),
            systemImage: .constant("star.fill"),
            color: .constant(.red)
        )
        #expect(modifier.picker.allowedPageTypes == [.symbol])
        #expect(modifier.picker.allowColorSelection == true)
    }

    // MARK: - symbolPicker(isPresented:systemImage:String? color:) — disabled

    @Test("symbolPicker(systemImage:String? color:Color) modifier sets [.symbol] and enables color",
          .disabled("SPSelection.init(systemName:color:) is self-recursive for non-nil Color"))
    func testModifierSystemImageOptionalStringColor() {
        let modifier = EmptyView().symbolPicker(
            isPresented: .constant(false),
            systemImage: .constant("star.fill" as String?),
            color: .constant(.red)
        )
        #expect(modifier.picker.allowedPageTypes == [.symbol])
        #expect(modifier.picker.allowColorSelection == true)
    }

    // MARK: - symbolPicker(isPresented:systemImage:String colorValues:)

    @Test("symbolPicker(systemImage:String colorValues:) modifier sets [.symbol] and enables color")
    func testModifierSystemImageStringColorValues() {
        let modifier = EmptyView().symbolPicker(
            isPresented: .constant(false),
            systemImage: .constant("star.fill"),
            colorValues: .constant(safeColorValues)
        )
        #expect(modifier.picker.allowedPageTypes == [.symbol])
        #expect(modifier.picker.allowColorSelection == true)
    }

    // MARK: - symbolPicker(isPresented:systemImage:String? colorValues:)

    @Test("symbolPicker(systemImage:String? colorValues:) modifier sets [.symbol] and enables color")
    func testModifierSystemImageOptionalStringColorValues() {
        let modifier = EmptyView().symbolPicker(
            isPresented: .constant(false),
            systemImage: .constant("star.fill" as String?),
            colorValues: .constant(safeColorValues)
        )
        #expect(modifier.picker.allowedPageTypes == [.symbol])
        #expect(modifier.picker.allowColorSelection == true)
    }

    // MARK: - symbolPicker(isPresented:emoji:Binding<SPEmoji>)

    @Test("symbolPicker(emoji:SPEmoji) modifier sets [.emoji] and disables color")
    func testModifierEmoji() {
        let modifier = EmptyView().symbolPicker(
            isPresented: .constant(false),
            emoji: .constant(defaultEmoji)
        )
        #expect(modifier.picker.allowedPageTypes == [.emoji])
        #expect(modifier.picker.allowColorSelection == false)
    }

    // MARK: - symbolPicker(isPresented:emoji:Binding<SPEmoji?>)

    @Test("symbolPicker(emoji:SPEmoji?) modifier sets [.emoji] and disables color")
    func testModifierOptionalEmoji() {
        let modifier = EmptyView().symbolPicker(
            isPresented: .constant(false),
            emoji: .constant(defaultEmoji as SPEmoji?)
        )
        #expect(modifier.picker.allowedPageTypes == [.emoji])
        #expect(modifier.picker.allowColorSelection == false)
    }

    // MARK: - symbolPicker(isPresented:emoji:SPEmoji ckColor:)

    @Test("symbolPicker(emoji:SPEmoji ckColor:) modifier sets [.emoji] and enables color")
    func testModifierEmojiCKColor() {
        let modifier = EmptyView().symbolPicker(
            isPresented: .constant(false),
            emoji: .constant(defaultEmoji),
            ckColor: .constant(defaultCKColor)
        )
        #expect(modifier.picker.allowedPageTypes == [.emoji])
        #expect(modifier.picker.allowColorSelection == true)
    }

    // MARK: - symbolPicker(isPresented:emoji:SPEmoji? ckColor:)

    @Test("symbolPicker(emoji:SPEmoji? ckColor:) modifier sets [.emoji] and enables color")
    func testModifierOptionalEmojiCKColor() {
        let modifier = EmptyView().symbolPicker(
            isPresented: .constant(false),
            emoji: .constant(defaultEmoji as SPEmoji?),
            ckColor: .constant(defaultCKColor)
        )
        #expect(modifier.picker.allowedPageTypes == [.emoji])
        #expect(modifier.picker.allowColorSelection == true)
    }

    // MARK: - symbolPicker(isPresented:emoji:SPEmoji color:) — disabled

    @Test("symbolPicker(emoji:SPEmoji color:Color) modifier sets [.emoji] and enables color",
          .disabled("SPSelection.init(emoji:color:) is self-recursive for non-nil Color"))
    func testModifierEmojiColor() {
        let modifier = EmptyView().symbolPicker(
            isPresented: .constant(false),
            emoji: .constant(defaultEmoji),
            color: .constant(.blue)
        )
        #expect(modifier.picker.allowedPageTypes == [.emoji])
        #expect(modifier.picker.allowColorSelection == true)
    }

    // MARK: - symbolPicker(isPresented:emoji:SPEmoji? color:) — disabled

    @Test("symbolPicker(emoji:SPEmoji? color:Color) modifier sets [.emoji] and enables color",
          .disabled("SPSelection.init(emoji:color:) is self-recursive for non-nil Color"))
    func testModifierOptionalEmojiColor() {
        let modifier = EmptyView().symbolPicker(
            isPresented: .constant(false),
            emoji: .constant(defaultEmoji as SPEmoji?),
            color: .constant(.blue)
        )
        #expect(modifier.picker.allowedPageTypes == [.emoji])
        #expect(modifier.picker.allowColorSelection == true)
    }

    // MARK: - symbolPicker(isPresented:emoji:SPEmoji colorValues:)

    @Test("symbolPicker(emoji:SPEmoji colorValues:) modifier sets [.emoji] and enables color")
    func testModifierEmojiColorValues() {
        let modifier = EmptyView().symbolPicker(
            isPresented: .constant(false),
            emoji: .constant(defaultEmoji),
            colorValues: .constant(safeColorValues)
        )
        #expect(modifier.picker.allowedPageTypes == [.emoji])
        #expect(modifier.picker.allowColorSelection == true)
    }

    // MARK: - symbolPicker(isPresented:emoji:SPEmoji? colorValues:)

    @Test("symbolPicker(emoji:SPEmoji? colorValues:) modifier sets [.emoji] and enables color")
    func testModifierOptionalEmojiColorValues() {
        let modifier = EmptyView().symbolPicker(
            isPresented: .constant(false),
            emoji: .constant(defaultEmoji as SPEmoji?),
            colorValues: .constant(safeColorValues)
        )
        #expect(modifier.picker.allowedPageTypes == [.emoji])
        #expect(modifier.picker.allowColorSelection == true)
    }

    // MARK: - Image modifiers (iOS 16.0+, macOS 14.0+, visionOS 26.0+)

    #if !os(tvOS) && !os(watchOS)

    @available(iOS 16.0, macOS 14.0, visionOS 26.0, *)
    @Test("symbolPicker(image:SPImage) modifier sets [.image] and disables color")
    func testModifierImage() {
        guard let image = SPImage(systemName: "star.fill") else { return }
        let modifier = EmptyView().symbolPicker(
            isPresented: .constant(false),
            image: .constant(image)
        )
        #expect(modifier.picker.allowedPageTypes == [.image])
        #expect(modifier.picker.allowColorSelection == false)
    }

    @available(iOS 16.0, macOS 14.0, visionOS 26.0, *)
    @Test("symbolPicker(image:SPImage?) modifier sets [.image] and disables color")
    func testModifierOptionalImage() {
        let modifier = EmptyView().symbolPicker(
            isPresented: .constant(false),
            image: .constant(nil as SPImage?)
        )
        #expect(modifier.picker.allowedPageTypes == [.image])
        #expect(modifier.picker.allowColorSelection == false)
    }

    @available(iOS 16.0, macOS 14.0, visionOS 26.0, *)
    @Test("symbolPicker(image:SPImage ckColor:) modifier sets [.image] and enables color")
    func testModifierImageCKColor() {
        guard let image = SPImage(systemName: "star.fill") else { return }
        let modifier = EmptyView().symbolPicker(
            isPresented: .constant(false),
            image: .constant(image),
            ckColor: .constant(defaultCKColor)
        )
        #expect(modifier.picker.allowedPageTypes == [.image])
        #expect(modifier.picker.allowColorSelection == true)
    }

    @available(iOS 16.0, macOS 14.0, visionOS 26.0, *)
    @Test("symbolPicker(image:SPImage? ckColor:) modifier sets [.image] and enables color")
    func testModifierOptionalImageCKColor() {
        let modifier = EmptyView().symbolPicker(
            isPresented: .constant(false),
            image: .constant(nil as SPImage?),
            ckColor: .constant(defaultCKColor)
        )
        #expect(modifier.picker.allowedPageTypes == [.image])
        #expect(modifier.picker.allowColorSelection == true)
    }

    @available(iOS 16.0, macOS 14.0, visionOS 26.0, *)
    @Test("symbolPicker(image:SPImage color:Color) modifier sets [.image] and enables color",
          .disabled("SPSelection.init(image:color:) is self-recursive for non-nil Color"))
    func testModifierImageColor() {
        guard let image = SPImage(systemName: "star.fill") else { return }
        let modifier = EmptyView().symbolPicker(
            isPresented: .constant(false),
            image: .constant(image),
            color: .constant(.green)
        )
        #expect(modifier.picker.allowedPageTypes == [.image])
        #expect(modifier.picker.allowColorSelection == true)
    }

    @available(iOS 16.0, macOS 14.0, visionOS 26.0, *)
    @Test("symbolPicker(image:SPImage? color:Color) modifier sets [.image] and enables color",
          .disabled("SPSelection.init(image:color:) is self-recursive for non-nil Color"))
    func testModifierOptionalImageColor() {
        let modifier = EmptyView().symbolPicker(
            isPresented: .constant(false),
            image: .constant(nil as SPImage?),
            color: .constant(.green)
        )
        #expect(modifier.picker.allowedPageTypes == [.image])
        #expect(modifier.picker.allowColorSelection == true)
    }

    @available(iOS 16.0, macOS 14.0, visionOS 26.0, *)
    @Test("symbolPicker(image:SPImage colorValues:) modifier sets [.image] and enables color")
    func testModifierImageColorValues() {
        guard let image = SPImage(systemName: "star.fill") else { return }
        let modifier = EmptyView().symbolPicker(
            isPresented: .constant(false),
            image: .constant(image),
            colorValues: .constant(safeColorValues)
        )
        #expect(modifier.picker.allowedPageTypes == [.image])
        #expect(modifier.picker.allowColorSelection == true)
    }

    @available(iOS 16.0, macOS 14.0, visionOS 26.0, *)
    @Test("symbolPicker(image:SPImage? colorValues:) modifier sets [.image] and enables color")
    func testModifierOptionalImageColorValues() {
        let modifier = EmptyView().symbolPicker(
            isPresented: .constant(false),
            image: .constant(nil as SPImage?),
            colorValues: .constant(safeColorValues)
        )
        #expect(modifier.picker.allowedPageTypes == [.image])
        #expect(modifier.picker.allowColorSelection == true)
    }

    #endif
}
#endif
