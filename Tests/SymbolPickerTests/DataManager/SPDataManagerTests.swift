//
//  SPDataManagerTests.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 28/03/2026.
//

import Foundation
#if canImport(Testing)
import Testing
@testable import SymbolPicker

struct SPDataManagerTests {

    // MARK: - Static properties

    @Test("SPDataManager.fallbackLocale is 'en'")
    func testFallbackLocale() {
        #expect(SPDataManager.fallbackLocale == "en")
    }

    // MARK: - SPDataManager.Error cases

    @Test("SPDataManager.Error.fileNotFound conforms to Swift.Error")
    func testErrorFileNotFound() {
        let err: any Swift.Error = SPDataManager.Error.fileNotFound(fileName: "test.json")
        #expect(err is SPDataManager.Error)
    }

    @Test("SPDataManager.Error.bundleURLNotCreated conforms to Swift.Error")
    func testErrorBundleURLNotCreated() {
        let err: any Swift.Error = SPDataManager.Error.bundleURLNotCreated(fileName: "missing.json")
        #expect(err is SPDataManager.Error)
    }

    @Test("SPDataManager.Error.unknownType conforms to Swift.Error")
    func testErrorUnknownType() {
        let err: any Swift.Error = SPDataManager.Error.unknownType(type: "Foo")
        #expect(err is SPDataManager.Error)
    }

    @Test("SPDataManager.Error.otherError wraps arbitrary Swift.Error")
    func testErrorOtherError() {
        struct Sentinel: Swift.Error {}
        let inner = Sentinel()
        let err = SPDataManager.Error.otherError(error: inner)
        if case .otherError(let wrapped) = err {
            #expect(wrapped is Sentinel)
        } else {
            Issue.record("Expected .otherError case")
        }
    }

    // MARK: - getSystemLocaleComponents (nonisolated)

    @Test("getSystemLocaleComponents returns non-empty language code")
    func testSystemLocaleLanguageNonEmpty() {
        let manager = SPDataManager()
        let (lang, _) = manager.getSystemLocaleComponents()
        #expect(!lang.isEmpty)
    }

    @Test("getSystemLocaleComponents language is a plausible BCP-47 tag (2-3 letters)")
    func testSystemLocaleLanguageFormat() {
        let manager = SPDataManager()
        let (lang, _) = manager.getSystemLocaleComponents()
        #expect(lang.count >= 2)
        #expect(lang.count <= 8) // locales like zh-Hans are longer
    }

    // MARK: - getLocales (actor-isolated)

    @Test("getLocales for SPSymbol contains 'en'")
    func testGetLocalesContainsEnglish() async {
        let manager = SPDataManager()
        let locales = await manager.getLocales(for: SPSymbol.self)
        #expect(locales.contains("en"))
    }

    @Test("getLocales for SPEmoji contains 'en'")
    func testGetLocalesEmojiContainsEnglish() async {
        let manager = SPDataManager()
        let locales = await manager.getLocales(for: SPEmoji.self)
        #expect(locales.contains("en"))
    }

    @Test("getLocales returns non-empty list")
    func testGetLocalesNonEmpty() async {
        let manager = SPDataManager()
        let locales = await manager.getLocales(for: SPSymbol.self)
        #expect(!locales.isEmpty)
    }

    @Test("getLocales result is sorted")
    func testGetLocalesSorted() async {
        let manager = SPDataManager()
        let locales = await manager.getLocales(for: SPSymbol.self)
        #expect(locales == locales.sorted())
    }

    // MARK: - fetch

    @Test("fetch(type:SPSymbol) returns non-empty categories")
    func testFetchSymbolsNonEmpty() async throws {
        let manager = SPDataManager()
        let categories = try await manager.fetch(type: SPSymbol.self)
        #expect(!categories.isEmpty)
    }

