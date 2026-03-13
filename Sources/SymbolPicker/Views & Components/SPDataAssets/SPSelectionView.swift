//
//  SPSelectionView.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI
import ColorKit

public struct SPSelectionView<T: SPDataAsset>: View {
    private var selection: SPSelection<T>?
    
    public var body: some View {
        Group {
            if let selection{
                selection.asView()
            }else{
                EmptyView()
            }
        }
        .id(selection?.id)
    }
    
    public init(selection: SPSelection<T>?) {
        self.selection = selection
    }
}
