//
//  SPSymbolView.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 22/02/2026.
//

import SwiftUI

struct SPSymbolView: View {
    @Environment(\.spSymbolVariant) var symbolVariant
    private let filledName: String
    private let notFilledName: String
    private let isAvailable: Bool
    private let variant: SPSymbol.Variant?
    
    public var body: some View {
        if isAvailable{
            switch variant {
            case .none:
                viewForVariant(symbolVariant)
            default:
                viewForVariant(variant!)
            }
        }else{
            Image(systemName: "questionmark")
                .drawingGroup()
        }
    }
    
    private func viewForVariant(_ variant: SPSymbol.Variant) -> some View {
        Image(systemName: variant == .filled ? filledName : notFilledName)
            .resizable()
            .scaledToFit()
            // Force the view to occupy a square space
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .aspectRatio(1, contentMode: .fit)
            .drawingGroup()
    }
    
    public init(symbol: SPSymbol) {
        self.filledName = symbol.filledName
        self.notFilledName = symbol.notFilled
        self.isAvailable = symbol.isAvailable()
        self.variant = symbol.variant
    }
}
