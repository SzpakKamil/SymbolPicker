//
//  SPPresentationBackgroundInteractionTests.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 28/03/2026.
//

import SwiftUI
#if canImport(Testing)
import Testing
@testable import SymbolPicker

// MARK: - SPPresentationConfiguration.BackgroundInteraction Tests
//
// BackgroundInteraction: Sendable
// Cases: .automatic, .available(upThrough: PresentationDents), .enabled, .disabled
//
// BackgroundInteraction is NOT Equatable (it has an associated value and declares
// no explicit Equatable conformance). Tests use pattern matching via `if case`.
//
// `asPresentationBackgroundInteraction()` is only compiled on iOS / visionOS
// and requires iOS 16.4+.

struct SPPresentationBackgroundInteractionTests {

    typealias BI = SPPresentationConfiguration.BackgroundInteraction

    // MARK: - Case creation

    @Test("BackgroundInteraction.automatic can be created")
    func testAutomaticCase() {
        let bi = BI.automatic
        let isAutomatic: Bool
        if case .automatic = bi { isAutomatic = true } else { isAutomatic = false }
        #expect(isAutomatic)
    }

    @Test("BackgroundInteraction.enabled can be created")
    func testEnabledCase() {
        let bi = BI.enabled
        let isEnabled: Bool
        if case .enabled = bi { isEnabled = true } else { isEnabled = false }
        #expect(isEnabled)
    }

    @Test("BackgroundInteraction.disabled can be created")
    func testDisabledCase() {
        let bi = BI.disabled
        let isDisabled: Bool
        if case .disabled = bi { isDisabled = true } else { isDisabled = false }
        #expect(isDisabled)
    }

    @Test("BackgroundInteraction.available(upThrough: .large) can be created")
    func testAvailableUpThroughLarge() {
        let bi = BI.available(upThrough: .large)
        let isAvailable: Bool
        if case .available = bi { isAvailable = true } else { isAvailable = false }
        #expect(isAvailable)
    }

    @Test("BackgroundInteraction.available(upThrough: .medium) stores the correct dent")
    func testAvailableUpThroughMediumStoresdent() {
        let bi = BI.available(upThrough: .medium)
        if case .available(let dent) = bi {
            #expect(dent == .medium)
        } else {
            Issue.record("Expected .available(upThrough: .medium)")
        }
    }

    @Test("BackgroundInteraction.available(upThrough: .height(300)) stores the correct dent")
    func testAvailableUpThroughHeightStoresDent() {
        let bi = BI.available(upThrough: .height(300))
        if case .available(let dent) = bi {
            #expect(dent == .height(300))
        } else {
            Issue.record("Expected .available(upThrough: .height(300))")
        }
    }

    // MARK: - Distinct cases are distinct (pattern-match cross-check)

    @Test("BackgroundInteraction.enabled is not .disabled")
    func testEnabledIsNotDisabled() {
        let bi = BI.enabled
        let isDisabled: Bool
        if case .disabled = bi { isDisabled = true } else { isDisabled = false }
        #expect(!isDisabled)
    }

    @Test("BackgroundInteraction.automatic is not .enabled")
    func testAutomaticIsNotEnabled() {
        let bi = BI.automatic
        let isEnabled: Bool
        if case .enabled = bi { isEnabled = true } else { isEnabled = false }
        #expect(!isEnabled)
    }

    @Test("BackgroundInteraction.available is not .disabled")
    func testAvailableIsNotDisabled() {
        let bi = BI.available(upThrough: .large)
        let isDisabled: Bool
        if case .disabled = bi { isDisabled = true } else { isDisabled = false }
        #expect(!isDisabled)
    }
}
#endif
