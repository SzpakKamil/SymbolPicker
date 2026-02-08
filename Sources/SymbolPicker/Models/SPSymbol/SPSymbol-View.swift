//
//  SPSymbol-View.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 07/02/2026.
//

import SwiftUI

extension SPSymbol: View{
    public var body: some View{
        SPSymbolView(symbol: self)
    }
}
struct SPSymbolView: View {
    @Environment(\.symbolVariant) var symbolVariant
    let symbol: SPSymbol
    var body: some View {
        switch symbol.variant {
        case .filled:
            Image(systemName: symbol.filledName)
        case .outlined:
            Image(systemName: symbol.notFilled)
        default:
            switch symbolVariant{
            case .filled:
                Image(systemName: symbol.filledName)
            case .outlined:
                Image(systemName: symbol.notFilled)
            }
        }
        
    }
}
