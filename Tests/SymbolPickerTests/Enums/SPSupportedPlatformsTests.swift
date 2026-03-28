//
//  SPSupportedPlatformsTests.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 28/03/2026.
//

import Foundation
#if canImport(Testing)
import Testing
@testable import SymbolPicker

struct SPSupportedPlatformsTests {

    @Test("SPSupportedPlatforms majorVersion returns associated value")
    func testMajorVersion() {
        #expect(SPSupportedPlatforms.iOS(15).majorVersion == 15)
        #expect(SPSupportedPlatforms.macOS(12).majorVersion == 12)
        #expect(SPSupportedPlatforms.tvOS(15).majorVersion == 15)
        #expect(SPSupportedPlatforms.watchOS(10).majorVersion == 10)
        #expect(SPSupportedPlatforms.visionOS(1).majorVersion == 1)
        #expect(SPSupportedPlatforms.iOS().majorVersion == nil)
    }

    @Test("SPSupportedPlatforms isSamePlatform same type")
    func testIsSamePlatformSame() {
        #expect(SPSupportedPlatforms.iOS(15).isSamePlatform(as: .iOS(16)))
        #expect(SPSupportedPlatforms.macOS(12).isSamePlatform(as: .macOS(13)))
        #expect(SPSupportedPlatforms.tvOS(15).isSamePlatform(as: .tvOS(16)))
        #expect(SPSupportedPlatforms.watchOS(10).isSamePlatform(as: .watchOS(11)))
        #expect(SPSupportedPlatforms.visionOS(1).isSamePlatform(as: .visionOS(2)))
    }

    @Test("SPSupportedPlatforms isSamePlatform different type")
    func testIsSamePlatformDifferent() {
        #expect(!SPSupportedPlatforms.iOS(15).isSamePlatform(as: .macOS(12)))
        #expect(!SPSupportedPlatforms.macOS(12).isSamePlatform(as: .tvOS(15)))
        #expect(!SPSupportedPlatforms.watchOS(10).isSamePlatform(as: .visionOS(1)))
        #expect(!SPSupportedPlatforms.tvOS(15).isSamePlatform(as: .iOS(15)))
    }

    @Test("SPSupportedPlatforms currentPlatform returns a version")
    func testCurrentPlatform() {
        let platform = SPSupportedPlatforms.currentPlatform
        #expect(platform.majorVersion != nil)
    }

    @Test("SPSupportedPlatforms Hashable")
    func testHashable() {
        let set: Set<SPSupportedPlatforms> = [.iOS(15), .iOS(15), .macOS(12)]
        #expect(set.count == 2)
    }
}
#endif
