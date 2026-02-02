# Set Up

@Metadata {
    @SupportedLanguage(swift)
    @TitleHeading("Getting Started")
    @Available(iOS, introduced: "14.0")
    @Available(iPadOS, introduced: "14.0")
    @Available(macOS, introduced: "11.0")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "5.9")
    @Available(Xcode, introduced: "15.0")
    @PageColor(green)
    @PageImage(purpose: card, source: "SymbolPickerSetUp")
}

@Options{
    @AutomaticSeeAlso(disabled)
}

Learn how to integrate the `SymbolPicker` package into your SwiftUI project.

## Overview

The `SymbolPicker` package provides a customizable SwiftUI SF Symbol picker for iOS, iPadOS, visionOS and macOS. This guide explains how to add the package using Swift Package Manager (SPM).

## Installing Agent Skill
You can install the SymbolPicker skill for your CLI agent to get expert guidance on SymbolPicker directly in your terminal.

### Using skills.sh:
```bash
npx skills add https://github.com/SzpakKamil/AgentSkills --skill SymbolPicker
```

### Using ClawdHub:
```bash
npx dlx clawdhub@latest install symbolpicker
```

## Adding SymbolPicker to Your Project

Add the `SymbolPicker` package to your project via Swift Package Manager:

1. In Xcode, go to **File > Add Package Dependency**.
2. Enter the package URL: `https://github.com/SzpakKamil/SymbolPicker.git`.
3. Select a version (e.g., a 1.0.0) or use the `main` branch, then click **Add Package**.
4. Ensure your project uses Swift 5.9+ for compatibility.
5. Import the module in your SwiftUI view:

   ```swift
   import SymbolPicker
   ```

For setup instructions, supported versions, and contribution guidelines, see the README at https://github.com/SzpakKamil/SymbolPicker.

### Example Integration

Here’s a minimal example of using `SymbolPicker` in a SwiftUI view:

```swift
import SwiftUI
import SymbolPicker

struct ContentView: View {
    @State private var isPresented = false
    @State private var symbolName = "star.fill"
    
    var body: some View {
        Button{ isPresented = true } label: {
            Image(systemName: symbolName)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
        }
        .symbolPicker(isPresented: $isPresented, symbolName: $symbolName)
    }
}
```

This creates a button that, when tapped, presents the SF Symbol picker, updating the displayed symbol based on the user’s selection.

## Troubleshooting

- **Package not found**: Verify the URL (`https://github.com/SzpakKamil/SymbolPicker.git`) and your internet connection.
- **Dependency issues**: Confirm the version or branch exists in the repository. Try the `main` branch if unsure.
- **Module not recognized**: Ensure the package is added to your project’s target and `import SymbolPicker` is included.
- **Compatibility errors**: Check that your project’s deployment target meets iOS 15.0+, iPadOS 15.0+, macOS 11.0+ or visionOS 1.0+.

## Next Steps

- Build a sample app with <doc:SymbolGallery>.
