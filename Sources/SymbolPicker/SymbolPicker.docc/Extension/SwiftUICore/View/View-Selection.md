# ``SwiftUICore/View/symbolPicker(isPresented:selection:configuration:)-(_,Binding<SPSelection<DataAsset>>,_)``


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
    @AutomaticArticleSubheading(disabled)
}

## Overview
Presents a symbol picker that allows the user to select a symbol, emoji, or image, which are synchronized with the provided generic selection binding. This is the most flexible overload, supporting any data asset type conforming to `SPDataAsset`.

## Example Usage
```swift
struct MyView: View {
    @State private var isPresented = false
    @State private var selection = SPSelection<SPSymbol>(systemName: "star.fill")

    var body: some View {
        Button("Pick Item") {
            isPresented = true
        }
        .symbolPicker(
            isPresented: $isPresented,
            selection: $selection
        )
    }
}
```
