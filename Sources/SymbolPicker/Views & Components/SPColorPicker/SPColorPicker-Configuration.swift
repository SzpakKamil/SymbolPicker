//
//  SPColorPickerConfiguration.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 22/02/2026.
//

import Foundation
import ColorKit

extension SPColorPicker{
    public enum Direction: Int{
        case grid, row
    }
    
    struct Configuration{
        var colors: [CKColor] = [
            .red, .orange, .yellow, .green,
            .mint, .teal, .blue, .indigo,
            .purple, .pink, .brown
        ]
        var type: SPColorPicker.Direction
        var allowCustomColor: Bool = true
        var supportOpacity: Bool = false
        var spacing: CGFloat? = nil
        
        init(){
            #if os(tvOS) || os(macOS)
            self.type = .row
            #else
            self.type = .grid
            #endif
        }
    }
}
