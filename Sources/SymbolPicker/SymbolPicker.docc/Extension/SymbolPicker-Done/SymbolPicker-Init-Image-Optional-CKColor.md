# ``SymbolPicker/SymbolPicker/init(image:ckColor:configuration:)-(Binding<SPImage?>,_,_)``

@Metadata {
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "16.0")
    @Available(macOS, introduced: "14.0")
    @Available(visionOS, introduced: "26.0")
    @Available(swift, introduced: "6.0")
    @Available(Xcode, introduced: "15.0")
    @DocumentationExtension(mergeBehavior: override)
}

@Options {
    @AutomaticSeeAlso(disabled)
    @AutomaticArticleSubheading(disabled)
}

Creates a picker for an optional custom image and a ColorKit color.

## Overview

This initializer binds the picker to an optional image and a `CKColor`. It synchronizes the selection state with your source of truth.

### Parameters

- **image**: A binding to the optional ``SymbolPicker/SPImage`` object.
- **ckColor**: A binding to a `CKColor` for the selection tint.
- **configuration**: The layout and style settings for the picker.

### Details

This version uses `CKColor` from ColorKit, making it ideal for apps that need platform-agnostic color management across iOS and macOS.
