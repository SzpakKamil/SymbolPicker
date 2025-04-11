//
//  SwiftUIView.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 11/04/2025.
//

import SwiftUI

#if !os(macOS)

struct SearchBar: View{
    @Binding var text: String
    var prompt: String
    var onSearchButtonClicked: () -> Void
    
    var body: some View{
        if #available(iOS 15.0, macOS 12.0, visionOS 1.0, *){
            SearchBarNew(text: $text, prompt: prompt, onSearchButtonClicked: onSearchButtonClicked)
        }else{
            SearchBarOld(text: $text, prompt: prompt, onSearchButtonClicked: onSearchButtonClicked)
        }
    }
    init(text: Binding<String>, prompt: String = "Search", onSearchButtonClicked: @escaping () -> Void = {}) {
        self._text = text
        self.prompt = prompt
        self.onSearchButtonClicked = onSearchButtonClicked
    }
}

@available(macOS 11.0, iOS 14.0, *)
@available(macOS, deprecated: 12.0, message: "Use the newer initializer available in macOS 12.0+ SearchBarNew(text: Binding<String>, prompt: String, onSearchButtonClicked: @escaping () -> Void)")
@available(iOS, deprecated: 15.0, message: "Use the newer initializer available in macOS 12.0+ SearchBarNew(text: Binding<String>, prompt: String, onSearchButtonClicked: @escaping () -> Void)")
@available(visionOS, deprecated: 1.0, message: "Use the newer initializer available in visionOS 1.0+ SearchBarNew(text: Binding<String>, prompt: String, onSearchButtonClicked: @escaping () -> Void)")
struct SearchBarOld: View {
    @Environment(\.sizeCategory) var sizeCategory
    @Binding var text: String
    var prompt: String
    var onSearchButtonClicked: () -> Void
    
    var height: CGFloat{
        switch sizeCategory{
        case .extraSmall: 40
        case .small: 45
        case .medium: 48
        case .large: 50
        case .extraLarge: 52
        case .extraExtraLarge: 55
        case .extraExtraExtraLarge: 60
        case .accessibilityMedium: 68
        case .accessibilityLarge: 75
        case .accessibilityExtraLarge: 90
        case .accessibilityExtraExtraLarge: 100
        case .accessibilityExtraExtraExtraLarge: 115
        @unknown default: 50
        }
    }
    var body: some View {
        InternalSearchBar(text: $text, prompt: prompt, onSearchButtonClicked: onSearchButtonClicked)
            .frame(height: height)
            .clipped()
    }
    
    init(text: Binding<String>, prompt: String = "Search", onSearchButtonClicked: @escaping () -> Void = {}) {
        self._text = text
        self.prompt = prompt
        self.onSearchButtonClicked = onSearchButtonClicked
    }
}

@available(macOS 12.0, iOS 15.0, *)
struct SearchBarNew: View {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    @Binding var text: String
    var prompt: String
    var onSearchButtonClicked: () -> Void
    
    var height: CGFloat{
        switch dynamicTypeSize{
        case .xSmall: 40
        case .small: 45
        case .medium: 48
        case .large: 50
        case .xLarge: 52
        case .xxLarge: 55
        case .xxxLarge: 60
        case .accessibility1: 68
        case .accessibility2: 75
        case .accessibility3: 90
        case .accessibility4: 100
        case .accessibility5: 115
        @unknown default: 50
        }
    }
    
    var body: some View {
        InternalSearchBar(text: $text, prompt: prompt, onSearchButtonClicked: onSearchButtonClicked)
            .frame(height: height)
            .clipped()
    }
    
    init(text: Binding<String>, prompt: String = "Search", onSearchButtonClicked: @escaping () -> Void = {}) {
        self._text = text
        self.prompt = prompt
        self.onSearchButtonClicked = onSearchButtonClicked
    }
}

struct InternalSearchBar: UIViewRepresentable {
    @Binding var text: String
    let prompt: String
    var onSearchButtonClicked: () -> Void

    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = CircularSearchBar()
        searchBar.placeholder = prompt
        searchBar.delegate = context.coordinator
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }

    func makeCoordinator() -> SearchBarCoordinator { SearchBarCoordinator(self) }
}

class SearchBarCoordinator: NSObject, UISearchBarDelegate {
    var parent: InternalSearchBar

    init(_ searchBar: InternalSearchBar) {
        self.parent = searchBar
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        parent.text = searchText
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        parent.onSearchButtonClicked()
        searchBar.resignFirstResponder()
    }
}

class CircularSearchBar: UISearchBar {
    private var didObserveSubviews = false
    private let desiredCornerRadius = 22.0
    private var observedLayers = NSHashTable<CALayer>.weakObjects()
    
    override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
     
        // Adding to window
        guard !didObserveSubviews else { return }
        didObserveSubviews = true
        observeSubviews(self)
    }
        
    func observeSubviews(_ view: UIView) {
        if !observedLayers.contains(view.layer) {
            view.layer.addObserver(self, forKeyPath: "cornerRadius", options: [.new], context: nil)
            observedLayers.add(view.layer)
        }
        
        view.subviews.forEach { observeSubviews($0) }
    }
        
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard keyPath == "cornerRadius" else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
            return
        }
        
        guard let layer = object as? CALayer else { return }
        guard layer.cornerRadius != desiredCornerRadius else { return }
        
        layer.cornerRadius = desiredCornerRadius
    }
}
#endif
struct SwiftUIView: View {
    var body: some View {
        SearchBar(text: .constant("")) {
            
        }
    }
}

#Preview {
    SwiftUIView()
}
