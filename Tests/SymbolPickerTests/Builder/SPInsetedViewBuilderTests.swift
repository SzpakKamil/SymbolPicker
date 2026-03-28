//
//  SPInsetedViewBuilderTests.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 28/03/2026.
//

import SwiftUI
#if canImport(Testing)
import Testing
@testable import SymbolPicker

// SPInsetedView stores AnyView which requires main-actor context.
@MainActor
struct SPInsetedViewBuilderTests {

    // MARK: - Helpers

    private func makeView(_ placement: SPInsetedView.Placement = .safeAreaTop) -> SPInsetedView {
        SPInsetedView(placement: placement) { Text("test") }
    }

    // MARK: - buildBlock()

    @Test("SPInsetedViewBuilder buildBlock() returns empty array")
    func testBuildBlockEmpty() {
        let result = SPInsetedViewBuilder.buildBlock()
        #expect(result.isEmpty)
    }

    // MARK: - buildBlock(_ components: SPInsetedView...)

    @Test("SPInsetedViewBuilder buildBlock variadic preserves count")
    func testBuildBlockVariadicCount() {
        let v1 = makeView(.safeAreaTop)
        let v2 = makeView(.safeAreaBottom)
        let result = SPInsetedViewBuilder.buildBlock(v1, v2)
        #expect(result.count == 2)
    }

    @Test("SPInsetedViewBuilder buildBlock variadic preserves placement order")
    func testBuildBlockVariadicOrder() {
        let v1 = makeView(.safeAreaTop)
        let v2 = makeView(.scrollContentTop)
        let result = SPInsetedViewBuilder.buildBlock(v1, v2)
        #expect(result[0].placement == .safeAreaTop)
        #expect(result[1].placement == .scrollContentTop)
    }

    @Test("SPInsetedViewBuilder buildBlock single element")
    func testBuildBlockSingleElement() {
        let v1 = makeView(.safeAreaBottom)
        let result = SPInsetedViewBuilder.buildBlock(v1)
        #expect(result.count == 1)
        #expect(result[0].placement == .safeAreaBottom)
    }

    // MARK: - buildBlock(_ components: [SPInsetedView])

    @Test("SPInsetedViewBuilder buildBlock array passthrough")
    func testBuildBlockArray() {
        let views = [makeView(.safeAreaTop), makeView(.safeAreaBottom)]
        let result = SPInsetedViewBuilder.buildBlock(views)
        #expect(result.count == 2)
    }

    // MARK: - buildBlock(_ components: [SPInsetedView]...)

    @Test("SPInsetedViewBuilder buildBlock variadic arrays flattens")
    func testBuildBlockVariadicArrays() {
        let a = [makeView(.safeAreaTop)]
        let b = [makeView(.safeAreaBottom), makeView(.scrollContentTop)]
        let result = SPInsetedViewBuilder.buildBlock(a, b)
        #expect(result.count == 3)
    }

    // MARK: - buildBlock(_ components: [[SPInsetedView]])

    @Test("SPInsetedViewBuilder buildBlock nested arrays flattens")
    func testBuildBlockNestedArrays() {
        let nested = [[makeView(.safeAreaTop)], [makeView(.safeAreaBottom)]]
        let result = SPInsetedViewBuilder.buildBlock(nested)
        #expect(result.count == 2)
    }

    // MARK: - buildPartialBlock

    @Test("SPInsetedViewBuilder buildPartialBlock concatenates accumulated and next")
    func testBuildPartialBlock() {
        let accumulated = [makeView(.safeAreaTop)]
        let next = [makeView(.safeAreaBottom)]
        let result = SPInsetedViewBuilder.buildPartialBlock(accumulated: accumulated, next: next)
        #expect(result.count == 2)
        #expect(result[0].placement == .safeAreaTop)
        #expect(result[1].placement == .safeAreaBottom)
    }

    @Test("SPInsetedViewBuilder buildPartialBlock empty accumulated")
    func testBuildPartialBlockEmptyAccumulated() {
        let result = SPInsetedViewBuilder.buildPartialBlock(accumulated: [], next: [makeView(.safeAreaTop)])
        #expect(result.count == 1)
    }

    @Test("SPInsetedViewBuilder buildPartialBlock empty next")
    func testBuildPartialBlockEmptyNext() {
        let result = SPInsetedViewBuilder.buildPartialBlock(accumulated: [makeView(.safeAreaTop)], next: [])
        #expect(result.count == 1)
    }

    // MARK: - buildArray

    @Test("SPInsetedViewBuilder buildArray flattens array of arrays")
    func testBuildArray() {
        let input = [[makeView(.safeAreaTop)], [makeView(.safeAreaBottom), makeView(.scrollContentTop)]]
        let result = SPInsetedViewBuilder.buildArray(input)
        #expect(result.count == 3)
    }

    @Test("SPInsetedViewBuilder buildArray empty input returns empty")
    func testBuildArrayEmpty() {
        let result = SPInsetedViewBuilder.buildArray([])
        #expect(result.isEmpty)
    }

    // MARK: - buildFinalResult

    @Test("SPInsetedViewBuilder buildFinalResult is identity")
    func testBuildFinalResult() {
        let input = [makeView(.safeAreaTop), makeView(.scrollSectionTop)]
        let result = SPInsetedViewBuilder.buildFinalResult(input)
        #expect(result.count == 2)
    }

    // MARK: - buildOptional

    @Test("SPInsetedViewBuilder buildOptional(nil) returns empty array")
    func testBuildOptionalNil() {
        let result = SPInsetedViewBuilder.buildOptional(nil)
        #expect(result.isEmpty)
    }

    @Test("SPInsetedViewBuilder buildOptional(some) returns the wrapped value")
    func testBuildOptionalSome() {
        let views: [SPInsetedView]? = [makeView(.safeAreaTop)]
        let result = SPInsetedViewBuilder.buildOptional(views)
        #expect(result.count == 1)
    }

    // MARK: - buildEither

    @Test("SPInsetedViewBuilder buildEither(first:) returns first branch")
    func testBuildEitherFirst() {
        let first = [makeView(.safeAreaTop)]
        let result = SPInsetedViewBuilder.buildEither(first: first)
        #expect(result.count == 1)
        #expect(result[0].placement == .safeAreaTop)
    }

    @Test("SPInsetedViewBuilder buildEither(second:) returns second branch")
    func testBuildEitherSecond() {
        let second = [makeView(.scrollContentBottom)]
        let result = SPInsetedViewBuilder.buildEither(second: second)
        #expect(result.count == 1)
        #expect(result[0].placement == .scrollContentBottom)
    }

    // MARK: - buildLimitedAvailability

    @Test("SPInsetedViewBuilder buildLimitedAvailability passes through")
    func testBuildLimitedAvailability() {
        let input = [makeView(.scrollSectionBottom)]
        let result = SPInsetedViewBuilder.buildLimitedAvailability(input)
        #expect(result.count == 1)
    }

    // MARK: - buildExpression

    @Test("SPInsetedViewBuilder buildExpression variadic wraps in array")
    func testBuildExpressionVariadic() {
        let v1 = makeView(.safeAreaTop)
        let v2 = makeView(.scrollContentTop)
        let result = SPInsetedViewBuilder.buildExpression(v1, v2)
        #expect(result.count == 2)
    }

    @Test("SPInsetedViewBuilder buildExpression array passthrough")
    func testBuildExpressionArray() {
        let input = [makeView(.safeAreaBottom)]
        let result = SPInsetedViewBuilder.buildExpression(input)
        #expect(result.count == 1)
    }
}
#endif
