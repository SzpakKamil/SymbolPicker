////
////  SwiftUIView.swift
////  SymbolPicker
////
////  Created by Kamil Szpak on 07/02/2026.
////
//
//import SwiftUI
//
//
//public struct LoadTestView: View {
//    @State private var symbols: [SPSymbol] = []
//    @State private var emojis: [SPEmoji] = []
//    @State private var type: String = "Symbols"
//    @State private var searchText: String = ""
//    let dataManager = SPDataManager()
//    public var body: some View {
//        if #available(iOS 26.0, macOS 26.0, tvOS 26.0, visionOS 26.0, watchOS 26.0, *) {
//            NavigationStack{
//                List{
//                    if type == "Symbols"{
//                        ForEach(symbols) { symbol in
//                            HStack{
//                                SPSymbolView(symbol: symbol)
//                                    .environment(\.spSymbolVariant, .filled)
//                                SPSymbolView(symbol: symbol)
//                                    .environment(\.spSymbolVariant, .outlined)
//                            }
//                        }
//                    }else{
//                        ForEach(emojis) { emoji in
//                            HStack{
//                                SPEmojiView(emoji: emoji)
//                                ForEach(emoji.skins ?? []) { skin in
//                                    SPEmojiView(skin: skin)
//                                }
//                            }
//                        }
//                    }
//                }
//                .navigationTitle("Tester")
//                .safeAreaBar(edge: .bottom) {
//                    Picker("Type", selection: $type){
//                        Text("Symbols")
//                            .tag("Symbols")
//                        Text("Emojis")
//                            .tag("Emojis")
//                    }
//                    #if !os(watchOS)
//                    .pickerStyle(.segmented)
//                    #endif
//                    .padding(.horizontal)
//                }
//                #if os(iOS)
//                .searchable(text: $searchText, placement: .toolbarPrincipal)
//                #else
//                .searchable(text: $searchText)
//                #endif
//                .task(id: searchText){
//                    async let symbols =  dataManager.search(SPSymbol.self, for: searchText)
//                    async let emojis = dataManager.search(SPEmoji.self, for: searchText)
//                    self.symbols = (try? await symbols) ?? []
//                    self.emojis = (try? await emojis) ?? []
//                }
//                .task(priority: .high){
//                    do{
//                        async let symbols = dataManager.fetch(type: SPSymbol.self)
//                        async let emojis = dataManager.fetch(type: SPEmoji.self)
//                        self.symbols = try await symbols
//                        self.emojis = try await emojis
//                    }catch{
//                        print(error.localizedDescription)
//                    }
//                }
//            }
//        }else {
//            // Fallback on earlier versions
//        }
//    }
//    
//    public init(){
//        
//    }
//}
//
//#Preview {
//    LoadTestView()
//}
