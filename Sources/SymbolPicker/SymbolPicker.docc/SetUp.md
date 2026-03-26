# Set Up

@Metadata {
    @SupportedLanguage(swift)
    @TitleHeading("Getting Started")
    @Available(iOS, introduced: "15.0")
    @Available(iPadOS, introduced: "15.0")
    @Available(macOS, introduced: "12.0")
    @Available(tvOS, introduced: "15.0")
    @Available(watchOS, introduced: "10.0")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "6.0")
    @Available(Xcode, introduced: "16.0")
    @PageColor(blue)
}

@Options {
    @AutomaticSeeAlso(disabled)
}

Integrate SymbolPicker into your SwiftUI project.

## Overview

SymbolPicker provides a robust asset selection interface for SF Symbols, Emojis, Colors, and Images. Add the package using Swift Package Manager (SPM).

## Installing Agent Skill
Install the SymbolPicker skill for your CLI agent to get expert guidance.

### Using skills.sh:
```bash
npx skills add https://github.com/SzpakKamil/AgentSkills --skill SymbolPicker
```

### Using ClawdHub:
```bash
npx dlx clawdhub@latest install symbolpicker
```

## Adding SymbolPicker to Your Project

Add SymbolPicker via Swift Package Manager:

1. In Xcode, select **File > Add Package Dependency**.
2. Enter the URL: `https://github.com/SzpakKamil/SymbolPicker.git`.
3. Select a version (2.0.0+) or the `1.0` branch, then click **Add Package**.
4. Ensure your project uses Swift 6.0+.
5. Import the module:

   ```swift
   import SymbolPicker
   ```

See the [README](https://github.com/SzpakKamil/SymbolPicker) for detailed setup instructions and requirements.

### Example Integration

Presenting the picker as a sheet:

```swift
import SwiftUI
import SymbolPicker

struct ContentView: View {
    @State private var selection: SPSelection<SPSymbol>? = nil
    @State private var isPresented = false

    var body: some View {
        Button("Select Symbol") {
            isPresented = true
        }
        .symbolPicker(isPresented: $isPresented, selection: $selection)
        .onChange(of: selection) { newValue in
            if let symbol = newValue {
                print("Selected: \(symbol.id)")
            }
        }
    }
}
```

This code snippet demonstrates the simplest way to integrate `SymbolPicker` into your view hierarchy using the `.symbolPicker()` modifier.

## Troubleshooting

- **Package not found**: Verify the URL (`https://github.com/SzpakKamil/SymbolPicker.git`) and your internet connection.
- **Dependency issues**: Confirm the version or branch exists. Try the `1.0` branch if `main` is not desired.
- **Module not recognized**: Ensure the package is added to the correct target and `import SymbolPicker` is present.
- **Compatibility errors**: Check deployment targets (iOS 15.0+, macOS 12.0+, tvOS 15.0+, watchOS 10.0+, visionOS 1.0+).

## Next Steps

- Learn more about features: <doc:AboutSymbolPicker>
- Explore customization: <doc:Modifiers>
