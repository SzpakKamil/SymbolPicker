//
//  SPSupportedPlatforms.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 22/02/2026.
//

import Foundation

public enum SPSupportedPlatforms: Hashable, Sendable {
    case iOS(_ version: Int? = nil)
    case macOS(_ version: Int? = nil)
    case tvOS(_ version: Int? = nil)
    case watchOS(_ version: Int? = nil)
    case visionOS(_ version: Int? = nil)
    
    static var currentPlatform: SPSupportedPlatforms {
        let version = ProcessInfo.processInfo.operatingSystemVersion.majorVersion
        
        #if os(iOS)
        return .iOS(version)
        #elseif os(macOS)
        return .macOS(version)
        #elseif os(tvOS)
        return .tvOS(version)
        #elseif os(watchOS)
        return .watchOS(version)
        #else
        // Fallback for visionOS or future platforms
        return .visionOS(version)
        #endif
    }
    
    var majorVersion: Int? {
        switch self {
        case .iOS(let v), .macOS(let v), .tvOS(let v), .watchOS(let v), .visionOS(let v):
            return v
        }
    }

    func isSamePlatform(as other: SPSupportedPlatforms) -> Bool {
        switch (self, other) {
        case (.iOS, .iOS), (.macOS, .macOS), (.tvOS, .tvOS), (.watchOS, .watchOS), (.visionOS, .visionOS):
            return true
        default:
            return false
        }
    }
}
