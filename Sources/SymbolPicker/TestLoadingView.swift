//
//  SwiftUIView.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 07/02/2026.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var symbols: [SPSymbol] = []
    @State private var emojis: [SPEmoji] = []
    @State private var type: String = "Emojis"
    
    @State private var selectedSymbol: SPSelection?
    let dataManager = SPDataManager()
    var body: some View {
        if #available(iOS 26.0, *) {
            NavigationStack{
                List{
                    if type == "Symbols"{
                        ForEach(symbols) { symbol in
                            symbol
                                .onTapGesture {
                                    if selectedSymbol != nil{
                                        selectedSymbol?.setSymbol(symbol)
                                    }else{
                                        selectedSymbol = .symbol(value: symbol)
                                    }
                                    
                                }
                        }
                    }else{
                        ForEach(emojis) { emoji in
                            emoji
                                .onTapGesture {
                                    if selectedSymbol != nil{
                                        selectedSymbol!.setEmoji(emoji)
                                    }else{
                                        selectedSymbol = .emoji(value: emoji)
                                    }
                                }
                        }
                    }
                }
                .navigationTitle("Tester")
                .safeAreaBar(edge: .top){
                    selectedSymbol
                }
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
                .task(priority: .high){
                    do{
                        async let symbols = dataManager.fetchSymbols()
                        async let emojis = dataManager.fetchEmojis()
                        self.symbols = try await symbols
                        self.emojis = try await emojis
                    }catch let error as SPDataManager.Error {
                        switch error{
                        case .bundleURLNotCreated(fileName: let filename):
                            print("No file with name: \(filename)")
                        case .decodingFailed(type: let type, error: let errorDecoded):
                            print("Decoding failed for \(type) with error \(errorDecoded.localizedDescription)")
                        case .fileNotFound(fileName: let filename):
                            print("No file with name: \(filename)")
                        case .otherError(error: let otherError):
                            print("Failed with an error: \(otherError.localizedDescription)")
                        }
                    }catch{
                        print(error.localizedDescription)
                    }
                }
            }
        }else {
            // Fallback on earlier versions
        }
    }
}

#Preview {
    SwiftUIView()
}
