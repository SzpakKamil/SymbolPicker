//
//  EventCreateView.swift
//  Checker
//
//  Created by Kamil Szpak on 29/06/2025.
//

import SwiftUI
import SwiftData
import SymbolPicker

struct EventCreateView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var isPresentingSymbolPicker = false
    @State private var event = Event()
    var body: some View {
        NavigationStack{
            Form{
                TextField("Title", text: $event.title)
                TextField("Description", text: $event.details, axis: .vertical)
                Button("Select Symbol", systemImage: event.symbolName){
                    isPresentingSymbolPicker.toggle()
                }
                .buttonStyle(.plain)
                .foregroundStyle(event.symbolColor.color)
                .symbolPicker(isPresented: $isPresentingSymbolPicker, symbolName: $event.symbolName, color: $event.symbolColor)
                .symbolPickerSymbolsStyle(.outlined)
            }
            .navigationTitle("Create Event")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close", systemImage: "xmark") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .primaryAction) {
                    Button("Save", systemImage: "checkmark") {
                        modelContext.insert(event)
                        dismiss()
                    }
                    .disabled(event.isInvalid)
                }
            }
        }
    }
}

#Preview {
    EventCreateView()
}
