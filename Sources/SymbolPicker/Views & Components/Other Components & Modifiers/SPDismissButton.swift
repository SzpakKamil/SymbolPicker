//
//  SPDismissButton.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 13/03/2026.
//

import SwiftUI

struct SPDismissButton: View {
    @Environment(\.spIsPresented) var spIsPresented
    var body: some View {
        if #available(iOS 17.0, *){
            Button{
                spIsPresented?.wrappedValue = false
            }label: {
                Text(SPTranslation.Close.localizedDescription)
            }
        }else{
            Button(SPTranslation.Close.localizedDescription){
                spIsPresented?.wrappedValue = false
            }
        }
    }
}
