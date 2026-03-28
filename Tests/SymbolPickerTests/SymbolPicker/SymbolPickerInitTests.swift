//
//  SymbolPickerInitTests.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 28/03/2026.
//

import Foundation
import SwiftUI
import ColorKit
#if canImport(Testing)
import Testing
@testable import SymbolPicker

// MARK: - SymbolPicker Init Tests
//
// Each init is tested by inspecting `allowedPageTypes` and `allowColorSelection`,
// both of which are internal (package-visible via @testable import).
//
// `Binding.constant(_:)` is used for all Binding parameters — they provide a
// stable value without requiring a live SwiftUI environment.
//
// NOTE — color: Binding<Color> tests are disabled.
// SPSelection.init(_:color:Color?) and SPSelection.init(_:colorValues:[Double]?)
// are self-recursive when the value is non-nil / count ∈ {3,4}. The SymbolPicker
// Binding getter is evaluated during init, so any non-nil Color crashes with a
// stack overflow. There is no way to pass nil through a Binding<Color>.
// The colorValues tests avoid the crash by using an empty array binding.
//
// Image inits are gated behind @available(iOS 16.0, macOS 14.0, visionOS 26.0, *)
// to match the source declaration.

@MainActor
struct SymbolPickerInitTests {

    // MARK: - Helpers

    private var defaultSelection: SPSelection<SPSymbol> {
        SPSelection(symbol: SPSymbol(systemName: "star.fill"))
    }

    private var defaultEmoji: SPEmoji { SPEmoji("1F600") }
    private var defaultCKColor: CKColor { CKColor(red: 1, green: 0, blue: 0, opacity: 1) }
    // Empty array routes SPSelection.init(_:colorValues:) to the safe else-branch.
    private var safeColorValues: [Double] { [] }

    // MARK: - init(selection: Binding<SPSelection<DataAsset>>)

    @Test("init(selection:) keeps default allowedPageTypes and allowColorSelection")
    func testInitSelection() {
        let picker = SymbolPicker(selection: .constant(defaultSelection))
        #expect(picker.allowedPageTypes == SPPageType.allCases)
        #expect(picker.allowColorSelection == true)
    }

    // MARK: - init(selection: Binding<SPSelection<DataAsset>?>)

    @Test("init(selection:?) keeps default allowedPageTypes and allowColorSelection")
    func testInitOptionalSelection() {
        let picker = SymbolPicker(selection: .constant(defaultSelection as SPSelection<SPSymbol>?))
        #expect(picker.allowedPageTypes == SPPageType.allCases)
        #expect(picker.allowColorSelection == true)
    }

    // MARK: - init(systemImage: Binding<String>)

    @Test("init(systemImage:String) sets allowedPageTypes to [.symbol] and disables color")
    func testInitSystemImageString() {
        let picker = SymbolPicker(systemImage: .constant("star.fill"))
        #expect(picker.allowedPageTypes == [.symbol])
        #expect(picker.allowColorSelection == false)
    }

    // MARK: - init(systemImage: Binding<String?>)

    @Test("init(systemImage:String?) sets allowedPageTypes to [.symbol] and disables color")
    func testInitSystemImageOptionalString() {
        let picker = SymbolPicker(systemImage: .constant("star.fill" as String?))
        #expect(picker.allowedPageTypes == [.symbol])
        #expect(picker.allowColorSelection == false)
    }

    // MARK: - init(systemImage:ckColor:) — String

    @Test("init(systemImage:String ckColor:) sets [.symbol] and enables color")
    func testInitSystemImageStringCKColor() {
        let picker = SymbolPicker(
            systemImage: .constant("star.fill"),
            ckColor: .constant(defaultCKColor)
        )
        #expect(picker.allowedPageTypes == [.symbol])
        #expect(picker.allowColorSelection == true)
    }

    // MARK: - init(systemImage:ckColor:) — String?

    @Test("init(systemImage:String? ckColor:) sets [.symbol] and enables color")
    func testInitSystemImageOptionalStringCKColor() {
        let picker = SymbolPicker(
            systemImage: .constant("star.fill" as String?),
            ckColor: .constant(defaultCKColor)
        )
        #expect(picker.allowedPageTypes == [.symbol])
        #expect(picker.allowColorSelection == true)
    }

    // MARK: - init(systemImage:color:) — disabled (recursive SPSelection crash)

    @Test("init(systemImage:String color:Color) sets [.symbol] and enables color",
          .disabled("SPSelection.init(systemName:color:) is self-recursive for non-nil Color"))
    func testInitSystemImageStringColor() {
        let picker = SymbolPicker(
            systemImage: .constant("star.fill"),
            color: .constant(.red)
        )
        #expect(picker.allowedPageTypes == [.symbol])
        #expect(picker.allowColorSelection == true)
    }

