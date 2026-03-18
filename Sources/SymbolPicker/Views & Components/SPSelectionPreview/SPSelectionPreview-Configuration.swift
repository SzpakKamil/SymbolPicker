//
//  SPSelectionPreview-Configuration.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 14/03/2026.
//

import SwiftUI

public struct SPSelectionPreviewConfiguration: Sendable {
    public var selectionPreviewCornerRadiusFactor: CGFloat
    
    #if (os(iOS) || os(visionOS) || os(macOS) || os(tvOS) || os(watchOS)) && compiler(>=6.0)
    private var _calculateOffset: (@Sendable (Any) -> CGFloat)?
    private var _calculateScale: (@Sendable (Any) -> CGFloat)?
    
    @available(iOS 26.0, macOS 26.0, tvOS 26.0, visionOS 26.0, watchOS 26.0, *)
    public var calculateOffset: @Sendable (ScrollGeometry) -> CGFloat {
        get {
            if let closure = _calculateOffset {
                return { geometry in closure(geometry) }
            }
            return { geometry in
                let minY = geometry.bounds.minY
                let topInset = geometry.contentInsets.top
                let start = -topInset
                let end = start + 61
                let progress = min(max((start - minY) / (start - end), 0), 1)
                return 10 - (30 * progress)
            }
        }
        set {
            _calculateOffset = { geometry in
                guard let geo = geometry as? ScrollGeometry else { return 0 }
                return newValue(geo)
            }
        }
    }
    
    @available(iOS 26.0, macOS 26.0, tvOS 26.0, visionOS 26.0, watchOS 26.0, *)
    public var calculateScale: @Sendable (ScrollGeometry) -> CGFloat {
        get {
            if let closure = _calculateScale {
                return { geometry in closure(geometry) }
            }
            return { geometry in
                let minY = geometry.bounds.minY
                let topInset = geometry.contentInsets.top
                let start = -topInset
                let end = start + 61
                let progress = min(max((start - minY) / (start - end), 0), 1)
                return 1.0 - 0.5 * progress
            }
        }
        set {
            _calculateScale = { geometry in
                guard let geo = geometry as? ScrollGeometry else { return 1.0 }
                return newValue(geo)
            }
        }
    }
    #endif

    public init() {
        #if os(watchOS)
        self.selectionPreviewCornerRadiusFactor = 1
        #else
        if #available(iOS 26.0, macOS 26.0, tvOS 26.0, *){
            self.selectionPreviewCornerRadiusFactor = 0.5
        }else{
            self.selectionPreviewCornerRadiusFactor = 0.3
        }
        #endif
        
        #if (os(iOS) || os(visionOS) || os(macOS) || os(tvOS) || os(watchOS)) && compiler(>=6.0)
        self._calculateOffset = nil
        self._calculateScale = nil
        #endif
    }
    
    public func spSelectionPreviewCornerRadiusFactor(_ value: CGFloat) -> Self {
        var result = self
        result.selectionPreviewCornerRadiusFactor = value
        return result
    }

    #if (os(iOS) || os(visionOS) || os(macOS) || os(tvOS) || os(watchOS)) && compiler(>=6.0)
    @available(iOS 26.0, macOS 26.0, tvOS 26.0, visionOS 26.0, watchOS 26.0, *)
    public func spSelectionPreviewCalculateOffset(_ closure: @Sendable @escaping (ScrollGeometry) -> CGFloat) -> Self {
        var result = self
        result.calculateOffset = closure
        return result
    }

    @available(iOS 26.0, macOS 26.0, tvOS 26.0, visionOS 26.0, watchOS 26.0, *)
    public func spSelectionPreviewCalculateScale(_ closure: @Sendable @escaping (ScrollGeometry) -> CGFloat) -> Self {
        var result = self
        result.calculateScale = closure
        return result
    }
    #endif
}
