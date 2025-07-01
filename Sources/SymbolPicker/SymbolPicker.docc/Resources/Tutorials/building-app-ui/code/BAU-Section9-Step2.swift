//
//  ContentView.swift
//  Checker
//
//  Created by Kamil Szpak on 27/06/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var events: [Event]
    @State private var isPresentingEventCreateScreen = false
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