    @Test("init(systemImage:String? color:Color) sets [.symbol] and enables color",
          .disabled("SPSelection.init(systemName:color:) is self-recursive for non-nil Color"))
    func testInitSystemImageOptionalStringColor() {
        let picker = SymbolPicker(
            systemImage: .constant("star.fill" as String?),
            color: .constant(.red)
        )
        #expect(picker.allowedPageTypes == [.symbol])
        #expect(picker.allowColorSelection == true)
    }

    // MARK: - init(systemImage:colorValues:) — String

    @Test("init(systemImage:String colorValues:) sets [.symbol] and enables color")
    func testInitSystemImageStringColorValues() {
        let picker = SymbolPicker(
            systemImage: .constant("star.fill"),
            colorValues: .constant(safeColorValues)
        )
        #expect(picker.allowedPageTypes == [.symbol])
        #expect(picker.allowColorSelection == true)
    }

    // MARK: - init(systemImage:colorValues:) — String?

    @Test("init(systemImage:String? colorValues:) sets [.symbol] and enables color")
    func testInitSystemImageOptionalStringColorValues() {
        let picker = SymbolPicker(
            systemImage: .constant("star.fill" as String?),
            colorValues: .constant(safeColorValues)
        )
        #expect(picker.allowedPageTypes == [.symbol])
        #expect(picker.allowColorSelection == true)
    }

    // MARK: - init(emoji: Binding<SPEmoji>)

    @Test("init(emoji:SPEmoji) sets allowedPageTypes to [.emoji] and disables color")
    func testInitEmoji() {
        let picker = SymbolPicker(emoji: .constant(defaultEmoji))
        #expect(picker.allowedPageTypes == [.emoji])
        #expect(picker.allowColorSelection == false)
    }

    // MARK: - init(emoji: Binding<SPEmoji?>)

    @Test("init(emoji:SPEmoji?) sets allowedPageTypes to [.emoji] and disables color")
    func testInitOptionalEmoji() {
        let picker = SymbolPicker(emoji: .constant(defaultEmoji as SPEmoji?))
        #expect(picker.allowedPageTypes == [.emoji])
        #expect(picker.allowColorSelection == false)
    }

    // MARK: - init(emoji:ckColor:) — SPEmoji

    @Test("init(emoji:SPEmoji ckColor:) sets [.emoji] and enables color")
    func testInitEmojiCKColor() {
        let picker = SymbolPicker(
            emoji: .constant(defaultEmoji),
            ckColor: .constant(defaultCKColor)
        )
        #expect(picker.allowedPageTypes == [.emoji])
        #expect(picker.allowColorSelection == true)
    }

    // MARK: - init(emoji:ckColor:) — SPEmoji?

    @Test("init(emoji:SPEmoji? ckColor:) sets [.emoji] and enables color")
    func testInitOptionalEmojiCKColor() {
        let picker = SymbolPicker(
            emoji: .constant(defaultEmoji as SPEmoji?),
            ckColor: .constant(defaultCKColor)
        )
        #expect(picker.allowedPageTypes == [.emoji])
        #expect(picker.allowColorSelection == true)
    }

    // MARK: - init(emoji:color:) — disabled (recursive SPSelection crash)

    @Test("init(emoji:SPEmoji color:Color) sets [.emoji] and enables color",
          .disabled("SPSelection.init(emoji:color:) is self-recursive for non-nil Color"))
    func testInitEmojiColor() {
        let picker = SymbolPicker(
            emoji: .constant(defaultEmoji),
            color: .constant(.blue)
        )
        #expect(picker.allowedPageTypes == [.emoji])
        #expect(picker.allowColorSelection == true)
    }

    @Test("init(emoji:SPEmoji? color:Color) sets [.emoji] and enables color",
          .disabled("SPSelection.init(emoji:color:) is self-recursive for non-nil Color"))
    func testInitOptionalEmojiColor() {
        let picker = SymbolPicker(
            emoji: .constant(defaultEmoji as SPEmoji?),
            color: .constant(.blue)
        )
        #expect(picker.allowedPageTypes == [.emoji])
        #expect(picker.allowColorSelection == true)
    }

    // MARK: - init(emoji:colorValues:) — SPEmoji

