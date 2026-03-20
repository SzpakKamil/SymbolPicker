# ``SymbolPicker/SPSelectionView/init(selection:)``

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

Initializes a new selection view with a provided selection model.

## Overview

The `init(selection:)` initializer creates a dynamic rendering component that resolves to the appropriate asset view based on the provided selection.

### Parameter Configuration

- **`selection`**: An optional ``SymbolPicker/SPSelection`` object of a specific asset type. If `nil`, the view renders as an `EmptyView`.

### Initialization Process

Upon initialization, the view simply stores the optional ``SymbolPicker/SPSelection`` model. The dynamic resolution of the underlying asset type (e.g., ``SymbolPicker/SPSymbol``, ``SymbolPicker/SPEmoji``, or ``SymbolPicker/SPImage``) and the mapping to its corresponding view happens during the body resolution.
