//
//  SPImageTests.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 28/03/2026.
//

import Foundation
import ImageIO
#if canImport(Testing)
import Testing
@testable import SymbolPicker

struct SPImageTests {

    // MARK: - isAvailable

    @Test("SPImage isAvailable returns true for valid image written to disk")
    func testIsAvailableValidImage() {
        guard let image = SPImage(systemName: "star.fill") else { return }
        defer { try? FileManager.default.removeItem(at: image.localURL) }
        #expect(image.isAvailable())
    }

    @Test("SPImage isAvailable returns false after file is deleted")
    func testIsAvailableFileDeleted() throws {
        guard let image = SPImage(systemName: "star.fill") else { return }
        try FileManager.default.removeItem(at: image.localURL)
        #expect(!image.isAvailable())
    }

    @Test("SPImage isAvailable returns false for non-image data")
    func testIsAvailableInvalidData() {
        let image = SPImage(fileName: "invalid", rawData: Data("not an image".utf8))
        defer { try? FileManager.default.removeItem(at: image.localURL) }
        #expect(!image.isAvailable())
    }

    @Test("SPImage isAvailable returns false for empty data")
    func testIsAvailableEmptyData() {
        let image = SPImage(fileName: "empty", rawData: Data())
        defer { try? FileManager.default.removeItem(at: image.localURL) }
        #expect(!image.isAvailable())
    }

    // MARK: - init(from decoder:) — offsetY, width, height

    @Test("SPImage init(from decoder:) round-trip preserves offsetY")
    func testCodableOffsetY() throws {
        let original = SPImage(fileName: "test", rawData: Data(), offsetY: -7.5)
        defer { try? FileManager.default.removeItem(at: original.localURL) }
        let encoded = try JSONEncoder().encode(original)
        let decoded = try JSONDecoder().decode(SPImage.self, from: encoded)
        #expect(decoded.offsetY == -7.5)
    }

    @Test("SPImage init(from decoder:) round-trip preserves width")
    func testCodableWidth() throws {
        let original = SPImage(fileName: "test", rawData: Data(), width: 320, height: 1)
        defer { try? FileManager.default.removeItem(at: original.localURL) }
        let encoded = try JSONEncoder().encode(original)
        let decoded = try JSONDecoder().decode(SPImage.self, from: encoded)
        #expect(decoded.width == 320)
    }

    @Test("SPImage init(from decoder:) round-trip preserves height")
    func testCodableHeight() throws {
        let original = SPImage(fileName: "test", rawData: Data(), width: 1, height: 240)
        defer { try? FileManager.default.removeItem(at: original.localURL) }
        let encoded = try JSONEncoder().encode(original)
        let decoded = try JSONDecoder().decode(SPImage.self, from: encoded)
        #expect(decoded.height == 240)
    }

    @Test("SPImage init(from decoder:) round-trip preserves all transform fields")
    func testCodableAllTransformFields() throws {
        let original = SPImage(
            fileName: "photo.jpg",
            rawData: Data(),
            zoom: 2.5,
            offsetX: 10.0,
            offsetY: -5.0,
            width: 1920.0,
            height: 1080.0
        )
        defer { try? FileManager.default.removeItem(at: original.localURL) }
        let encoded = try JSONEncoder().encode(original)
        let decoded = try JSONDecoder().decode(SPImage.self, from: encoded)
        #expect(decoded.id == original.id)
        #expect(decoded.fileName == "photo.jpg")
        #expect(decoded.zoom == 2.5)
        #expect(decoded.offsetX == 10.0)
        #expect(decoded.offsetY == -5.0)
        #expect(decoded.width == 1920.0)
        #expect(decoded.height == 1080.0)
    }

    @Test("SPImage init(from decoder:) defaults zoom to 1.0 when absent")
    func testCodableZoomDefault() throws {
        let json = "{\"id\":\"00000000-0000-0000-0000-000000000001\",\"fileName\":\"t\",\"createdAt\":0}"
        let decoded = try JSONDecoder().decode(SPImage.self, from: Data(json.utf8))
        defer { try? FileManager.default.removeItem(at: decoded.localURL) }
        #expect(decoded.zoom == 1.0)
    }

    @Test("SPImage init(from decoder:) defaults offsetX to 0.0 when absent")
    func testCodableOffsetXDefault() throws {
        let json = "{\"id\":\"00000000-0000-0000-0000-000000000002\",\"fileName\":\"t\",\"createdAt\":0}"
        let decoded = try JSONDecoder().decode(SPImage.self, from: Data(json.utf8))
        defer { try? FileManager.default.removeItem(at: decoded.localURL) }
        #expect(decoded.offsetX == 0.0)
    }

    @Test("SPImage init(from decoder:) defaults offsetY to 0.0 when absent")
    func testCodableOffsetYDefault() throws {
        let json = "{\"id\":\"00000000-0000-0000-0000-000000000003\",\"fileName\":\"t\",\"createdAt\":0}"
        let decoded = try JSONDecoder().decode(SPImage.self, from: Data(json.utf8))
        defer { try? FileManager.default.removeItem(at: decoded.localURL) }
        #expect(decoded.offsetY == 0.0)
    }

    @Test("SPImage init(from decoder:) defaults width to 0.0 when absent")
    func testCodableWidthDefault() throws {
        let json = "{\"id\":\"00000000-0000-0000-0000-000000000004\",\"fileName\":\"t\",\"createdAt\":0}"
        let decoded = try JSONDecoder().decode(SPImage.self, from: Data(json.utf8))
        defer { try? FileManager.default.removeItem(at: decoded.localURL) }
        #expect(decoded.width == 0.0)
    }

    @Test("SPImage init(from decoder:) defaults height to 0.0 when absent")
    func testCodableHeightDefault() throws {
        let json = "{\"id\":\"00000000-0000-0000-0000-000000000005\",\"fileName\":\"t\",\"createdAt\":0}"
        let decoded = try JSONDecoder().decode(SPImage.self, from: Data(json.utf8))
        defer { try? FileManager.default.removeItem(at: decoded.localURL) }
        #expect(decoded.height == 0.0)
    }

    @Test("SPImage init(from decoder:) rawData is encoded and re-persisted on decode")
    func testCodableRawDataPersisted() throws {
        guard let original = SPImage(systemName: "star.fill") else { return }
        defer { try? FileManager.default.removeItem(at: original.localURL) }
        #expect(original.isAvailable())
        let encoded = try JSONEncoder().encode(original)
        // Delete file to confirm decode re-writes it
        try FileManager.default.removeItem(at: original.localURL)
        #expect(!original.isAvailable())
        let decoded = try JSONDecoder().decode(SPImage.self, from: encoded)
        // Same UUID → same localURL; file re-written by decoder
        #expect(decoded.isAvailable())
    }
}
#endif
