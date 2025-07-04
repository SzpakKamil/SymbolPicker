//
//  SymbolModel.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 11/06/2025.
//

import Foundation
#if canImport(UIKit)
import UIKit
#endif

public struct SymbolModel: Identifiable, Equatable, Sendable, Hashable, Comparable {
    public let id: String
    public let filledSymbolName: String
    public let notFilledSymbolName: String
    public let description: String
    public let lowercasedDescription: String
    public let symbolMinimumVersion: Double
    
    public init(symbolName: String, description: String, symbolMinimumVersion: Double = 1.0) {
        self.id = symbolName
        self.filledSymbolName = symbolName
        var components = filledSymbolName.components(separatedBy: ".")
        if components.last == "fill" {
            components.removeLast()
        }
        notFilledSymbolName = components.joined(separator: ".")
        self.description = description
        self.lowercasedDescription = description.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        self.symbolMinimumVersion = symbolMinimumVersion
    }
    
    public init(symbolNameFilled: String, symbolNameNotFilled: String, description: String, symbolMinimumVersion: Double = 1.0) {
        self.id = symbolNameFilled
        self.filledSymbolName = symbolNameFilled
        notFilledSymbolName = symbolNameNotFilled
        self.description = description
        self.lowercasedDescription = description.lowercased()
        self.symbolMinimumVersion = symbolMinimumVersion
    }
    
    public init(symbolNameFilledNotFilled: String, description: String, symbolMinimumVersion: Double = 1.0) {
        self.id = symbolNameFilledNotFilled
        self.filledSymbolName = symbolNameFilledNotFilled
        notFilledSymbolName = symbolNameFilledNotFilled
        self.description = description
        self.lowercasedDescription = description.lowercased()
        self.symbolMinimumVersion = symbolMinimumVersion
    }
    
    public static func <(lhs: SymbolModel, rhs: SymbolModel) -> Bool {
        return lhs.filledSymbolName < rhs.filledSymbolName
    }
    
    public static func ==(lhs: SymbolModel, rhs: SymbolModel) -> Bool {
        return lhs.notFilledSymbolName == rhs.notFilledSymbolName || lhs.filledSymbolName == rhs.filledSymbolName
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine("\(id)-\(notFilledSymbolName)")
    }
    
    public func isInsideSearchText(_ searchText: String) -> Bool {
        return lowercasedDescription.localizedStandardContains(searchText) || notFilledSymbolName.lowercased().replacingOccurrences(of: ".", with: " ").localizedStandardContains(searchText)
    }
    
    @MainActor
    public var isAvailable: Bool {
        let currentSFSymbolsVersion: Double
        
        #if os(iOS) || os(tvOS) || os(visionOS) || os(macOS) || os(watchOS)
        let osVersion = ProcessInfo.processInfo.operatingSystemVersion
        #endif
        
        #if canImport(UIKit)
        let systemVersion = UIDevice.current.systemVersion
        #endif
        
        #if os(iOS) || os(tvOS)
        #if canImport(UIKit)
        let majorVersion = Double(systemVersion.split(separator: ".").prefix(2).joined(separator: ".")) ?? 1.0
        #else
        let majorVersion = Double(osVersion.majorVersion)
        #endif
        if majorVersion >= 26 {
            let adjustingValue = 26 - 7
            currentSFSymbolsVersion = Double(majorVersion - Double(adjustingValue))
        } else{
            let adjustingValue = 18 - 6
            currentSFSymbolsVersion = Double(majorVersion - Double(adjustingValue))
        }
        #elseif os(visionOS)
        let majorVersion = Double(osVersion.majorVersion)
        if majorVersion >= 26 {
            let adjustingValue = 26 - 7
            currentSFSymbolsVersion = Double(majorVersion - Double(adjustingValue))
        } else  {
            let adjustingValue = 6 - 2
            currentSFSymbolsVersion = Double(adjustingValue + 4)
        }
        #elseif os(macOS)
        let majorVersion = Double(osVersion.majorVersion)
        if majorVersion >= 26 {
            let adjustingValue = 26 - 7
            currentSFSymbolsVersion = Double(majorVersion - Double(adjustingValue))
        } else {
            let adjustingValue = 15 - 6
            currentSFSymbolsVersion = Double(majorVersion - Double(adjustingValue))
        }
        #elseif os(watchOS)
        let majorVersion = Double(osVersion.majorVersion)
        if majorVersion >= 26 {
            let adjustingValue = 26 - 7
            currentSFSymbolsVersion = Double(majorVersion - Double(adjustingValue))
        } else {
            let adjustingValue = 11 - 6
            currentSFSymbolsVersion = Double(majorVersion - Double(adjustingValue))
        }
        #else
        currentSFSymbolsVersion = 1.0
        #endif
        return currentSFSymbolsVersion >= symbolMinimumVersion
    }
}
