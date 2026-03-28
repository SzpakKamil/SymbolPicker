//
//  SPPresentationDentsTests.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 28/03/2026.
//

import SwiftUI
#if canImport(Testing)
import Testing
@testable import SymbolPicker

// MARK: - SPPresentationConfiguration.PresentationDents Tests
//
// PresentationDents: Sendable, Hashable
// Cases: .large, .medium, .height(CGFloat), .fraction(CGFloat)
//
// On iOS / visionOS with iOS 16+, `asPresentationSize()` maps each case to the
// corresponding SwiftUI PresentationDetent.

struct SPPresentationDentsTests {

    typealias Dent = SPPresentationConfiguration.PresentationDents

    // MARK: - Equatable (synthesised via Hashable)

    @Test("PresentationDents.large equals itself")
    func testLargeEquality() {
        #expect(Dent.large == Dent.large)
    }

    @Test("PresentationDents.medium equals itself")
    func testMediumEquality() {
        #expect(Dent.medium == Dent.medium)
    }

    @Test("PresentationDents.height(n) equals .height(n) with same value")
    func testHeightEquality() {
        #expect(Dent.height(300) == Dent.height(300))
    }

    @Test("PresentationDents.height(n) does not equal .height(m) with different values")
    func testHeightInequalityDifferentValues() {
        #expect(Dent.height(100) != Dent.height(200))
    }

    @Test("PresentationDents.fraction(n) equals .fraction(n) with same value")
    func testFractionEquality() {
        #expect(Dent.fraction(0.5) == Dent.fraction(0.5))
    }

    @Test("PresentationDents.fraction(n) does not equal .fraction(m) with different values")
    func testFractionInequalityDifferentValues() {
        #expect(Dent.fraction(0.3) != Dent.fraction(0.7))
    }

    @Test("PresentationDents.large does not equal .medium")
    func testLargeNotEqualMedium() {
        #expect(Dent.large != Dent.medium)
    }

    @Test("PresentationDents.large does not equal .height(n)")
    func testLargeNotEqualHeight() {
        #expect(Dent.large != Dent.height(500))
    }

    @Test("PresentationDents.medium does not equal .fraction(n)")
    func testMediumNotEqualFraction() {
        #expect(Dent.medium != Dent.fraction(0.5))
    }

    // MARK: - Hashable

    @Test("PresentationDents values can be stored in a Set")
    func testHashableSet() {
        let set: Set<Dent> = [.large, .medium, .height(300), .fraction(0.5)]
        #expect(set.count == 4)
    }

    @Test("PresentationDents Set deduplicates equal cases")
    func testSetDeduplication() {
        let set: Set<Dent> = [.large, .large, .medium]
        #expect(set.count == 2)
    }

    @Test("PresentationDents same case with same associated value has equal hash")
    func testSameAssociatedValueEqualHash() {
        #expect(Dent.height(200).hashValue == Dent.height(200).hashValue)
        #expect(Dent.fraction(0.25).hashValue == Dent.fraction(0.25).hashValue)
    }

    @Test("PresentationDents Set of [.medium, .large] has count 2")
    func testPresentationDentsMediumLargeSet() {
        let set: Set<Dent> = [.medium, .large]
        #expect(set.count == 2)
    }

    // MARK: - asPresentationSize (iOS / visionOS)

    #if os(iOS) || os(visionOS)
    @available(iOS 16.0, *)
    @Test("PresentationDents.large maps to PresentationDetent.large")
    func testLargeMapsToPresentationDetentLarge() {
        #expect(Dent.large.asPresentationSize() == .large)
    }

    @available(iOS 16.0, *)
    @Test("PresentationDents.medium maps to PresentationDetent.medium")
    func testMediumMapsToPresentationDetentMedium() {
        #expect(Dent.medium.asPresentationSize() == .medium)
    }

    @available(iOS 16.0, *)
    @Test("PresentationDents.height(n) maps to PresentationDetent.height(n)")
    func testHeightMapsToPresentationDetentHeight() {
        #expect(Dent.height(300).asPresentationSize() == .height(300))
    }

    @available(iOS 16.0, *)
    @Test("PresentationDents.fraction(n) maps to PresentationDetent.fraction(n)")
    func testFractionMapsToPresentationDetentFraction() {
        #expect(Dent.fraction(0.5).asPresentationSize() == .fraction(0.5))
    }

    @available(iOS 16.0, *)
    @Test("PresentationDents.height(0) maps to PresentationDetent.height(0)")
    func testHeightZeroMapsToDetentHeightZero() {
        #expect(Dent.height(0).asPresentationSize() == .height(0))
    }

    @available(iOS 16.0, *)
    @Test("PresentationDents.fraction(1.0) maps to PresentationDetent.fraction(1.0)")
    func testFractionOneMapsToDetentFractionOne() {
        #expect(Dent.fraction(1.0).asPresentationSize() == .fraction(1.0))
    }
    #endif
}
#endif
