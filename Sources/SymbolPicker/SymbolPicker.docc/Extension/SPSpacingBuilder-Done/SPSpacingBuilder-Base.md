# ``SymbolPicker/SPSpacingBuilder``

@Metadata {
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "15.0")
    @Available(iPadOS, introduced: "15.0")
    @Available(macOS, introduced: "12.0")
    @Available(tvOS, introduced: "15.0")
    @Available(watchOS, introduced: "10.0")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "6.0")
    @Available(Xcode, introduced: "15.0")
    @DocumentationExtension(mergeBehavior: override)
}

@Options {
    @AutomaticSeeAlso(disabled)
    @AutomaticArticleSubheading(disabled)
}

Define an array of spacing configurations using a declarative syntax.

## Overview

`SPSpacingBuilder` acts as a domain-specific language for creating multiple ``SymbolPicker/SPSpacing` objects. You use this builder within a ``SymbolPicker/SymbolPickerConfiguration`` to define how picker components scale across dynamic type sizes and platforms.

### Usage

Apply this builder to functions or properties that return an array of ``SymbolPicker/SPSpacing``. It supports control flow statements like `if`, `else`, and `switch` for platform-specific configurations.

### Example: Spacing Configuration

```swift
@SPSpacingBuilder
func myCustomSpacing() -> [SPSpacing] {
    // Define color picker spacing
    SPSpacing(component: .colorPicker) { typeSize in
        let base: CGFloat = 45
        #if os(macOS)
        let factor: CGFloat = 0.4
        #else
        let factor: CGFloat = 1.0
        #endif
        return .init(width: base * factor, height: base * factor)
    }

    // Define option list spacing
    SPSpacing(component: .optionList) { typeSize in
        return .init(width: 24, height: 30)
    }
}
```

## Topics

### Result Builder Methods
Underlying methods for the declarative syntax.
