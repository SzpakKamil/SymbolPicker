//
//  SPSymbolView.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

public struct SPSymbolView: View {
    @Environment(\.spSymbolVariant) var symbolVariant
    private let annotation: String?
    private let filledName: String
    private let notFilledName: String
    private let isAvailable: Bool
    private let variant: SPSymbol.Variant?
    
    @_documentation(visibility: internal)
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
                .accessibilityLabel(SPPageType.symbol.localizedDescription)
                .accessibilityAddTraits(.isSelected)
        }
    }
    
    private func viewForVariant(_ variant: SPSymbol.Variant) -> some View {
        Image(systemName: variant == .filled ? filledName : notFilledName)
            .resizable()
            .scaledToFit()

            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .aspectRatio(1, contentMode: .fit)
            .drawingGroup()
            .accessibilityLabel(annotation ?? SPPageType.symbol.localizedDescription)
            .accessibilityAddTraits(.isSelected)
    }
    
    public init(symbol: SPSymbol) {
        self.annotation = symbol.annotation
        self.filledName = symbol.filledName
        self.notFilledName = symbol.notFilled
        self.isAvailable = symbol.isAvailable()
        self.variant = symbol.variant
    }
}
