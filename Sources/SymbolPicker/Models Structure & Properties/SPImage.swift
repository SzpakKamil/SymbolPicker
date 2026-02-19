//
//  SPImage-Base.swift
//  SymbolPicker
//
//  Refactored for Performance & Network Safety
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

// MARK: - View Component
struct SPImageView: View {
    let image: SPImage
    
    var body: some View {
        GeometryReader { geometry in
            AsyncImage(url: image.localURL) { phase in
                switch phase {
                case .empty:
                    Color.gray.opacity(0.1)
                        .overlay(ProgressView().controlSize(.small))
                case .success(let img):
                    let containerSize = geometry.size
                    let imageRatio = image.width > 0 && image.height > 0 ? image.width / image.height : 1.0
                    
                    let renderW = max(containerSize.width, containerSize.height * imageRatio)
                    let renderH = max(containerSize.height, containerSize.width / imageRatio)
                    
                    let scaledW = renderW * image.zoom
                    let scaledH = renderH * image.zoom
                    
                    let limitX = max(0, (scaledW - containerSize.width) / 2)
                    let limitY = max(0, (scaledH - containerSize.height) / 2)
                    
                    img
                        .resizable()
                        .scaledToFill()
                        .scaleEffect(image.zoom)
                        .offset(x: image.offsetX * limitX, y: image.offsetY * limitY)
                        .frame(width: containerSize.width, height: containerSize.height)
                        .clipped()
                case .failure:
                    Image(systemName: "photo.badge.exclamationmark")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.secondary)
                @unknown default:
                    EmptyView()
                }
            }
        }
        .id(image.id)
    }
}

// MARK: - PhotosPicker Bridge
#if !os(tvOS) && !os(watchOS)
@available(iOS 16.0, macOS 13.0, *)
public extension Binding where Value == SPImage {
    var asPhotosPickerItem: Binding<PhotosPickerItem?> {
        Binding<PhotosPickerItem?>(
            get: { nil },
            set: { newItem in
                guard let newItem else { return }
                
                Task(priority: .userInitiated) {
                    guard let data = try? await newItem.loadTransferable(type: Data.self) else { return }
                    
                    let timestamp = Int(Date().timeIntervalSince1970)
                    let generatedName = "IMG_\(timestamp)"
                    
                    let newImage = SPImage(
                        fileName: generatedName,
                        rawData: data
                    )
                    
                    await MainActor.run {
                        self.wrappedValue = newImage
                    }
                }
            }
        )
    }
}
#endif
