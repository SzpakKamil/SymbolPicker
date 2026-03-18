# ``SymbolPicker/SPDataAsset/isAvailable()``

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

Checks if the asset can be rendered on the current operating system, supporting SF Symbols, Emojis, and custom icons.

- Returns: `true` if the asset is available; otherwise, `false`.

## Overview

The `isAvailable()` method is crucial for ensuring a high-quality user experience. It ensures that only assets that can be correctly rendered on the user's specific OS version and hardware are displayed in the picker.

### Dynamic Filtering

When loading assets, the ``SymbolPicker/SPDataManager`` uses `isAvailable()` to filter out any assets that are not yet supported. This prevents the user from selecting or even seeing assets that would result in a missing glyph (often represented as a "tofu" block).

### Implementation Details

Different asset types have different criteria for availability:
- **SPSymbol**: For symbols, `isAvailable()` typically checks if a `UIImage` or `NSImage` can be successfully initialized using the system's symbol name. This is an efficient way to check for support across different SF Symbol versions.
- **SPEmoji**: For emojis, availability checking is more complex. It involves:
  - Checking the minimum OS version required for the Unicode version of the emoji.
  - Performing a CoreText rendering check to confirm that the specific glyph can be drawn by the system font (e.g., `AppleColorEmoji`).

### UI Impact

By including `isAvailable()` in the `SPDataAsset` protocol, the package can provide a consistent and reliable picker interface across a wide range of devices and operating system versions.
