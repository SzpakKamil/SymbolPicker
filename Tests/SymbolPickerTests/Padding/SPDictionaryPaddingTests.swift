//
//  SPDictionaryPaddingTests.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 28/03/2026.
//

import SwiftUI
#if canImport(Testing)
import Testing
@testable import SymbolPicker

// MARK: - SPDictionaryPadding Tests
//
// `SPDictionaryPaddingTests` exercises the three internal View extension methods
// defined in SPDictionaryPadding.swift. The core resolution algorithm
// (`Dictionary<Edge.Set, CGFloat?>.spResolve`) is `fileprivate` and cannot be
// called directly from tests. All tests are therefore smoke tests that verify
// the methods compile, accept the documented inputs, and return a valid view
// without crashing.
//
// Priority chain of spResolve (highest → lowest):
//   1. Exact edge key with non-nil value
//   2. Axis key (.vertical / .horizontal) with non-nil value
//   3. .all key with non-nil value
//   4. Exact edge key in defaultValues
//   5. Axis key in defaultValues
//   6. .all key in defaultValues
//   7. Returns 0

struct SPDictionaryPaddingTests {

    // MARK: - spPaddingForDictionary

    @MainActor @Test("spPaddingForDictionary with empty dictionary returns view without crash")
    func testPaddingEmptyDict() {
        _ = EmptyView().spPaddingForDictionary([:])
    }

    @MainActor @Test("spPaddingForDictionary with exact-edge entries applies per-edge padding")
    func testPaddingExactEdge() {
        _ = EmptyView().spPaddingForDictionary([
            .top: 10,
            .bottom: 20,
            .leading: 8,
            .trailing: 12
        ])
    }

    @MainActor @Test("spPaddingForDictionary with .vertical axis entry covers top and bottom")
    func testPaddingVerticalAxis() {
        _ = EmptyView().spPaddingForDictionary([.vertical: 16])
    }

    @MainActor @Test("spPaddingForDictionary with .horizontal axis entry covers leading and trailing")
    func testPaddingHorizontalAxis() {
        _ = EmptyView().spPaddingForDictionary([.horizontal: 12])
    }

    @MainActor @Test("spPaddingForDictionary with .all entry applies to all four edges")
    func testPaddingAllEdge() {
        _ = EmptyView().spPaddingForDictionary([.all: 8])
    }

    @MainActor @Test("spPaddingForDictionary: exact-edge takes priority over .all")
    func testPaddingExactOverAll() {
        // .top: 4 wins over .all: 20 for the top edge; .all: 20 applies to others
        _ = EmptyView().spPaddingForDictionary([.top: 4, .all: 20])
    }

    @MainActor @Test("spPaddingForDictionary: axis takes priority over .all")
    func testPaddingAxisOverAll() {
        // .vertical: 6 wins over .all: 20 for top and bottom
        _ = EmptyView().spPaddingForDictionary([.vertical: 6, .all: 20])
    }

    @MainActor @Test("spPaddingForDictionary: nil value falls through to axis resolution")
    func testPaddingNilValueFallsToAxis() {
        // .top: nil → not usable; .vertical: 12 → applies to top
        _ = EmptyView().spPaddingForDictionary([.top: nil, .vertical: 12])
    }

    @MainActor @Test("spPaddingForDictionary: nil value falls through to .all resolution")
    func testPaddingNilValueFallsToAll() {
        // .top: nil, .vertical: nil → falls to .all: 8
        _ = EmptyView().spPaddingForDictionary([.top: nil, .vertical: nil, .all: 8])
    }

    @MainActor @Test("spPaddingForDictionary: nil value falls through to verticalDefault axis")
    func testPaddingNilValueFallsToVerticalDefaultAxis() {
        // all explicit values are nil → verticalDefault axis applies
        _ = EmptyView().spPaddingForDictionary(
            [.top: nil],
            verticalDefault: [.vertical: 5]
        )
    }

    @MainActor @Test("spPaddingForDictionary: nil value falls through to verticalDefault .all")
    func testPaddingNilValueFallsToVerticalDefaultAll() {
        _ = EmptyView().spPaddingForDictionary(
            [.top: nil, .vertical: nil],
            verticalDefault: [.all: 3]
        )
    }

    @MainActor @Test("spPaddingForDictionary: empty paddings resolved from verticalDefault exact")
    func testPaddingVerticalDefaultExact() {
        _ = EmptyView().spPaddingForDictionary(
            [:],
            verticalDefault: [.top: 7, .bottom: 14]
        )
    }

