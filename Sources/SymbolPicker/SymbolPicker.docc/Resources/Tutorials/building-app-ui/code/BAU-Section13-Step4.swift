//
//  EventDetailsView.swift
//  Checker
//
//  Created by Kamil Szpak on 29/06/2025.
//

import SwiftData
import SwiftUI
import SymbolPicker

struct EventDetailsView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    var selectedEvent: Event
    var body: some View {
        NavigationStack{
            List{
                Section("Details"){
                    Text(selectedEvent.details.isEmpty ? "No Detail Text" : selectedEvent.details)
                    Label("Type: \(selectedEvent.type?.title ?? "None")", systemImage: selectedEvent.type?.symbolName ?? "archivebox")
                }
                Section("Action"){
                    
                }
            }
            .navigationTitle(selectedEvent.title)
        }
    }
}

#Preview {
    EventDetailsView(selectedEvent: Event(title: "Preview Event", details: "This is event for preview", symbolName: "iphone", symbolColor: .blue))
}
