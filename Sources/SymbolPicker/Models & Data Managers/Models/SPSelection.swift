//
//  SPSelection.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 06/02/2026.
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
    func asView() -> AnyView
}

public nonisolated enum SPSelection<T: SPDataAsset>: Identifiable, Sendable, SPSelectionProtocol {
    case symbol(value: T, color: CKColor? = nil)
    case emoji(value: SPEmoji, color: CKColor? = nil)
    case image(value: SPImage, color: CKColor? = nil)
    case color(value: CKColor)
    
    public func asView() -> AnyView {
        switch self {
        case .symbol(let symbol, _):
            return AnyView(symbol.asView())
        case .emoji(let emoji, _):
            return AnyView(SPEmojiView(emoji: emoji))
        case .image(let image, _):
            return AnyView(SPImageView(image: image))
        case .color(let color):
            return AnyView(Circle().fill(color))
        }
    }
    
    public var id: String {
        switch self {
        case .symbol(let symbol, _):
            return "symbol:\(symbol.id)"
        case .emoji(let emoji, _):
            return "emoji:\(emoji.id):tone\(emoji.tone)"
        case .image(let image, _):
            return "image:\(image.id)"
        case .color(let color):
            return "color:\(color.id)"
        }
    }
    
    public init(value: T, color: CKColor? = nil){
        self = .symbol(value: value, color: color)
    }
    public init(value: SPEmoji, color: CKColor? = nil){
        self = .emoji(value: value, color: color)
    }
    public init(value: SPImage, color: CKColor? = nil){
        self = .image(value: value, color: color)
    }
    public init(value: CKColor){
        self = .color(value: value)
    }
}

// MARK: - SelectionType
extension SPSelection {
    public enum SelectionType: String, Codable {
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
        
        switch type {
        case .symbol:
            let symbol = try container.decode(T.self, forKey: .symbol)
            let tint = try container.decodeIfPresent(CKColor.self, forKey: .tint)
            self = .symbol(value: symbol, color: tint)
        case .emoji:
            let emoji = try container.decode(SPEmoji.self, forKey: .emoji)
            let tint = try container.decodeIfPresent(CKColor.self, forKey: .tint)
            self = .emoji(value: emoji, color: tint)
        case .image:
            let image = try container.decode(SPImage.self, forKey: .image)
            let tint = try container.decodeIfPresent(CKColor.self, forKey: .tint)
            self = .image(value: image, color: tint)
        case .color:
            let color = try container.decode(CKColor.self, forKey: .color)
            self = .color(value: color)
        }
    }
    
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        switch self {
        case .symbol(let symbol, let tint):
            try container.encode(SelectionType.symbol, forKey: .type)
            try container.encode(symbol, forKey: .symbol)
            try container.encodeIfPresent(tint, forKey: .tint)
        case .emoji(let emoji, let tint):
            try container.encode(SelectionType.emoji, forKey: .type)
            try container.encode(emoji, forKey: .emoji)
            try container.encodeIfPresent(tint, forKey: .tint)
        case .image(let image, let tint):
            try container.encode(SelectionType.image, forKey: .type)
            try container.encode(image, forKey: .image) 
            try container.encodeIfPresent(tint, forKey: .tint)
        case .color(let color):
            try container.encode(SelectionType.color, forKey: .type)
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
        switch self {
        case .symbol(let symbol, _):
            self = .symbol(value: symbol, color: color)
        case .emoji(let emoji, _):
            self = .emoji(value: emoji, color: color)
        case .image(let image, _):
            self = .image(value: image, color: color)
        case .color:
            self = .color(value: color)
        }
    }

    public mutating func setSymbol(_ symbol: T) {
        switch self {
        case .symbol(_, let color):
            self = .symbol(value: symbol, color: color)
        case .emoji(_, let color):
            self = .symbol(value: symbol, color: color)
        case .image(_, let color):
            self = .symbol(value: symbol, color: color)
        case .color(let color):
            self = .symbol(value: symbol, color: color)
        }
    }

    public mutating func setEmoji(_ emoji: SPEmoji) {
        switch self {
        case .symbol(_, color: let color):
            self = .emoji(value: emoji, color: color)
        case .emoji(_, let color):
            self = .emoji(value: emoji, color: color)
        case .image(_, let color):
            self = .emoji(value: emoji, color: color)
        case .color(let color):
            self = .emoji(value: emoji, color: color)
        }
    }
    
    public mutating func setImage(_ image: SPImage) {
        switch self {
        case .symbol(_, color: let color):
            self = .image(value: image, color: color)
        case .emoji(_, let color):
            self = .image(value: image, color: color)
        case .image(_, let color):
            self = .image(value: image, color: color)
        case .color(let color):
            self = .image(value: image, color: color)
        }
    }
    
    public func getSymbol() -> T? {
        if case .symbol(let symbol, _) = self {
            return symbol
        }
        return nil
    }
    
    public func getColor() -> CKColor? {
        switch self {
        case .symbol(_, let color):
            return color
        case .emoji(_, let color):
            return color
        case .image(_, let color):
            return color
        case .color(let color):
            return color
        }
    }
    
    public func getEmoji() -> SPEmoji? {
        if case .emoji(let emoji, _) = self {
            return emoji
        }
        return nil
    }
    
    public func getImage() -> SPImage? {
        if case .image(let image, _) = self {
            return image
        }
        return nil
    }
}