    @MainActor  @Test("spPaddingForDictionary: empty paddings resolved from horizontalDefault exact")
    func testPaddingHorizontalDefaultExact() {
        _ = EmptyView().spPaddingForDictionary(
            [:],
            horizontalDefault: [.leading: 5, .trailing: 10]
        )
    }

    @MainActor  @Test("spPaddingForDictionary: both defaultValues dictionaries applied simultaneously")
    func testPaddingBothDefaults() {
        _ = EmptyView().spPaddingForDictionary(
            [:],
            verticalDefault: [.vertical: 8],
            horizontalDefault: [.horizontal: 16]
        )
    }

    @MainActor  @Test("spPaddingForDictionary: explicit value overrides defaultValues")
    func testPaddingExplicitOverridesDefault() {
        // .top: 99 wins over verticalDefault even if verticalDefault is present
        _ = EmptyView().spPaddingForDictionary(
            [.top: 99],
            verticalDefault: [.top: 1]
        )
    }

    @MainActor  @Test("spPaddingForDictionary returns zero padding when all sources absent")
    func testPaddingAllAbsentReturnsZero() {
        // All dictionaries empty → spResolve returns 0 for every edge
        _ = EmptyView().spPaddingForDictionary([:])
    }

    // MARK: - spSafeAreaPaddingForDictionary

    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    @MainActor @Test("spSafeAreaPaddingForDictionary with empty dictionary returns view without crash")
    func testSafeAreaPaddingEmptyDict() {
        _ = EmptyView().spSafeAreaPaddingForDictionary([:])
    }

    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    @MainActor @Test("spSafeAreaPaddingForDictionary with exact-edge entries returns view without crash")
    func testSafeAreaPaddingExactEdge() {
        _ = EmptyView().spSafeAreaPaddingForDictionary([
            .top: 8,
            .bottom: 16,
            .leading: 4,
            .trailing: 4
        ])
    }

    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    @MainActor @Test("spSafeAreaPaddingForDictionary with .all entry returns view without crash")
    func testSafeAreaPaddingAllEdge() {
        _ = EmptyView().spSafeAreaPaddingForDictionary([.all: 12])
    }

    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    @MainActor @Test("spSafeAreaPaddingForDictionary with nil value falls through to defaults")
    func testSafeAreaPaddingNilFallsToDefault() {
        _ = EmptyView().spSafeAreaPaddingForDictionary(
            [.top: nil],
            verticalDefault: [.top: 10]
        )
    }

    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    @MainActor  @Test("spSafeAreaPaddingForDictionary negative values fall back to padding()")
    func testSafeAreaPaddingNegativeValue() {
        // spSmartSafeAreaPadding routes negative values through padding() instead of safeAreaPadding()
        _ = EmptyView().spSafeAreaPaddingForDictionary([.top: -8])
    }

    // MARK: - spSmartSafeAreaPadding

    @MainActor @Test("spSmartSafeAreaPadding positive value returns view without crash")
    func testSmartSafeAreaPositive() {
        _ = EmptyView().spSmartSafeAreaPadding(.top, 10)
    }

    @MainActor @Test("spSmartSafeAreaPadding zero value uses non-negative branch")
    func testSmartSafeAreaZero() {
        _ = EmptyView().spSmartSafeAreaPadding(.bottom, 0)
    }

    @MainActor @Test("spSmartSafeAreaPadding negative value uses padding() branch")
    func testSmartSafeAreaNegative() {
        // value < 0 → routes through padding(_:_:) instead of safeAreaPadding(_:_:)
        _ = EmptyView().spSmartSafeAreaPadding(.top, -5)
    }

    @MainActor @Test("spSmartSafeAreaPadding works for all edges")
    func testSmartSafeAreaAllEdges() {
        _ = EmptyView()
            .spSmartSafeAreaPadding(.top, 4)
            .spSmartSafeAreaPadding(.bottom, 4)
            .spSmartSafeAreaPadding(.leading, 4)
            .spSmartSafeAreaPadding(.trailing, 4)
    }

    @MainActor @Test("spSmartSafeAreaPadding can be chained with negative and positive values")
    func testSmartSafeAreaMixedChain() {
        _ = EmptyView()
            .spSmartSafeAreaPadding(.top, -10)
            .spSmartSafeAreaPadding(.bottom, 10)
    }
}
#endif
