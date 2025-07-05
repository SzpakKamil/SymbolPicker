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
        }
        .modelContainer(for: [Event.self, Type.self])
    }
}
