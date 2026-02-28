//
//  SwiftUIView.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 08/02/2026.
//

import SwiftUI

public protocol SPDataAsset: Sendable, Equatable, Identifiable, Codable{
    associatedtype Body: View
    var annotation: String? { get }
    var category: String? { get }
    var subcategory: String? { get }
    var tags: [String]? { get }
    func matches(_ text: String) -> Bool
    static var filePrefix: String { get }
    static func fetchAssets(locale: String) async throws -> [Self]
    func isAvailable() -> Bool
    @MainActor @ViewBuilder func asView() -> Body
}

extension SPDataAsset{
    static var localizationPrefix: String {
        return "\(Self.filePrefix)_supportedLocalizations"
    }
    static var resolvedLocalePrefix: String {
        return "\(Self.filePrefix)_resolvedLocale"
    }
    public func matches(_ text: String) -> Bool {
        return  tags?.filter{ $0.contains(text)}.isEmpty == false ||
                annotation?.localizedStandardContains(text) == true ||
                category?.localizedStandardContains(text) == true ||
                subcategory?.localizedStandardContains(text) == true
    }
}