    @Test("fetch(type:SPEmoji) returns non-empty categories")
    func testFetchEmojisNonEmpty() async throws {
        let manager = SPDataManager()
        let categories = try await manager.fetch(type: SPEmoji.self)
        #expect(!categories.isEmpty)
    }

    @Test("fetch all returned symbols have non-empty filledName")
    func testFetchSymbolsHaveFilledName() async throws {
        let manager = SPDataManager()
        let categories = try await manager.fetch(type: SPSymbol.self)
        let symbols = categories.flatMap(\.elements)
        #expect(symbols.allSatisfy { !$0.filledName.isEmpty })
    }

    @Test("fetch all returned emojis have non-empty id")
    func testFetchEmojisHaveId() async throws {
        let manager = SPDataManager()
        let categories = try await manager.fetch(type: SPEmoji.self)
        let emojis = categories.flatMap(\.elements)
        #expect(emojis.allSatisfy { !$0.id.isEmpty })
    }

    @Test("fetch second call returns same item count (cache hit)")
    func testFetchCacheHit() async throws {
        let manager = SPDataManager()
        let first = try await manager.fetch(type: SPSymbol.self)
        let second = try await manager.fetch(type: SPSymbol.self)
        let firstCount = first.reduce(0) { $0 + $1.elements.count }
        let secondCount = second.reduce(0) { $0 + $1.elements.count }
        #expect(firstCount == secondCount)
    }

    @Test("fetch categories each have a non-empty category name")
    func testFetchCategoryNamesNonEmpty() async throws {
        let manager = SPDataManager()
        let categories = try await manager.fetch(type: SPSymbol.self)
        #expect(categories.allSatisfy { !$0.category.isEmpty })
    }

    // MARK: - search

    @Test("search with empty text returns same item count as fetch")
    func testSearchEmptyTextReturnsAll() async throws {
        let manager = SPDataManager()
        let fetched = try await manager.fetch(type: SPSymbol.self)
        let searched = try await manager.search(SPSymbol.self, for: "")
        let fetchedCount = fetched.reduce(0) { $0 + $1.elements.count }
        let searchedCount = searched.reduce(0) { $0 + $1.elements.count }
        #expect(fetchedCount == searchedCount)
    }

    @Test("search with whitespace-only text returns all items")
    func testSearchWhitespaceReturnsAll() async throws {
        let manager = SPDataManager()
        let fetched = try await manager.fetch(type: SPSymbol.self)
        let searched = try await manager.search(SPSymbol.self, for: "   ")
        let fetchedCount = fetched.reduce(0) { $0 + $1.elements.count }
        let searchedCount = searched.reduce(0) { $0 + $1.elements.count }
        #expect(fetchedCount == searchedCount)
    }

    @Test("search with non-empty text returns exactly one category")
    func testSearchNonEmptyTextReturnsSingleCategory() async throws {
        let manager = SPDataManager()
        let results = try await manager.search(SPSymbol.self, for: "star")
        #expect(results.count == 1)
    }

    @Test("search results are non-empty for common keyword 'star'")
    func testSearchResultsNonEmpty() async throws {
        let manager = SPDataManager()
        let results = try await manager.search(SPSymbol.self, for: "star")
        let elements = results.flatMap(\.elements)
        #expect(!elements.isEmpty)
    }

    @Test("search results contain no duplicates")
    func testSearchNoDuplicates() async throws {
        let manager = SPDataManager()
        let results = try await manager.search(SPSymbol.self, for: "star")
        let elements = results.flatMap(\.elements)
        let ids = elements.map(\.id)
        #expect(ids.count == Set(ids).count)
    }

    @Test("search for unlikely term returns empty elements")
    func testSearchUnlikelyTermReturnsEmpty() async throws {
        let manager = SPDataManager()
        let results = try await manager.search(SPSymbol.self, for: "xyzzy_impossible_term_123")
        let elements = results.flatMap(\.elements)
        #expect(elements.isEmpty)
    }
}
#endif
