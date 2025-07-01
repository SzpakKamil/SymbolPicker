//
//  ContentView.swift
//  Checker
//
//  Created by Kamil Szpak on 27/06/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query private var events: [Event]
    @Query private var types: [Type]
    @State private var isPresentingEventCreateScreen = false
    @State private var selectedEvent: Event?
    var body: some View {
        NavigationStack{
            Group{
                if events.isEmpty{
                    
                }else{
                    List{
                        
                    }
                }
            }
            .navigationTitle("Checker")
        }
    }
}

#Preview {
    ContentView()
}
