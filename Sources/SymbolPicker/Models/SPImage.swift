//
//  SPImage.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 03/03/2025.
//

import SwiftUI

public nonisolated struct SPImage: Identifiable, Equatable, Hashable, Codable, View, Sendable {
    public let id: String
    public let fileName: String
    public let fileExtension: String
    public let rawData: Data
    
    init(fileName: String, fileExtension: String, rawData: Data) {
        self.fileName = fileName
        self.fileExtension = fileExtension
        self.rawData = rawData
        self.id = "\(fileName).\(fileExtension)"
    }
    
    enum CodingKeys: CodingKey {
        case fileName
        case fileExtension
        case rawData
    }
    
    public var body: some View{
        SPImageView(image: self)
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let fileName = try container.decode(String.self, forKey: .fileName)
        let fileExtension = try container.decode(String.self, forKey: .fileExtension)
        let rawData = try container.decode(Data.self, forKey: .rawData)
        
        self.init(fileName: fileName, fileExtension: fileExtension, rawData: rawData)
    }
    
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(fileName, forKey: .fileName)
        try container.encode(fileExtension, forKey: .fileExtension)
        try container.encode(rawData, forKey: .rawData)
    }
}
struct SPImageView: View {
    let image: SPImage
    var body: some View{
        #if canImport(UIKit)
        if let uiImage = UIImage(data: image.rawData) {
            return Image(uiImage: uiImage)
        }
        return Image(systemName: "questionmark")
        #elseif canImport(AppKit)
        if let nsImage = NSImage(data: image.rawData) {
            return Image(nsImage: nsImage)
        }
        return Image(systemName: "questionmark")
        #endif
    }
}


