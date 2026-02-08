//
//  SPImage-Base.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 03/03/2025.
//

import SwiftUI

public nonisolated struct SPImage: Identifiable, Codable, Sendable {
    public var id: String { "\(fileName).\(fileExtension)" }
    public let fileName: String
    public let fileExtension: String
    public let rawData: Data
    
    init(fileName: String, fileExtension: String, rawData: Data) {
        self.fileName = fileName
        self.fileExtension = fileExtension
        self.rawData = rawData
    }
}

// MARK: - Hashable

extension SPImage: Hashable {
    @_documentation(visibility: internal)
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

// MARK: - Equatable

extension SPImage: Equatable {
    @_documentation(visibility: internal)
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}

// MARK: - View

struct SPImageView: View {
    let image: SPImage
    @_documentation(visibility: internal)
    public var body: some View{
        #if canImport(UIKit)
        if let uiImage = UIImage(data: image.rawData) {
            Image(uiImage: uiImage)
        }else{
            Image(systemName: "questionmark")
        }
        #elseif canImport(AppKit)
        if let nsImage = NSImage(data: image.rawData) {
            Image(nsImage: nsImage)
        }else{
            Image(systemName: "questionmark")
        }
        #endif
    }
}
