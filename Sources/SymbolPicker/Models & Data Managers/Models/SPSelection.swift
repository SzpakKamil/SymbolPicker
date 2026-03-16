//
//  SPSelection.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI
import PhotosUI
import ColorKit
#if canImport(CoreImage)
import CoreImage
#endif

#if os(iOS) || os(visionOS) || os(tvOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif

public protocol SPSelectionProtocol: Sendable {
    func getColor() -> CKColor?
    mutating func setColor(_ color: CKColor)
    func getImage() -> SPImage?
    mutating func setImage(_ image: SPImage)
    func isContentAvailable() -> Bool
    @MainActor
    func asView() -> AnyView
}

public struct SPSelection<T: SPDataAsset>: Identifiable, Sendable, SPSelectionProtocol {
    public var type: SelectionType
    public private(set) var symbol: T?
    public private(set) var emoji: SPEmoji?
    public private(set) var image: SPImage?
    public private(set) var color: CKColor?
    
    public func isContentAvailable() -> Bool {
        return type != .color
    }
    
    @MainActor
    public func asView() -> AnyView {
        switch type {
        case .symbol:
            if let symbol = symbol {
                return AnyView(symbol.asView())
            }
        case .emoji:
            if let emoji = emoji {
                return AnyView(SPEmojiView(emoji: emoji))
            }
        case .image:
            if let image = image {
                return AnyView(SPImageView(image: image))
            }
        case .color:
            if let color = color {
                return AnyView(Circle().fill(color))
            }
        }
        return AnyView(EmptyView())
    }
    
    public var id: String {
        switch type {
        case .symbol:
            return "symbol:\(String(symbol?.id.hashValue ?? 0) ?? "unknown")"
        case .emoji:
            if let emoji = emoji {
                return "emoji:\(emoji.id):tone\(emoji.tone)"
            }
            return "emoji:unknown"
        case .image:
            return "image:\(image?.id.uuidString ?? "unknown")"
        case .color:
            return "color:\(String(color?.id.hashValue ?? 0) ?? "unknown")"
        }
    }
    
    public init(symbol: T, color: CKColor? = nil){
        self.type = .symbol
        self.symbol = symbol
        self.color = color
    }
    
    public init(systemName: String, color: CKColor? = nil) where T == SPSymbol{
        self.type = .symbol
        self.symbol = SPSymbol(filledName: systemName, notFilled: systemName, version: 1.0)
        self.color = color
    }
    
    public init(emoji: SPEmoji, color: CKColor? = nil){
        self.type = .emoji
        self.emoji = emoji
        self.color = color
    }
    
    public init(image: SPImage, color: CKColor? = nil){
        self.type = .image
        self.image = image
        self.color = color
    }
    
    public init(value: CKColor){
        self.type = .color
        self.color = value
    }
    
    public init(systemName: String, color: Color?) where T == SPSymbol  {
        if let color {
            self.init(systemName: systemName, color: CKColor(color))
        } else {
            self.init(systemName: systemName)
        }
    }
    
    public init(systemName: String, colorValues: [Double]?) where T == SPSymbol {
        if let colorValues, !colorValues.isEmpty {
            if colorValues.count == 4 {
                self.init(systemName: systemName, color: CKColor(red: colorValues[0], green: colorValues[1], blue: colorValues[2], opacity: colorValues[3]))
            } else if colorValues.count == 3 {
                self.init(systemName: systemName, color: CKColor(red: colorValues[0], green: colorValues[1], blue: colorValues[2]))
            } else {
                self.init(systemName: systemName)
            }
        } else {
            self.init(systemName: systemName)
        }
    }
    
    public init(emoji: SPEmoji, color: Color?) where T == SPSymbol {
        if let color {
            self.init(emoji: emoji, color: CKColor(color))
        } else {
            self.init(emoji: emoji)
        }
    }
    
