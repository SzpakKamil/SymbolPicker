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
    let prompt: String
    let useRounded: Bool
    var onSearchButtonClicked: () -> Void
    
    var body: some View{
        InternalSearchBar(text: $text, prompt: prompt, useRounded: useRounded, onSearchButtonClicked: onSearchButtonClicked)
    }
    #if os(iOS)
    init(text: Binding<String>, prompt: String = "Search", onSearchButtonClicked: @escaping () -> Void = {}) {
        self._text = text
        self.prompt = prompt
        self.onSearchButtonClicked = onSearchButtonClicked
        self.useRounded = false
    }
    #else
    init(text: Binding<String>, prompt: String = "Search", useRounded: Bool = false, onSearchButtonClicked: @escaping () -> Void = {}) {
        self._text = text
        self.prompt = prompt
        self.onSearchButtonClicked = onSearchButtonClicked
        self.useRounded = useRounded
    }
    #endif
}

struct InternalSearchBar: UIViewRepresentable {
    @Binding var text: String
    let prompt: String
    let useRounded: Bool
    var onSearchButtonClicked: () -> Void

    func makeUIView(context: Context) -> UISearchBar {
        if useRounded{
            let searchBar = CircularSearchBar()
            searchBar.placeholder = prompt
            searchBar.delegate = context.coordinator
            return searchBar
        }else{
            let searchBar = UISearchBar()
            searchBar.placeholder = prompt
            searchBar.delegate = context.coordinator
            return searchBar
        }


    }

    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
        uiView.searchBarStyle = .minimal
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
        ZStack{
            SearchBar(text: .constant(""))
        }
        
    }
}

#Preview {
    SwiftUIView()
}
