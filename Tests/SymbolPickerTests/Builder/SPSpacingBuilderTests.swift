//
//  SPSpacingBuilderTests.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 28/03/2026.
//

import SwiftUI
#if canImport(Testing)
import Testing
@testable import SymbolPicker

struct SPSpacingBuilderTests {

    // MARK: - Helpers

    private func makeSpacing(_ component: SPSpacing.Component, width: CGFloat = 0) -> SPSpacing {
        SPSpacing(component: component, width: width)
    }

    // MARK: - buildBlock()

    @Test("SPSpacingBuilder buildBlock() returns empty array")
    func testBuildBlockEmpty() {
        let result = SPSpacingBuilder.buildBlock()
        #expect(result.isEmpty)
    }

    // MARK: - buildBlock(_ components: SPSpacing...)

    @Test("SPSpacingBuilder buildBlock variadic preserves count")
    func testBuildBlockVariadicCount() {
        let s1 = makeSpacing(.colorPicker)
        let s2 = makeSpacing(.optionList)
        let result = SPSpacingBuilder.buildBlock(s1, s2)
        #expect(result.count == 2)
    }

    @Test("SPSpacingBuilder buildBlock variadic preserves component order")
    func testBuildBlockVariadicOrder() {
        let s1 = makeSpacing(.colorPicker)
        let s2 = makeSpacing(.optionList)
        let s3 = makeSpacing(.previewSelection)
        let result = SPSpacingBuilder.buildBlock(s1, s2, s3)
        #expect(result[0].component == .colorPicker)
        #expect(result[1].component == .optionList)
        #expect(result[2].component == .previewSelection)
    }

    @Test("SPSpacingBuilder buildBlock single element")
    func testBuildBlockSingleElement() {
        let s = makeSpacing(.previewSelection)
        let result = SPSpacingBuilder.buildBlock(s)
        #expect(result.count == 1)
        #expect(result[0].component == .previewSelection)
    }

    // MARK: - buildBlock(_ components: [SPSpacing])

    @Test("SPSpacingBuilder buildBlock array passthrough")
    func testBuildBlockArray() {
        let arr = [makeSpacing(.colorPicker), makeSpacing(.optionList)]
        let result = SPSpacingBuilder.buildBlock(arr)
        #expect(result.count == 2)
    }

    // MARK: - buildBlock(_ components: [SPSpacing]...)

    @Test("SPSpacingBuilder buildBlock variadic arrays flattens")
    func testBuildBlockVariadicArrays() {
        let a = [makeSpacing(.colorPicker)]
        let b = [makeSpacing(.optionList), makeSpacing(.previewSelection)]
        let result = SPSpacingBuilder.buildBlock(a, b)
        #expect(result.count == 3)
    }

    // MARK: - buildBlock(_ components: [[SPSpacing]])

    @Test("SPSpacingBuilder buildBlock nested arrays flattens")
    func testBuildBlockNestedArrays() {
        let nested = [[makeSpacing(.colorPicker)], [makeSpacing(.optionList)]]
        let result = SPSpacingBuilder.buildBlock(nested)
        #expect(result.count == 2)
    }

    // MARK: - buildPartialBlock

    @Test("SPSpacingBuilder buildPartialBlock concatenates accumulated and next")
    func testBuildPartialBlock() {
        let accumulated = [makeSpacing(.colorPicker)]
        let next = [makeSpacing(.optionList)]
        let result = SPSpacingBuilder.buildPartialBlock(accumulated: accumulated, next: next)
        #expect(result.count == 2)
        #expect(result[0].component == .colorPicker)
        #expect(result[1].component == .optionList)
    }

    @Test("SPSpacingBuilder buildPartialBlock empty accumulated")
    func testBuildPartialBlockEmptyAccumulated() {
        let result = SPSpacingBuilder.buildPartialBlock(accumulated: [], next: [makeSpacing(.colorPicker)])
        #expect(result.count == 1)
    }

    @Test("SPSpacingBuilder buildPartialBlock empty next")
    func testBuildPartialBlockEmptyNext() {
        let result = SPSpacingBuilder.buildPartialBlock(accumulated: [makeSpacing(.colorPicker)], next: [])
        #expect(result.count == 1)
    }

