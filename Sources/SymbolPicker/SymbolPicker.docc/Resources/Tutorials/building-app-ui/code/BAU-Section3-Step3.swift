//
//  EventCreateView.swift
//  Checker
//
//  Created by Kamil Szpak on 29/06/2025.
//

import SwiftUI

struct EventCreateView: View {
    @State private var event = Event()
    var body: some View {
        NavigationStack{
            Form{
                ...
            }
            .navigationTitle("Create Event")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    EventCreateView()
}
