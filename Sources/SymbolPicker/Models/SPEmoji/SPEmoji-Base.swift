//
//  SPEmoji-Base.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 03/03/2025.
//

import SwiftUI

public nonisolated struct SPEmoji: Identifiable, Sendable, SPDataAsset  {
    public let id: String
    public let annotation: String?
    public let version: Double
    public let category: String?
    public let subcategory: String?
    public let tags: [String]?
    public let skins: [Skin]?
    public var tone: Int = 0
    
    init(id: String, version: Double, category: String? = nil, annotation: String? = nil, subcategory: String? = nil, tags: [String]? = nil, skins: [Skin]? = nil, tone: Int = 0) {
        self.id = id
        self.version = version
        self.category = category
        self.subcategory = subcategory
        self.annotation = annotation
        self.tags = tags
        self.skins = skins
        self.tone = tone
    }
}
