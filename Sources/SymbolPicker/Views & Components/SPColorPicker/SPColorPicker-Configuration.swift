//
//  SPColorPicker-Configuration.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import Foundation
import ColorKit



public struct SPColorPickerConfiguration: Sendable{
    public enum Direction: Int, Sendable{
        case grid, row
    }
    var colors: [CKColor] = [
        .red, .orange, .yellow, .green,
        .mint, .teal, .blue, .indigo,
        .purple, .pink, .brown
    ]
    var type: Self.Direction
    var supportCustomColor: Bool = true
    var supportOpacity: Bool = false
    var spacing: CGFloat? = nil
    
    public init(){
        self.type = .row
    }
    init(style: SPDisplayStyle) {
        self.type = .row
        #if os(iOS) || os(visionOS)
        if style == .compact{
            self.type = .row
        }else{
            self.type = .grid
        }
        #elseif os(watchOS)
        self.type = .grid
        #elseif os(tvOS)
        if #available(tvOS 26.0, *){
            if style == .compact{
                self.type = .row
            }else{
                self.type = .grid
            }
        }else{
            self.type = .grid
        }
        #endif
    }
    
    
    public func spColorPickerEnabled(_ value: Bool) -> Self?{
        return value ? self : nil
    }
    
    public func spColorPickerColors(_ colors: CKColor...) -> Self{
        var results = self
        results.colors = colors
        return results
    }
    public func spColorPickerColors(_ colors: [CKColor]) -> Self{
        var results = self
        results.colors = colors
        return results
    }
    public func spColorPickerLayout(_ type: Self.Direction, spacing: CGFloat? = nil) -> Self{
        var results = self
        results.type = type
        results.spacing = spacing
        return results
    }
    public func spColorPickerSupportsOpacity(_ value: Bool) -> Self{
        var results = self
        results.supportOpacity = supportOpacity
        return results
    }
    public func spColorPickerSupportsCustomColor(_ value: Bool) -> Self{
        var results = self
        results.supportCustomColor = value;
        return results
    }
}
