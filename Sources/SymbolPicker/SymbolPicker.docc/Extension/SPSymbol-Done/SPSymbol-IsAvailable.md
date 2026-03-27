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

Verifies if the device supports the symbol.

## Overview

The `isAvailable()` method prevents SymbolPicker from showing SF Symbols introduced in OS versions newer than the one currently running.

### Verification

The method uses platform-native APIs to check availability:
- **iOS, tvOS, and watchOS**: Attempts to build a `UIImage` with the system name.
- **macOS**: Attempts to build an `NSImage` with the symbol name.

### Status

A symbol is available only if the system resolves both the `filledName` and `notFilled` variants. This ensures the selection remains valid if you switch variants while the picker is open.

### Impact

SymbolPicker uses this method early in the loading process to exclude missing icons. This maintains a reliable interface across every supported platform.
