//
//  ContentView.swift
//  Checker
//
//  Created by Kamil Szpak on 27/06/2025.
//

import SwiftUI
import SwiftData
import SymbolPicker

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query private var events: [Event]
    @Query private var types: [Event]
    @State private var isPresentingEventCreateScreen = false
    @State private var selectedEvent: Event?
    var body: some View {
        ...
    }
    
    @ViewBuilder
    func row(for event: Event) -> some View{
        HStack(){
            Image(systemName: event.symbolName)
                .imageScale(.large)
                .foregroundStyle(event.symbolColor.color)
            VStack(alignment: .leading){
                Text(event.title)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                if !event.details.isEmpty{
                    Text(event.details)
                        .font(.callout)
                        .multilineTextAlignment(.leading)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
