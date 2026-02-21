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

public nonisolated enum SPSelection: Identifiable, Sendable {
    case symbol(value: SPSymbol, color: CKColor? = nil)
    case emoji(value: SPEmoji, color: CKColor? = nil)
    case image(value: SPImage, color: CKColor? = nil)
    case color(value: CKColor)
    
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
    
    public init(value: SPSymbol, color: CKColor? = nil){
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
            let symbol = try container.decode(SPSymbol.self, forKey: .symbol)
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

    public mutating func setSymbol(_ symbol: SPSymbol) {
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
    
    public func getSymbol() -> SPSymbol? {
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

// MARK: - View
public struct SPSelectionView: View {
    private var selection: SPSelection
    
    public var body: some View {
        Group {
            switch selection {
            case .symbol(let symbol, _):
                SPSymbolView(symbol: symbol)
            case .emoji(let emoji, _):
                SPEmojiView(emoji: emoji)
            case .image(let image, _):
                SPImageView(image: image)
            case .color(let color):
                Circle().fill(color)
            }
        }
        .id(selection.id)
    }
    
    public init(selection: SPSelection) {
        self.selection = selection
    }
}

@available(iOS 16.0, macOS 13.0, *)
public extension Binding where Value == SPSelection {
    var asCKColor: Binding<CKColor?> {
        Binding<CKColor?>(
            get: {
                self.wrappedValue.getColor()
            },
            set: { newItem in
                if let newItem{
                    self.wrappedValue.setColor(newItem)
                }
            }
        )
    }
    
    #if !os(tvOS) && !os(watchOS)
    var asImage: Binding<PhotosPickerItem?> {
        Binding<PhotosPickerItem?>(
            get: { nil },
            set: { newItem in
                guard let newItem else { return }
                
                Task(priority: .userInitiated) {
                    guard let data = try? await newItem.loadTransferable(type: Data.self) else { return }
                    
                    let timestamp = Int(Date().timeIntervalSince1970)
                    let generatedName = "IMG_\(timestamp)"
                    
                    var width: Double = 0
                    var height: Double = 0
                    var detectedColor: CKColor? = nil
                    
                    #if os(iOS) || os(visionOS)
                    if let image = UIImage(data: data) {
                        width = Double(image.size.width)
                        height = Double(image.size.height)
                        detectedColor = CKColor(nativeColor: image.averageColor() ?? .black)
                    }
                    #elseif os(macOS)
                    if let image = NSImage(data: data) {
                        width = Double(image.size.width)
                        height = Double(image.size.height)
                        detectedColor = CKColor(nativeColor: image.averageColor() ?? .black)
                    }
                    #endif
                    
                    let newImage = SPImage(
                        fileName: generatedName,
                        rawData: data,
                        width: width,
                        height: height
                    )
                    
                    await MainActor.run {
                        self.wrappedValue.setImage(newImage)
                        if let detectedColor {
                            self.wrappedValue.setColor(detectedColor)
                        }
                    }
                }
            }
        )
    }
    #endif
}

#if canImport(CoreImage)
#if os(iOS) || os(visionOS)
extension UIImage {
    func averageColor() -> UIColor? {
        guard let inputImage = CIImage(image: self) else { return nil }
        let extentVector = CIVector(x: inputImage.extent.origin.x, y: inputImage.extent.origin.y, z: inputImage.extent.size.width, w: inputImage.extent.size.height)

        guard let filter = CIFilter(name: "CIAreaAverage", parameters: [kCIInputImageKey: inputImage, kCIInputExtentKey: extentVector]) else { return nil }
        guard let outputImage = filter.outputImage else { return nil }

        var bitmap = [UInt8](repeating: 0, count: 4)
        let context = CIContext(options: [.workingColorSpace: kCFNull as Any])
        context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: .RGBA8, colorSpace: nil)

        return UIColor(red: CGFloat(bitmap[0]) / 255.0, green: CGFloat(bitmap[1]) / 255.0, blue: CGFloat(bitmap[2]) / 255.0, alpha: CGFloat(bitmap[3]) / 255.0)
    }
}
#elseif os(macOS)
extension NSImage {
    func averageColor() -> NSColor? {
        guard let tiffData = self.tiffRepresentation, let bitmapImage = NSBitmapImageRep(data: tiffData) else { return nil }
        let ciImage = CIImage(bitmapImageRep: bitmapImage)
        guard let inputImage = ciImage else { return nil }
        let extentVector = CIVector(x: inputImage.extent.origin.x, y: inputImage.extent.origin.y, z: inputImage.extent.size.width, w: inputImage.extent.size.height)

        guard let filter = CIFilter(name: "CIAreaAverage", parameters: [kCIInputImageKey: inputImage, kCIInputExtentKey: extentVector]) else { return nil }
        guard let outputImage = filter.outputImage else { return nil }

        var bitmap = [UInt8](repeating: 0, count: 4)
        let context = CIContext(options: [.workingColorSpace: kCFNull as Any])
        context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: .RGBA8, colorSpace: nil)

        return NSColor(red: CGFloat(bitmap[0]) / 255.0, green: CGFloat(bitmap[1]) / 255.0, blue: CGFloat(bitmap[2]) / 255.0, alpha: CGFloat(bitmap[3]) / 255.0)
    }
}
#endif
#endif
