//
//  SPDismissButton.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 12/04/2025.
//

import SwiftUI

#if !os(macOS)
@_documentation(visibility: internal)
struct SPDismissButton: View, @MainActor Equatable {
    @Binding var isPresented: Bool
    var body: some View {
        if #available(iOS 15.0, macOS 12.0, visionOS 1.0, *){
            SPDismissButtonNew()
        }else{
            SPDismissButtonOld(isPresented: $isPresented)
        }
    }
    
    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
    }
    
    @MainActor static func ==(lhs: SPDismissButton, rhs: SPDismissButton) -> Bool{
        true
    }
}

@_documentation(visibility: internal)
@available(iOS 15.0, macOS 12.0, visionOS 1.0, *)
struct SPDismissButtonNew: View, @MainActor Equatable {
    @Environment(\.dismiss) var dismiss
    var usePopover: Bool{
        if #available(iOS 17.0, *) {
            UIDevice.current.userInterfaceIdiom == .pad || UIDevice.current.userInterfaceIdiom == .vision
        } else {
            UIDevice.current.userInterfaceIdiom == .pad
        }
    }
    
    var body: some View {
        Button{
            dismiss()
        }label:{
            Image(systemName: "xmark.circle.fill")
                .font(.title3)
                .foregroundStyle(.secondary)
                .tint(.primary)
                .symbolRenderingMode(.hierarchical)
        }
        .opacity(usePopover ? 0 : 1)
        .allowsHitTesting(!usePopover)
    }
    
    @MainActor static func ==(lhs: SPDismissButtonNew, rhs: SPDismissButtonNew) -> Bool{
        true
    }
}

@_documentation(visibility: internal)
struct SPDismissButtonOld: View, @MainActor Equatable {
    @Binding var isPresented: Bool

    var usePopover: Bool{
        if #available(iOS 17.0, *) {
            UIDevice.current.userInterfaceIdiom == .pad || UIDevice.current.userInterfaceIdiom == .vision
        } else {
            UIDevice.current.userInterfaceIdiom == .pad
        }
    }
    
    var body: some View {
        Button("OK"){
            isPresented = false
        }
        .opacity(usePopover ? 0 : 1)
        .allowsHitTesting(!usePopover)
    }
    
    @MainActor static func ==(lhs: SPDismissButtonOld, rhs: SPDismissButtonOld) -> Bool{
        true
    }
}
#endif
