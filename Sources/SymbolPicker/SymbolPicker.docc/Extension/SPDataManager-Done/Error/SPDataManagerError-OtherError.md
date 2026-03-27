# ``SymbolPicker/SPDataManager/Error/otherError(error:)``

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

A catch-all for unexpected failures.

- Parameter error: The underlying caught `Swift.Error`.

## Overview

The `otherError` case captures non-specific failures that fall outside defined categories. It ensures the system remains robust during:
- Unexpected disk or permission issues.
- Runtime exceptions in the `SPDataManager` actor.
- Errors from custom asset implementations.
