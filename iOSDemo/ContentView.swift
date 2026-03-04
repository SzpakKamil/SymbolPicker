import SwiftUI
import SymbolPicker

struct ContentView: View {
    @State private var isPresented = false
    @State private var symbolName = "star.fill"
    @State private var color: Color = .yellow

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Image(systemName: symbolName)
                    .font(.system(size: 64, weight: .regular))
                    .foregroundStyle(color)
                    .padding(.top, 32)

                Button("Pick a Symbol") {
                    isPresented = true
                }
                .buttonStyle(.borderedProminent)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("SymbolPicker")
        }
        .symbolPicker(isPresented: $isPresented, symbolName: $symbolName, color: $color)
    }
}
