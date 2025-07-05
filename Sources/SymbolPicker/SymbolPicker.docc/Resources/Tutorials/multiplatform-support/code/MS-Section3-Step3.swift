//
//  CheckerApp.swift
//  Checker
//
//  Created by Kamil Szpak on 27/06/2025.
//

import SwiftUI
import SymbolPicker
import SwiftData

@main
struct CheckerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            #if os(macOS)
                .frame(width: 400, height: 400)
            #endif
        }
        .windowResizability(.contentSize)
        .modelContainer(for: [Event.self, Type.self])
    }
}
