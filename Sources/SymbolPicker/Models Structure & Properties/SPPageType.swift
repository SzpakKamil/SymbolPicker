//
//  SPPageType.swift
//  SymbolPicker
//
//  Refactored for Performance & Network Safety
//

import SwiftUI

public enum SPPageType: String, Codable, Sendable, Equatable, CaseIterable, Identifiable, Hashable {
    #if os(iOS) || os(macOS) || os(visionOS)
    @available(iOS 16.0, macOS 14.0, *)
    case image = "Image"
    #endif
    case emoji = "Emoji"
    case symbol = "Symbol"
    
    public var id: String{
        rawValue
    }
    
    var systemName: String{
        #if os(iOS) || os(macOS) || os(visionOS)
        if #available(iOS 16.0, macOS 14.0, *){
            switch self {
            case .image:
                return "photo"
            case .emoji:
                return "hand.thumbsup.fill"
            case .symbol:
                return "star.fill"
            }
        }else{
            switch self {
            case .emoji:
                return "hand.thumbsup.fill"
            case .symbol:
                return "star.fill"
            }
        }
        #else
        switch self {
        case .emoji:
            return "hand.thumbsup.fill"
        case .symbol:
            return "star.fill"
        }
        #endif
    }


    public static var allCases: [SPPageType] {
        #if os(iOS) || os(macOS) || os(visionOS)
        if #available(iOS 16.0, macOS 14.0, *){
            [.image, .emoji, .symbol]
        }else{
            [.emoji, .symbol]
        }
        #else
        [.emoji, .symbol]
        #endif
    }
    
    var localizedDescription: String {
        if #available (iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *){
            return String(localized: .init("SPPageType.\(rawValue)"), bundle: .module)
        } else {
            return NSLocalizedString(.init("SPPageType.\(rawValue)"), bundle: .module, comment: "")
        }
    }
}
