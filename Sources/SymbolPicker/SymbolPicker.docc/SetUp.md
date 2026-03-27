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

SymbolPicker provides a selection tool for Symbols, Emojis, Colors, and Images. Add the package using Swift Package Manager (SPM) to begin.

## Installing the Agent Skill

Add the SymbolPicker skill to your CLI agent for expert guidance.

### Using skills.sh
```bash
npx skills add https://github.com/SzpakKamil/AgentSkills --skill SymbolPicker
```

### Using ClawdHub
```bash
npx dlx clawdhub@latest install symbolpicker
```

## Adding the Package

Use Xcode to add SymbolPicker to your project:

1. Select **File > Add Package Dependency**.
2. Enter the URL: `https://github.com/SzpakKamil/SymbolPicker.git`.
3. Choose version `2.0.0+` or the `1.0` branch.
4. Ensure your project target uses Swift 6.0 or newer.
5. Import the module in your view:

   ```swift
   import SymbolPicker
   ```

### Quick Integration

Show the picker as a sheet by using the `.symbolPicker()` modifier:

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

## Troubleshooting

- **Package Missing**: Check your internet connection and the repository URL.
- **Dependency Issues**: Confirm the version or branch exists. Try the `1.0` branch if the `main` branch is not available.
- **Module Error**: Ensure you added the package to the correct target and included the `import` statement.
- **Compatibility**: Verify your deployment targets match the requirements (e.g., iOS 15.0+ or macOS 12.0+).

## Next Steps

- Explore features: <doc:AboutSymbolPicker>
- Customize the picker: <doc:Modifiers>
