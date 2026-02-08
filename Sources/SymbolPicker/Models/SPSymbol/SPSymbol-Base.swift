//
//  SPSymbol-Base.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 07/02/2026.
//

import SwiftUI

public nonisolated struct SPSymbol: Identifiable, Sendable, SPDataAsset {
    public let id: String
    public let annotation: String?
    public let filledName: String
    public let notFilled: String
    public let version: Double
    public var variant: SPSymbol.Variant? = nil
    public let category: String?
    public let subcategory: String?
    public let tags: [String]?
    
    init(filledName: String, notFilled: String, version: Double, variant: SPSymbol.Variant? = nil, annotation: String? = nil, category: String? = nil, subcategory: String? = nil, tags: [String]? = nil) {
        self.id = filledName
        self.filledName = filledName
        self.notFilled = notFilled
        self.annotation = annotation
        self.version = version
        self.variant = variant
        self.category = category
        self.subcategory = subcategory
        self.tags = tags
    }
}
