//
//  EventDetailsView.swift
//  Checker
//
//  Created by Kamil Szpak on 29/06/2025.
//

import SwiftUI
import SymbolPicker

struct EventDetailsView: View {
    @Environment(\.dismiss) var dismiss
    var selectedEvent: Event
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    EventDetailsView(selectedEvent: Event(title: "Preview Event", details: "This is event for preview", symbolName: "iphone", symbolColor: .blue))
}
