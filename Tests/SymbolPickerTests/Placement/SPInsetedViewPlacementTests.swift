//
//  SPInsetedViewPlacementTests.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 28/03/2026.
//

import Foundation
#if canImport(Testing)
import Testing
@testable import SymbolPicker

struct SPInsetedViewPlacementTests {

    // MARK: - Identifiable: id == rawValue

    @Test("Placement.safeAreaTop id equals rawValue")
    func testSafeAreaTopId() {
        let p = SPInsetedView.Placement.safeAreaTop
        #expect(p.id == p.rawValue)
    }

    @Test("Placement.safeAreaBottom id equals rawValue")
    func testSafeAreaBottomId() {
        let p = SPInsetedView.Placement.safeAreaBottom
        #expect(p.id == p.rawValue)
    }

    @Test("Placement.scrollContentTop id equals rawValue")
    func testScrollContentTopId() {
        let p = SPInsetedView.Placement.scrollContentTop
        #expect(p.id == p.rawValue)
    }

    @Test("Placement.scrollSectionTop id equals rawValue")
    func testScrollSectionTopId() {
        let p = SPInsetedView.Placement.scrollSectionTop
        #expect(p.id == p.rawValue)
    }

    @Test("Placement.scrollSectionBottom id equals rawValue")
    func testScrollSectionBottomId() {
        let p = SPInsetedView.Placement.scrollSectionBottom
        #expect(p.id == p.rawValue)
    }

    @Test("Placement.scrollContentBottom id equals rawValue")
    func testScrollContentBottomId() {
        let p = SPInsetedView.Placement.scrollContentBottom
        #expect(p.id == p.rawValue)
    }

    // MARK: - Hashable

    @Test("Placement values can be stored in a Set")
    func testHashable() {
        var set = Set<SPInsetedView.Placement>()
        set.insert(.safeAreaTop)
        set.insert(.safeAreaBottom)
        set.insert(.scrollContentTop)
        set.insert(.scrollContentTop) // duplicate
        #expect(set.count == 3)
    }

    @Test("Placement same case hashes equally")
    func testSameCaseEqualHash() {
        let a = SPInsetedView.Placement.safeAreaTop
        let b = SPInsetedView.Placement.safeAreaTop
        #expect(a == b)
        #expect(a.hashValue == b.hashValue)
    }

    // MARK: - Equatable / rawValue distinctness

    @Test("Cross-section placements are all distinct")
    func testCrossSectionDistinct() {
        let placements: [SPInsetedView.Placement] = [
            .safeAreaTop, .safeAreaBottom,
            .scrollContentTop, .scrollSectionTop,
            .scrollSectionBottom, .scrollContentBottom
        ]
        let rawValues = placements.map(\.rawValue)
        #expect(rawValues.count == Set(rawValues).count)
    }

    @Test("safeAreaTop rawValue is less than safeAreaBottom rawValue")
    func testRawValueOrdering() {
        #expect(SPInsetedView.Placement.safeAreaTop.rawValue < SPInsetedView.Placement.safeAreaBottom.rawValue)
    }

    @Test("scrollContentTop rawValue is less than scrollContentBottom rawValue")
    func testScrollRawValueOrdering() {
        #expect(SPInsetedView.Placement.scrollContentTop.rawValue < SPInsetedView.Placement.scrollContentBottom.rawValue)
    }

    // MARK: - Sendable & Identifiable conformance

    @Test("Placement conforms to Identifiable with Int id")
    func testIdentifiableId() {
        let p: any Identifiable = SPInsetedView.Placement.scrollSectionTop
        // id property exists and returns the rawValue
        #expect((p as? SPInsetedView.Placement)?.id == SPInsetedView.Placement.scrollSectionTop.rawValue)
    }

    // MARK: - Platform-specific cases

    #if os(iOS)
    @Test("Placement.toolbarTopLeading id equals rawValue (iOS only)")
    func testToolbarTopLeadingId() {
        let p = SPInsetedView.Placement.toolbarTopLeading
        #expect(p.id == p.rawValue)
    }

    @Test("Placement.toolbarTopTralling id equals rawValue (iOS)")
    func testToolbarTopTrallingIdIOS() {
        let p = SPInsetedView.Placement.toolbarTopTralling
        #expect(p.id == p.rawValue)
    }

    @Test("Placement.toolbarBottomLeading id equals rawValue (iOS)")
    func testToolbarBottomLeadingIdIOS() {
        let p = SPInsetedView.Placement.toolbarBottomLeading
        #expect(p.id == p.rawValue)
    }

    @Test("Placement.toolbarBottom id equals rawValue (iOS)")
    func testToolbarBottomIdIOS() {
        let p = SPInsetedView.Placement.toolbarBottom
        #expect(p.id == p.rawValue)
    }

    @Test("Placement.toolbarBottomTralling id equals rawValue (iOS)")
    func testToolbarBottomTrallingIdIOS() {
        let p = SPInsetedView.Placement.toolbarBottomTralling
        #expect(p.id == p.rawValue)
    }

    @Test("All iOS-specific toolbar placements are distinct")
    func testIOSToolbarPlacementsDistinct() {
        let toolbarPlacements: [SPInsetedView.Placement] = [
            .toolbarTopLeading, .toolbarTopTralling,
            .toolbarBottomLeading, .toolbarBottom, .toolbarBottomTralling
        ]
        let rawValues = toolbarPlacements.map(\.rawValue)
        #expect(rawValues.count == Set(rawValues).count)
    }
    #endif

    #if os(watchOS)
    @Test("Placement.toolbarTopTralling id equals rawValue (watchOS)")
    func testToolbarTopTrallingIdWatchOS() {
        let p = SPInsetedView.Placement.toolbarTopTralling
        #expect(p.id == p.rawValue)
    }

    @Test("Placement.toolbarBottomLeading id equals rawValue (watchOS)")
    func testToolbarBottomLeadingIdWatchOS() {
        let p = SPInsetedView.Placement.toolbarBottomLeading
        #expect(p.id == p.rawValue)
    }

    @Test("Placement.toolbarBottom id equals rawValue (watchOS)")
    func testToolbarBottomIdWatchOS() {
        let p = SPInsetedView.Placement.toolbarBottom
        #expect(p.id == p.rawValue)
    }

    @Test("Placement.toolbarBottomTralling id equals rawValue (watchOS)")
    func testToolbarBottomTrallingIdWatchOS() {
        let p = SPInsetedView.Placement.toolbarBottomTralling
        #expect(p.id == p.rawValue)
    }
    #endif
}
#endif
