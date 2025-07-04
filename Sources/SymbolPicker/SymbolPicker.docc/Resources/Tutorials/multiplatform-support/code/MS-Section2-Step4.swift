//
//  TypeCreateView.swift
//  Checker
//
//  Created by Kamil Szpak on 29/06/2025.
//

import SwiftUI
import SwiftData
import SymbolPicker

struct TypeCreateView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @Binding var parentType: Type?
    @State private var type = Type()
    @State private var isPresentingSymbolPicker = false
    var body: some View {
        NavigationStack{
            Form{
                TextField("Title", text: $type.title)
                Button("Select Symbol", systemImage: type.symbolName){
                    isPresentingSymbolPicker.toggle()
                }
                .buttonStyle(.plain)
                .foregroundStyle(type.symbolColor.color)
                .symbolPicker(isPresented: $isPresentingSymbolPicker, symbolName: $type.symbolName, color: $type.symbolColor)
                .symbolPickerSymbolsStyle(.outlined)
            }
            .toolbar{
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close", systemImage: "xmark"){
                        dismiss()
                    }
                }
                ToolbarItem(placement: .primaryAction) {
                    Button("Add Type", systemImage: "checkmark"){
                        modelContext.insert(type)
                        parentType = type
                        dismiss()
                    }
                    .disabled(type.isInvalid)
                }
            }
            .navigationTitle("Add Type")
            #if !os(macOS)
            .navigationBarTitleDisplayMode(.inline)
            #endif
        }
    }
}

#Preview {
    TypeCreateView(parentType: .constant(nil))
}
