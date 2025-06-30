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
    @Query private var types: [Type]
    @State private var isPresentingSymbolPicker = false
    @State private var isPresentingTypeSheet = false
    @State private var event = Event()
    var body: some View {
        NavigationStack{
            Form{
                TextField("Title", text: $event.title)
                TextField("Description", text: $event.details, axis: .vertical)
                Menu("Type: \(event.type?.title ?? "None")", systemImage: event.type?.symbolName ?? "archivebox") {
                    Button("Add Type", systemImage: "plus.circle"){
                        isPresentingTypeSheet.toggle()
                    }
                    Divider()
                    if !types.isEmpty{
                        Picker("Types", selection: $event.type){
                            ForEach(types){ type in
                                Label(type.title, systemImage: type.symbolName)
                                    .tag(type)
                            }
                        }
                    }else{
                        Text("No Types Found")
                    }
                }
                Button("Select Symbol", systemImage: event.symbolName){
                    isPresentingSymbolPicker.toggle()
                }
                .buttonStyle(.plain)
                .foregroundStyle(event.symbolColor.color)
                .symbolPicker(isPresented: $isPresentingSymbolPicker, symbolName: $event.symbolName, color: $event.symbolColor)
            }
            .sheet(isPresented: $isPresentingTypeSheet){
                TypeCreateView(parentType: $event.type)
                    .presentationDetents([.medium])
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
