# ``SwiftUICore/View/``

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

View extensions for presenting asset pickers.

## Overview

These view modifiers integrate ``SymbolPicker/SymbolPicker`` into your SwiftUI hierarchy. 

The `symbolPicker` modifier supports various data types and selection patterns. Use it to present pickers for SF Symbols, emojis, or custom images. Each modifier uses a binding to manage visibility and a configuration object to set the layout and style.

## Topics

### Generic Selection
- ``SwiftUICore/View/symbolPicker(isPresented:selection:configuration:)-(_,Binding<SPSelection<DataAsset>>,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:selection:configuration:)-(_,Binding<SPSelection<DataAsset>?>,_)``

### SF Symbol Presentation
- ``SwiftUICore/View/symbolPicker(isPresented:systemImage:configuration:)-(_,Binding<String>,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:systemImage:configuration:)-(_,Binding<String?>,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:systemImage:ckColor:configuration:)-(_,Binding<String>,_,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:systemImage:ckColor:configuration:)-(_,Binding<String?>,_,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:systemImage:color:configuration:)-(_,Binding<String>,_,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:systemImage:color:configuration:)-(_,Binding<String?>,_,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:systemImage:colorValues:configuration:)-(_,Binding<String>,_,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:systemImage:colorValues:configuration:)-(_,Binding<String?>,_,_)``

### Emoji Presentation
- ``SwiftUICore/View/symbolPicker(isPresented:emoji:configuration:)-(_,Binding<SPEmoji>,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:emoji:configuration:)-(_,Binding<SPEmoji?>,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:emoji:ckColor:configuration:)-(_,Binding<SPEmoji>,_,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:emoji:ckColor:configuration:)-(_,Binding<SPEmoji?>,_,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:emoji:color:configuration:)-(_,Binding<SPEmoji>,_,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:emoji:color:configuration:)-(_,Binding<SPEmoji?>,_,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:emoji:colorValues:configuration:)-(_,Binding<SPEmoji>,_,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:emoji:colorValues:configuration:)-(_,Binding<SPEmoji?>,_,_)``

### Custom Image Presentation
- ``SwiftUICore/View/symbolPicker(isPresented:image:configuration:)-(_,Binding<SPImage>,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:image:configuration:)-(_,Binding<SPImage?>,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:image:ckColor:configuration:)-(_,Binding<SPImage>,_,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:image:ckColor:configuration:)-(_,Binding<SPImage?>,_,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:image:color:configuration:)-(_,Binding<SPImage>,_,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:image:color:configuration:)-(_,Binding<SPImage?>,_,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:image:colorValues:configuration:)-(_,Binding<SPImage>,_,_)``
- ``SwiftUICore/View/symbolPicker(isPresented:image:colorValues:configuration:)-(_,Binding<SPImage?>,_,_)``
