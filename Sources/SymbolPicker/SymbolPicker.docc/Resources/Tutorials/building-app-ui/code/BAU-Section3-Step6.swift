//
//  EventCreateView.swift
//  Checker
//
//  Created by Kamil Szpak on 29/06/2025.
//

import SwiftUI

struct EventCreateView: View {
    @Environment(\.dismiss) var dismiss
    @State private var event = Event()
    var body: some View {
        NavigationStack{
            Form{
                TextField("Title", text: $event.title)
                TextField("Description", text: $event.details, axis: .vertical)
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
                    ...
                }
            }
        }
    }
}

#Preview {
    EventCreateView()
}