    public init(emoji: SPEmoji, colorValues: [Double]?) where T == SPSymbol {
        if let colorValues, !colorValues.isEmpty {
            if colorValues.count == 4 {
                self.init(emoji: emoji, color: CKColor(red: colorValues[0], green: colorValues[1], blue: colorValues[2], opacity: colorValues[3]))
            } else if colorValues.count == 3 {
                self.init(emoji: emoji, color: CKColor(red: colorValues[0], green: colorValues[1], blue: colorValues[2]))
            } else {
                self.init(emoji: emoji)
            }
        } else {
            self.init(emoji: emoji)
        }
    }
    
    public init(image: SPImage, color: Color?) where T == SPSymbol {
        if let color {
            self.init(image: image, color: CKColor(color))
        } else {
            self.init(image: image)
        }
    }
    
    public init(image: SPImage, colorValues: [Double]?)  where T == SPSymbol {
        if let colorValues, !colorValues.isEmpty {
            if colorValues.count == 4 {
                self.init(image: image, color: CKColor(red: colorValues[0], green: colorValues[1], blue: colorValues[2], opacity: colorValues[3]))
            } else if colorValues.count == 3 {
                self.init(image: image, color: CKColor(red: colorValues[0], green: colorValues[1], blue: colorValues[2]))
            } else {
                self.init(image: image)
            }
        } else {
            self.init(image: image)
        }
    }
}

// MARK: - SelectionType
extension SPSelection {
    public enum SelectionType: String, Codable, Sendable {
        case symbol
        case emoji
        case image
        case color
    }
}

// MARK: - Codable
extension SPSelection: Codable {
    enum CodingKeys: CodingKey {
        case type
        case symbol
        case emoji
        case image
        case color
        case tint
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(SelectionType.self, forKey: .type)
        self.type = type
        
        switch type {
        case .symbol:
            self.symbol = try container.decode(T.self, forKey: .symbol)
            self.color = try container.decodeIfPresent(CKColor.self, forKey: .tint)
        case .emoji:
            self.emoji = try container.decode(SPEmoji.self, forKey: .emoji)
            self.color = try container.decodeIfPresent(CKColor.self, forKey: .tint)
        case .image:
            self.image = try container.decode(SPImage.self, forKey: .image)
            self.color = try container.decodeIfPresent(CKColor.self, forKey: .tint)
        case .color:
            self.color = try container.decode(CKColor.self, forKey: .color)
        }
    }
    
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        
        switch type {
        case .symbol:
            try container.encode(symbol, forKey: .symbol)
            try container.encodeIfPresent(color, forKey: .tint)
        case .emoji:
            try container.encode(emoji, forKey: .emoji)
            try container.encodeIfPresent(color, forKey: .tint)
        case .image:
            try container.encode(image, forKey: .image) 
            try container.encodeIfPresent(color, forKey: .tint)
        case .color:
            try container.encode(color, forKey: .color)
        }
    }
}

// MARK: - Equatable
extension SPSelection: Equatable {}

// MARK: - Hashable
extension SPSelection: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

// MARK: - Mutating Methods
extension SPSelection {
    public mutating func setColor(_ color: CKColor) {
        self.color = color
    }

    public mutating func setSymbol(_ symbol: T) {
        self.type = .symbol
        self.symbol = symbol
        self.emoji = nil
        self.image = nil
    }

    public mutating func setEmoji(_ emoji: SPEmoji) {
        self.type = .emoji
        self.emoji = emoji
        self.symbol = nil
        self.image = nil
    }
    
    public mutating func setImage(_ image: SPImage) {
        self.type = .image
        self.image = image
        self.symbol = nil
        self.emoji = nil
    }
    
    public func getSymbol() -> T? {
        return symbol
    }
    
    public func getColor() -> CKColor? {
        return color
    }
    
    public func getEmoji() -> SPEmoji? {
        return emoji
    }
    
    public func getImage() -> SPImage? {
        return image
    }
}
