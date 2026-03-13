//
//  SPImage.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI
import PhotosUI

// MARK: - Core Model
public struct SPImage: Identifiable, Hashable, Sendable, Codable {
    public let id: UUID
    public let fileName: String
    public let createdAt: Date
    
    public var zoom: Double
    public var offsetX: Double
    public var offsetY: Double
    
    public var width: Double
    public var height: Double
    
    private static var baseDirectory: URL {
        let directory = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first!
        let folder = directory.appendingPathComponent("SymbolPicker/Images", isDirectory: true)
        
        if !FileManager.default.fileExists(atPath: folder.path) {
            try? FileManager.default.createDirectory(at: folder, withIntermediateDirectories: true)
        }
        return folder
    }
    
    private var fileURL: URL {
        return Self.baseDirectory.appendingPathComponent("\(id.uuidString).data")
    }

    public var localURL: URL { fileURL }

    // MARK: - Initializer (Local Creation)
    public init(fileName: String, rawData: Data, zoom: Double = 1.0, offsetX: Double = 0.0, offsetY: Double = 0.0, width: Double = 0, height: Double = 0) {
        self.id = UUID()
        self.fileName = fileName
        self.createdAt = Date()
        self.zoom = zoom
        self.offsetX = offsetX
        self.offsetY = offsetY
        self.width = width
        self.height = height
        
        // Immediate persistence on creation
        try? rawData.write(to: fileURL, options: .atomic)
    }
    
    // MARK: - Universal Transport Codable
    enum CodingKeys: String, CodingKey {
        case id, fileName, createdAt, rawData, zoom, offsetX, offsetY, width, height
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(fileName, forKey: .fileName)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(zoom, forKey: .zoom)
        try container.encode(offsetX, forKey: .offsetX)
        try container.encode(offsetY, forKey: .offsetY)
        try container.encode(width, forKey: .width)
        try container.encode(height, forKey: .height)
        
        // PULL from disk to include in the JSON/Database payload
        if let data = try? Data(contentsOf: fileURL) {
            try container.encode(data, forKey: .rawData)
        }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.fileName = try container.decode(String.self, forKey: .fileName)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.zoom = try container.decodeIfPresent(Double.self, forKey: .zoom) ?? 1.0
        self.offsetX = try container.decodeIfPresent(Double.self, forKey: .offsetX) ?? 0.0
        self.offsetY = try container.decodeIfPresent(Double.self, forKey: .offsetY) ?? 0.0
        self.width = try container.decodeIfPresent(Double.self, forKey: .width) ?? 0.0
        self.height = try container.decodeIfPresent(Double.self, forKey: .height) ?? 0.0
        
        // RECEIVE from payload and SAVE to the local device disk
        if let data = try container.decodeIfPresent(Data.self, forKey: .rawData) {
            let destination = Self.baseDirectory.appendingPathComponent("\(id.uuidString).data")
            try? data.write(to: destination, options: .atomic)
        }
    }
}

