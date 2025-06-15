# Symbol Gallery

@Metadata {
    @TitleHeading("Sample Code")
    @Available(iOS, introduced: "17.0")
    @Available(iPadOS, introduced: "17.0")
    @Available(macOS, introduced: "14.0")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "5.9")
    @Available(Xcode, introduced: "15.0")
    @PageKind(sampleCode)
    @PageColor(purple)
    @PageImage(purpose: card, source: "SymbolPickerSample")
    @CallToAction(url: "https://assets.kamilszpak.com/SymbolPicker/SymbolGallery.zip", label: "Download")
}

Discover how the `SymbolPicker` package powers a dynamic, customizable SF Symbol selection experience in a sample symbol gallery app for iOS, iPadOS, macOS, and visionOS.

## Overview

The Symbol Gallery sample project demonstrates the `SymbolPicker` package's capabilities in a SwiftUI app designed for iOS (17.0+), iPadOS (17.0+), macOS (14.0+), and visionOS (1.0+). It features a searchable gallery of SF Symbols, allowing users to add symbols with customizable colors and search by symbol name. The project showcases advanced `SymbolPicker` features like symbol selection, color customization, and dismissal behavior, all integrated into a clean, native SwiftUI interface. Symbols are filtered to match the device’s SF Symbols version (e.g., iOS 26 supports SF Symbols 7), ensuring no empty grid cells in the picker interface.

Key features of the Symbol Gallery app:
- **Native Symbol Picker**: Uses `SymbolPicker` to provide a platform-appropriate symbol selection experience, presented as a sheet on iOS/visionOS or popover on macOS/iPadOS.
- **Color Customization**: Allows users to apply colors (e.g., `.red`, `.customColor`) to selected symbols using `SymbolColor`.
- **Searchable Gallery**: Enables filtering of added symbols by name using SwiftUI’s `.searchable` modifier.
- **Responsive UI**: Includes a toggleable symbol picker, a no-results view for unmatched searches, and an empty gallery prompt.
- **Platform Optimizations**: Adapts styling and behavior for iOS, iPadOS, macOS, and visionOS, ensuring a native look and feel.

This sample project serves as a practical example of how to integrate and customize the `SymbolPicker` package in a real-world SwiftUI application.

## Project Structure

The Symbol Gallery project consists of three main files:

- **`Symbol_GaleryApp.swift`**: Defines the main `Symbol_GaleryApp` struct, which sets up the app’s entry point and presents the `ContentView`.
- **`ContentView.swift`**: Implements the main `ContentView` struct, which manages the searchable symbol gallery UI. It uses `SymbolPicker` for symbol selection, handles search text filtering, and manages state for the symbol list and picker presentation.
- **`SymbolModel.swift`**: Contains the `Symbol` struct, which models the app’s data. `Symbol` represents an SF Symbol with an ID, title, symbol name, and color, conforming to `Identifiable`, `Equatable`, and `Comparable` for list management.

## Key Implementation Details

### Symbol Picker Configuration
The `SymbolPicker` in `ContentView` is configured with modifiers to enable a rich symbol selection experience:

```swift
.symbolPicker(isPresented: $isPresented, symbolName: $tempSymbol.symbolName, color: $tempSymbol.color)
    .symbolPickerDismiss(type: .manual) {
        tempSymbol.title = tempSymbol.symbolName
        symbols.append(tempSymbol)
        tempSymbol = Symbol()
    }
```

- **Picker Presentation**: `.symbolPicker(isPresented: $isPresented, symbolName: $tempSymbol.symbolName, color: $tempSymbol.color)` binds the picker to a temporary symbol’s name and color, toggled by `isPresented`.
- **Dismissal Behavior**: `.symbolPickerDismiss(type: .manual)` ensures manual dismissal, with a closure to append the selected symbol to the gallery and reset the temporary symbol.
- **Symbol Filtering**: The picker only displays symbols compatible with the device’s SF Symbols version, preventing empty grid cells.

### Filtering Logic
The symbol gallery is filtered based on the search text:

```swift
let filteredSymbols = symbols.filter {
    if searchText.isEmpty {
        true
    } else {
        $0.title.localizedStandardContains(searchText)
    }
}
```

- **Text Matching**: Filters symbols whose titles contain the search text (case-insensitive), showing all symbols if the search text is empty.
- **Dynamic Updates**: The `filteredSymbols` computed property updates the list in real-time as the user types.

### UI Features
- **Toggleable Symbol Picker**: A toolbar button with a "+" icon toggles the `SymbolPicker` using the `isPresented` state.
- **No-Results View**: Displays a `ContentUnavailableView.search(text: searchText)` when no symbols match the search or a `ContentUnavailableView` with a prompt ("No Symbols Added") for an empty gallery.
- **Platform-Specific Styling**: Uses `Color(.systemGroupedBackground)` and platform-appropriate padding to ensure a native look across iOS, iPadOS, macOS, and visionOS.

### Data Models
The `Symbol` struct in `SymbolModel.swift` is designed to work seamlessly with `SymbolPicker`:

- **`Symbol`**:
  - Properties: `id` (UUID), `title` (String), `symbolName` (String, defaults to "car.fill"), `color` (SymbolColor, defaults to `.red`).
  - Conformance: `Identifiable` for list iteration, `Equatable` for comparison, and `Comparable` for sorting by title.
  - Initialization: Provides a default initializer for creating new symbols.

## Setup Instructions

To run the Symbol Gallery sample project:

1. **Add the SymbolPicker Package**:
   - In Xcode, select **File > Add Package Dependency**.
   - Enter the package URL: `https://github.com/SzpakKamil/SymbolPicker.git`.
   - Specify the version or branch (e.g., `main` or a specific tag), then add the package.
   - Import the module: `import SymbolPicker`.

2. **Create Project Files**:
   - Add `Symbol_GaleryApp.swift`, `ContentView.swift`, and `SymbolModel.swift` to your Xcode project.
   - Ensure the project’s deployment target is iOS 17.0+, iPadOS 17.0+, macOS 14.0+, or visionOS 1.0+ and uses Swift 5.9.

3. **Build and Run**:
   - Build the project in Xcode 15.0+.
   - Test on an iOS, iPadOS, macOS, or visionOS simulator/device to explore the symbol selection functionality.

Alternatively, tap to open the complete project from the [Symbol Gallery sample](https://assets.kamilszpak.com/SymbolPicker/SymbolGallery.zip).

## Troubleshooting

- **SymbolPicker not appearing?** Ensure the `SymbolPicker` package is correctly added to your project and imported in `ContentView.swift`.
- **Symbols not displaying?** Verify that the device’s SF Symbols version supports the selected symbols and that `symbolName` is valid.
- **UI issues on visionOS?** Confirm the deployment target is visionOS 1.0+ in a visionOS simulator.
- **Search not filtering?** Check that the `filteredSymbols` computed property in `ContentView` correctly uses `localizedStandardContains`.

## Next Steps

- Dive into available modifiers in <doc:Modifiers>.
- Refer to the ``SymbolPicker`` API documentation.
- Experiment with additional `SymbolColor` options or custom symbol categories to extend the app’s functionality.
