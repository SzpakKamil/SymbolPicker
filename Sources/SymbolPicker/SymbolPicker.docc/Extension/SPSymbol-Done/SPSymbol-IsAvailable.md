# ``SymbolPicker/SPSymbol/isAvailable()``

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

Performs a runtime check to verify if the symbol is supported on the current device.

## Overview

The `isAvailable()` method is a critical safety feature that prevents the application from attempting to render SF Symbols that were introduced in later versions of the operating system than the one currently running.

### Dynamic Verification

Because the set of available SF Symbols is tied to the OS version, a hardcoded list is not sufficient. Instead, this method uses platform-native APIs:
- **iOS/iPadOS/tvOS/watchOS**: Attempts to initialize a `UIImage` using the `systemName` initializer.
- **macOS**: Attempts to initialize an `NSImage` using the `systemSymbolName:accessibilityDescription:` initializer.

### Combined Status

A symbol is only considered available if both its `filledName` and its `notFilled` variants are successfully resolved by the system. This ensures that a user's selection remains consistent even if they switch variants while the picker is open.

### Filtering Impact

This method is extensively used by the ``SymbolPicker/SPDataManager`` during the asset loading process. By excluding unavailable symbols early, the picker avoids displaying broken or missing glyphs, maintaining a polished user interface across all supported platforms.
