//
//  SPSelectionView.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI
import ColorKit

public struct SPSelectionView<DataAsset: SPDataAsset>: View {
    private var selection: SPSelection<DataAsset>?
    
    @_documentation(visibility: internal)
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
    
    public init(selection: SPSelection<DataAsset>?) {
        self.selection = selection
    }
}
