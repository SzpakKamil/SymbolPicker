# ``SwiftUICore/View/``

View extensions and modifiers to present a symbol, emoji, or image picker.

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

A collection of view modifiers for the `View` protocol that enable seamless integration of the ``SymbolPicker/SymbolPicker`` into any SwiftUI view hierarchy. 

The primary entry point is the `symbolPicker` modifier, which is overloaded to support various data types and selection patterns. Whether you are working with SF Symbols, emojis, or custom images, these modifiers provide a standard interface for presentation and state management.

Each modifier manages the presentation state via a binding and allows for fine-grained control through an optional configuration object.

## Topics

### Generic Selection
The most flexible way to present a picker using a generic ``SPSelection`` binding.

- ``SwiftUICore/View/symbolPicker(isPresented:selection:configuration:)-(_,Binding<SPSelection<DataAsset>>,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:selection:configuration:)-(_,Binding<SPSelection<DataAsset>?>,_)``

### SF Symbol Presentation
Present a picker for standard ``SPSymbol``, with support for various color binding types.

- ``SwiftUICore/View/symbolPicker(isPresented:systemImage:configuration:)-(_,Binding<String>,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:systemImage:configuration:)-(_,Binding<String?>,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:systemImage:ckColor:configuration:)-(_,Binding<String>,_,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:systemImage:ckColor:configuration:)-(_,Binding<String?>,_,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:systemImage:color:configuration:)-(_,Binding<String>,_,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:systemImage:color:configuration:)-(_,Binding<String?>,_,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:systemImage:colorValues:configuration:)-(_,Binding<String>,_,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:systemImage:colorValues:configuration:)-(_,Binding<String?>,_,_)``

### Emoji Presentation
Present a picker for ``SPEmoji``, with support for various color binding types.

- ``SwiftUICore/View/symbolPicker(isPresented:emoji:configuration:)-(_,Binding<SPEmoji>,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:emoji:configuration:)-(_,Binding<SPEmoji?>,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:emoji:ckColor:configuration:)-(_,Binding<SPEmoji>,_,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:emoji:ckColor:configuration:)-(_,Binding<SPEmoji?>,_,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:emoji:color:configuration:)-(_,Binding<SPEmoji>,_,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:emoji:color:configuration:)-(_,Binding<SPEmoji?>,_,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:emoji:colorValues:configuration:)-(_,Binding<SPEmoji>,_,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:emoji:colorValues:configuration:)-(_,Binding<SPEmoji?>,_,_)``

### Custom Image Presentation
Present a picker specifically for user-selected photos from the library (``SymbolPicker/SPImage``).

- ``SwiftUICore/View/symbolPicker(isPresented:image:configuration:)-(_,Binding<SPImage>,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:image:configuration:)-(_,Binding<SPImage?>,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:image:ckColor:configuration:)-(_,Binding<SPImage>,_,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:image:ckColor:configuration:)-(_,Binding<SPImage?>,_,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:image:color:configuration:)-(_,Binding<SPImage>,_,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:image:color:configuration:)-(_,Binding<SPImage?>,_,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:image:colorValues:configuration:)-(_,Binding<SPImage>,_,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:image:colorValues:configuration:)-(_,Binding<SPImage?>,_,_)``