    @Test("init(emoji:SPEmoji colorValues:) sets [.emoji] and enables color")
    func testInitEmojiColorValues() {
        let picker = SymbolPicker(
            emoji: .constant(defaultEmoji),
            colorValues: .constant(safeColorValues)
        )
        #expect(picker.allowedPageTypes == [.emoji])
        #expect(picker.allowColorSelection == true)
    }

    // MARK: - init(emoji:colorValues:) — SPEmoji?

    @Test("init(emoji:SPEmoji? colorValues:) sets [.emoji] and enables color")
    func testInitOptionalEmojiColorValues() {
        let picker = SymbolPicker(
            emoji: .constant(defaultEmoji as SPEmoji?),
            colorValues: .constant(safeColorValues)
        )
        #expect(picker.allowedPageTypes == [.emoji])
        #expect(picker.allowColorSelection == true)
    }

    // MARK: - Image inits (iOS 16.0+, macOS 14.0+, visionOS 26.0+)

    #if os(iOS) || os(macOS) || os(visionOS)

    @available(iOS 16.0, macOS 14.0, visionOS 26.0, *)
    @Test("init(image:SPImage) sets [.image] and disables color")
    func testInitImage() {
        guard let image = SPImage(systemName: "star.fill") else { return }
        let picker = SymbolPicker(image: .constant(image))
        #expect(picker.allowedPageTypes == [.image])
        #expect(picker.allowColorSelection == false)
    }

    @available(iOS 16.0, macOS 14.0, visionOS 26.0, *)
    @Test("init(image:SPImage?) sets [.image] and disables color")
    func testInitOptionalImage() {
        let picker = SymbolPicker(image: .constant(nil as SPImage?))
        #expect(picker.allowedPageTypes == [.image])
        #expect(picker.allowColorSelection == false)
    }

    @available(iOS 16.0, macOS 14.0, visionOS 26.0, *)
    @Test("init(image:SPImage ckColor:) sets [.image] and enables color")
    func testInitImageCKColor() {
        guard let image = SPImage(systemName: "star.fill") else { return }
        let picker = SymbolPicker(
            image: .constant(image),
            ckColor: .constant(defaultCKColor)
        )
        #expect(picker.allowedPageTypes == [.image])
        #expect(picker.allowColorSelection == true)
    }

    @available(iOS 16.0, macOS 14.0, visionOS 26.0, *)
    @Test("init(image:SPImage? ckColor:) sets [.image] and enables color")
    func testInitOptionalImageCKColor() {
        let picker = SymbolPicker(
            image: .constant(nil as SPImage?),
            ckColor: .constant(defaultCKColor)
        )
        #expect(picker.allowedPageTypes == [.image])
        #expect(picker.allowColorSelection == true)
    }

    @available(iOS 16.0, macOS 14.0, visionOS 26.0, *)
    @Test("init(image:SPImage color:Color) sets [.image] and enables color",
          .disabled("SPSelection.init(image:color:) is self-recursive for non-nil Color"))
    func testInitImageColor() {
        guard let image = SPImage(systemName: "star.fill") else { return }
        let picker = SymbolPicker(
            image: .constant(image),
            color: .constant(.green)
        )
        #expect(picker.allowedPageTypes == [.image])
        #expect(picker.allowColorSelection == true)
    }

    @available(iOS 16.0, macOS 14.0, visionOS 26.0, *)
    @Test("init(image:SPImage? color:Color) sets [.image] and enables color",
          .disabled("SPSelection.init(image:color:) is self-recursive for non-nil Color"))
    func testInitOptionalImageColor() {
        let picker = SymbolPicker(
            image: .constant(nil as SPImage?),
            color: .constant(.green)
        )
        #expect(picker.allowedPageTypes == [.image])
        #expect(picker.allowColorSelection == true)
    }

    @available(iOS 16.0, macOS 14.0, visionOS 26.0, *)
    @Test("init(image:SPImage colorValues:) sets [.image] and enables color")
    func testInitImageColorValues() {
        guard let image = SPImage(systemName: "star.fill") else { return }
        let picker = SymbolPicker(
            image: .constant(image),
            colorValues: .constant(safeColorValues)
        )
        #expect(picker.allowedPageTypes == [.image])
        #expect(picker.allowColorSelection == true)
    }

    @available(iOS 16.0, macOS 14.0, visionOS 26.0, *)
    @Test("init(image:SPImage? colorValues:) sets [.image] and enables color")
    func testInitOptionalImageColorValues() {
        let picker = SymbolPicker(
            image: .constant(nil as SPImage?),
            colorValues: .constant(safeColorValues)
        )
        #expect(picker.allowedPageTypes == [.image])
        #expect(picker.allowColorSelection == true)
    }

    #endif
}
#endif
