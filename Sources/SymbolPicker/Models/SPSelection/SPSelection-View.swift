//
//  SPSelection-View.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 06/02/2026.
//

import SwiftUI

extension SPSelection: View{
    public var body: some View{
        switch self {
        case .symbol(let value, _):
            value
        case .emoji(let value, _):
            value
        case .image(let image):
            SPImageView(image: image)
        }
    }
}
