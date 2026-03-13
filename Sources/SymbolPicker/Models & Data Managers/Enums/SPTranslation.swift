//
//  SPTranslation.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

enum SPTranslation: String, Codable, Sendable, Equatable, Identifiable, Hashable {
    case DetectedColor = "SPTranslation.DetectedColor"
    case HorizontalOffset = "SPTranslation.HorizontalOffset"
    case PageType = "SPTranslation.PageType"
    case SearchEmojis = "SPTranslation.SearchEmojis"
    case SearchResults = "SPTranslation.SearchResults"
    case SearchSymbols = "SPTranslation.SearchSymbols"
    case SelectImage = "SPTranslation.SelectImage"
    case Source = "SPTranslation.Source"
    case VerticalOffset = "SPTranslation.VerticalOffset"
    case Zoom = "SPTranslation.Zoom"
    case Manipulation = "SPTranslation.Manipulation"
    case NoResultsFound = "SPTranslation.NoResultsFound"
    
    
    var id: String{
        rawValue
    }

    var localizedDescription: String {
        if #available (iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *){
            return String(localized: .init(rawValue), bundle: .module)
        } else {
            return NSLocalizedString(.init(rawValue), bundle: .module, comment: "")
        }
    }
}
