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
        NavigationStack{
            Group{
                if events.isEmpty{
                    ContentUnavailableView("No Events Found", systemImage: "plus.circle", description: Text("Create events to display them here."))
                        .ignoresSafeArea()
                }else{
                    let groupedEvents = Dictionary(grouping: events){$0.type?.title ?? "Not Specified"}
                    List{
                        ForEach(groupedEvents.sorted{ $0.key < $1.key }, id: \.key){ pair in
                            Section {
                                ForEach(pair.value){ event in
                                    row(for: event)
                                }
                            } header: {
                                let systemImage = types.first{ $0.title == pair.key}?.symbolName ?? "archivebox"
                                Label(pair.key, systemImage: systemImage)
                            }
                        }
                    }
                }
            }
            .toolbar{
                ToolbarItem(placement: .primaryAction) {
                    Button("Add Event", systemImage: "plus"){
                        isPresentingEventCreateScreen.toggle()
                    }
                }
            }
            .sheet(isPresented: $isPresentingEventCreateScreen){
                EventCreateView()
            }
            .navigationTitle("Checker")
        }
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