    // MARK: - buildArray

    @Test("SPSpacingBuilder buildArray flattens array of arrays")
    func testBuildArray() {
        let input = [[makeSpacing(.colorPicker)], [makeSpacing(.optionList), makeSpacing(.previewSelection)]]
        let result = SPSpacingBuilder.buildArray(input)
        #expect(result.count == 3)
    }

    @Test("SPSpacingBuilder buildArray empty input returns empty")
    func testBuildArrayEmpty() {
        let result = SPSpacingBuilder.buildArray([])
        #expect(result.isEmpty)
    }

    // MARK: - buildFinalResult

    @Test("SPSpacingBuilder buildFinalResult is identity")
    func testBuildFinalResult() {
        let input = [makeSpacing(.colorPicker), makeSpacing(.previewSelection)]
        let result = SPSpacingBuilder.buildFinalResult(input)
        #expect(result.count == 2)
    }

    // MARK: - buildOptional

    @Test("SPSpacingBuilder buildOptional(nil) returns empty array")
    func testBuildOptionalNil() {
        let result = SPSpacingBuilder.buildOptional(nil)
        #expect(result.isEmpty)
    }

    @Test("SPSpacingBuilder buildOptional(some) returns the wrapped value")
    func testBuildOptionalSome() {
        let spacings: [SPSpacing]? = [makeSpacing(.colorPicker)]
        let result = SPSpacingBuilder.buildOptional(spacings)
        #expect(result.count == 1)
        #expect(result[0].component == .colorPicker)
    }

    // MARK: - buildEither

    @Test("SPSpacingBuilder buildEither(first:) returns first branch")
    func testBuildEitherFirst() {
        let first = [makeSpacing(.colorPicker)]
        let result = SPSpacingBuilder.buildEither(first: first)
        #expect(result.count == 1)
        #expect(result[0].component == .colorPicker)
    }

    @Test("SPSpacingBuilder buildEither(second:) returns second branch")
    func testBuildEitherSecond() {
        let second = [makeSpacing(.previewSelection)]
        let result = SPSpacingBuilder.buildEither(second: second)
        #expect(result.count == 1)
        #expect(result[0].component == .previewSelection)
    }

    // MARK: - buildLimitedAvailability

    @Test("SPSpacingBuilder buildLimitedAvailability passes through")
    func testBuildLimitedAvailability() {
        let input = [makeSpacing(.optionList)]
        let result = SPSpacingBuilder.buildLimitedAvailability(input)
        #expect(result.count == 1)
        #expect(result[0].component == .optionList)
    }

    // MARK: - buildExpression

    @Test("SPSpacingBuilder buildExpression variadic wraps in array")
    func testBuildExpressionVariadic() {
        let s1 = makeSpacing(.colorPicker)
        let s2 = makeSpacing(.optionList)
        let result = SPSpacingBuilder.buildExpression(s1, s2)
        #expect(result.count == 2)
    }

    @Test("SPSpacingBuilder buildExpression array passthrough")
    func testBuildExpressionArray() {
        let input = [makeSpacing(.previewSelection)]
        let result = SPSpacingBuilder.buildExpression(input)
        #expect(result.count == 1)
    }

    // MARK: - Integration: @SPSpacingBuilder annotated closure compiles and works

    @Test("@SPSpacingBuilder closure with if/else compiles correctly")
    func testBuilderClosureWithIfElse() {
        let flag = true
        @SPSpacingBuilder func build() -> [SPSpacing] {
            if flag {
                SPSpacing(component: .colorPicker, width: 10)
            } else {
                SPSpacing(component: .optionList, width: 20)
            }
        }
        let result = build()
        #expect(result.count == 1)
        #expect(result[0].component == .colorPicker)
        #expect(result[0].getValue(for: .width, at: .large) == 10)
    }

    @Test("@SPSpacingBuilder closure with for-loop compiles via buildArray")
    func testBuilderClosureWithLoop() {
        @SPSpacingBuilder func build() -> [SPSpacing] {
            for component in SPSpacing.Component.allCases {
                SPSpacing(component: component, width: 50)
            }
        }
        let result = build()
        #expect(result.count == SPSpacing.Component.allCases.count)
    }
}
#endif
