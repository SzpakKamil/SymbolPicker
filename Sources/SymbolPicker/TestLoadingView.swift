//
//  SwiftUIView.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 07/02/2026.
//

import SwiftUI
import SPColor

public struct SwiftUIView: View {
    @State private var symbols: [SPSymbol] = []
    @State private var emojis: [SPEmoji] = []
    @State private var type: String = "Symbols"
    @State private var searchText: String = ""
    let dataManager = SPDataManager()
    public var body: some View {
        if #available(iOS 26.0, macOS 26.0, *) {
            NavigationStack{
                List{
                    Text("\(String(data: try! JSONEncoder().encode(SPColor(id: "red", colorSpace: .displayP3)), encoding: .utf8))")
                        .foregroundStyle(SPColor.red)
                    if type == "Symbols"{
                        ForEach(symbols) { symbol in
                            symbol
                        }
                    }else{
                        ForEach(emojis) { emoji in
                            emoji
                        }
                    }
                }
                .navigationTitle("Tester")
                .safeAreaBar(edge: .bottom) {
                    Picker("Type", selection: $type){
                        Text("Symbols")
                            .tag("Symbols")
                        Text("Emojis")
                            .tag("Emojis")
                    }
                    .pickerStyle(.segmented)
                    .padding(.horizontal)
                }
                .searchable(text: $searchText)
                .task(id: searchText){
                    async let symbols =  dataManager.search(SPSymbol.self, for: searchText)
                    async let emojis = dataManager.search(SPEmoji.self, for: searchText)
                    self.symbols = (try? await symbols) ?? []
                    self.emojis = (try? await emojis) ?? []
                }
                .task(priority: .high){
                    do{
                        async let symbols = dataManager.fetch(type: SPSymbol.self)
                        async let emojis = dataManager.fetch(type: SPEmoji.self)
                        self.symbols = try await symbols
                        self.emojis = try await emojis
                    }catch{
                        print(error.localizedDescription)
                    }
                }
            }
        }else {
            // Fallback on earlier versions
        }
    }
    
    public init(){
        
    }
}

#Preview {
    SwiftUIView()
}
