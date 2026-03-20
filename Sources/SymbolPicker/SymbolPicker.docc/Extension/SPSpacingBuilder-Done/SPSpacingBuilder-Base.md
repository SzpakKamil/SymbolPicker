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

A custom result builder that enables a declarative syntax for defining an array of spacing configurations.

## Overview

`SPSpacingBuilder` is a DSL (Domain-Specific Language) component that simplifies the creation of multiple ``SymbolPicker/SPSpacing`` objects. It is used within ``SymbolPicker/SymbolPickerConfiguration`` to provide a clean, readable way to define how different components of the picker should scale across various dynamic type sizes and platforms.

### Usage

The builder is typically applied to functions or properties that return an array of ``SymbolPicker/SPSpacing``. It supports standard control flow statements like `if`, `else`, and `switch`, allowing for complex, platform-aware configurations.

### Example: Declarative Spacing Configuration

```swift
@SPSpacingBuilder
func myCustomSpacing() -> [SPSpacing] {
    // Define spacing for the color picker
    SPSpacing(component: .colorPicker) { typeSize in
        let base: CGFloat = 45
        #if os(macOS)
        let factor: CGFloat = 0.4
        #else
        let factor: CGFloat = 1.0
        #endif
        return .init(width: base * factor, height: base * factor)
    }

    // Define spacing for the option list
    SPSpacing(component: .optionList) { typeSize in
        // Switch logic based on typeSize...
        return .init(width: 24, height: 30)
    }
}
```

## Topics

### Result Builder Methods
The underlying methods used to support the declarative syntax (internal documentation only).
