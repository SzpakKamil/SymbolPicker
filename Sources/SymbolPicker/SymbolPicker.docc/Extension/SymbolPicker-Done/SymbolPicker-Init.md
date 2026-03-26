# Initializers

Detailed reference for the available `SymbolPicker` initializers, covering generic and specialized use cases.

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

## Overview

`SymbolPicker` provides a wide range of specialized initializers to make binding to common data types as simple as possible. Whether you are managing a full ``SymbolPicker/SPSelection`` object or just a single `String` representing an SF Symbol name, there is an initializer tailored to your needs. These initializers handle the underlying data mapping automatically, reducing boilerplate code.

## Initializer Categories

### Base Generic Initializers
These initializers provide direct access to the underlying ``SymbolPicker/SPSelection`` object. Use these when you need full control over the selected asset and its properties, or when you are building custom data models.

- ``SymbolPicker/SymbolPicker/init(selection:configuration:)-(Binding<SPSelection<DataAsset>>,_)``
- ``SymbolPicker/SymbolPicker/init(selection:configuration:)-(Binding<SPSelection<DataAsset>?>,_)``

### SF Symbol Specialized Initializers
These initializers fix the asset type to ``SymbolPicker/SPSymbol`` and provide bindings to the symbol name (as a `String`) and its associated color. They are the most common choice for general-purpose iconography.

| Binding Type | Description | Initializer |
| :--- | :--- | :--- |
| **String** | Basic binding to an SF Symbol name. | ``SymbolPicker/SymbolPicker/init(systemImage:configuration:)-(Binding<String>,_)`` |
| **Optional String** | Supports cases where no symbol is selected. | ``SymbolPicker/SymbolPicker/init(systemImage:configuration:)-(Binding<String?>,_)`` |
| **CKColor** | Binding using ColorKit's `CKColor` for cross-platform consistency. | ``SymbolPicker/SymbolPicker/init(systemImage:ckColor:configuration:)-(Binding<String>,_,_)`` |
| **Color** | Direct binding to a standard SwiftUI `Color`. | ``SymbolPicker/SymbolPicker/init(systemImage:color:configuration:)-(Binding<String>,_,_)`` |
| **[Double]** | Binds to a raw RGBA array, ideal for persistent storage. | ``SymbolPicker/SymbolPicker/init(systemImage:colorValues:configuration:)-(Binding<String>,_,_)`` |

### Emoji Specialized Initializers
These initializers focus on ``SymbolPicker/SPEmoji`` selection and allow for color binding. While emojis are primarily text-based, the picker can apply color overlays or tinting when they are used as icons in certain configurations.

- ``SymbolPicker/SymbolPicker/init(emoji:configuration:)-(Binding<SPEmoji>,_)``
- ``SymbolPicker/SymbolPicker/init(emoji:configuration:)-(Binding<SPEmoji?>,_)``
- ``SymbolPicker/SymbolPicker/init(emoji:ckColor:configuration:)-(Binding<SPEmoji>,_,_)``
- ``SymbolPicker/SymbolPicker/init(emoji:color:configuration:)-(Binding<SPEmoji>,_,_)``
- ``SymbolPicker/SymbolPicker/init(emoji:colorValues:configuration:)-(Binding<SPEmoji>,_,_)``

### Image Specialized Initializers
Used for selecting custom bitmapped images (``SymbolPicker/SPImage``). These are ideal for use cases where system icons are insufficient and you need to provide your own localized or branded assets.

- ``SymbolPicker/SymbolPicker/init(image:configuration:)-(Binding<SPImage>,_)``
- ``SymbolPicker/SymbolPicker/init(image:configuration:)-(Binding<SPImage?>,_)``
- ``SymbolPicker/SymbolPicker/init(image:ckColor:configuration:)-(Binding<SPImage>,_,_)``
- ``SymbolPicker/SymbolPicker/init(image:color:configuration:)-(Binding<SPImage>,_,_)``
- ``SymbolPicker/SymbolPicker/init(image:colorValues:configuration:)-(Binding<SPImage>,_,_)``

## Example

Binding the picker directly to a `String` and a `Color` using a specialized initializer:

```swift
@State private var iconName = "heart.fill"
@State private var iconColor = Color.red

var body: some View {
    SymbolPicker(systemImage: $iconName, color: $iconColor)
}
```
