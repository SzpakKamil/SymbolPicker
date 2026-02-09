//
//  SwiftUIView.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 07/02/2026.
//

import SwiftUI


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
                    Text("\(String(data: try! JSONEncoder().encode(SPColor(id: "red", colorSpace: .rommRGB)!) , encoding: .utf8))")
                    Rectangle()
                        .fill(SPColor(red: 1.5, green: 0, blue: 0, opacity: 1, colorSpace: .sRGBLinear))
                        .frame(width: 200, height: 200)
                    Rectangle()
                        .fill(SPColor(red: 1.0, green: 0, blue: 0, opacity: 1, colorSpace: .displayP3))
                        .frame(width: 200, height: 200)
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
