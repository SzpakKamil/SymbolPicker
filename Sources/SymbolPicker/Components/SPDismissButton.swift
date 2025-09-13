//
//  SPDismissButton.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 12/04/2025.
//

import SwiftUI

#if compiler(>=6.2)
#if !os(macOS)
@_documentation(visibility: internal)
struct SPDismissButton: View, @MainActor Equatable {
    var action: () -> Void
    
    var body: some View {
        if #available(iOS 15.0, macOS 12.0, visionOS 1.0, *){
            SPDismissButtonNew(action)
        }else{
            SPDismissButtonOld(action)
        }
    }
    
    init(action: @escaping () -> Void) {
        self.action = action
    }
    
    @MainActor static func ==(lhs: SPDismissButton, rhs: SPDismissButton) -> Bool{
        true
    }
}

@_documentation(visibility: internal)
@available(iOS 15.0, macOS 12.0, visionOS 1.0, *)
struct SPDismissButtonNew: View, @MainActor Equatable {
    @Environment(\.dismiss) var dismiss
    var action: () -> Void
    var usePopover: Bool{
        if #available(iOS 17.0, *) {
            UIDevice.current.userInterfaceIdiom == .pad || UIDevice.current.userInterfaceIdiom == .vision
        } else {
            UIDevice.current.userInterfaceIdiom == .pad
        }
    }
    
    var body: some View {
        Button{
            action()
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
    init(_ action: @escaping () -> Void) {
        self.action = action
    }
    @MainActor static func ==(lhs: SPDismissButtonNew, rhs: SPDismissButtonNew) -> Bool{
        true
    }
}

@_documentation(visibility: internal)
struct SPDismissButtonOld: View, @MainActor Equatable{
    var action: () -> Void
    var usePopover: Bool{
        if #available(iOS 17.0, *) {
            UIDevice.current.userInterfaceIdiom == .pad || UIDevice.current.userInterfaceIdiom == .vision
        } else {
            UIDevice.current.userInterfaceIdiom == .pad
        }
    }
    
    var body: some View {
        Button(SymbolPickerTranslation.close.value){
            action()
        }
        .opacity(usePopover ? 0 : 1)
        .allowsHitTesting(!usePopover)
        .accessibilityElement()
        .accessibilityLabel(SymbolPickerTranslation.close.value)
        .accessibilityAddTraits(.isButton)
    }
    init(_ action: @escaping () -> Void) {
        self.action = action
    }
    @MainActor static func ==(lhs: SPDismissButtonOld, rhs: SPDismissButtonOld) -> Bool{
        true
    }
}
#endif
#else
#if !os(macOS)
@_documentation(visibility: internal)
struct SPDismissButton: View, Equatable {
    var action: () -> Void
    
    var body: some View {
        if #available(iOS 15.0, macOS 12.0, visionOS 1.0, *){
            SPDismissButtonNew(action)
        }else{
            SPDismissButtonOld(action)
        }
    }
    
    init(action: @escaping () -> Void) {
        self.action = action
    }
    
    static func ==(lhs: SPDismissButton, rhs: SPDismissButton) -> Bool{
        true
    }
}

@_documentation(visibility: internal)
@available(iOS 15.0, macOS 12.0, visionOS 1.0, *)
struct SPDismissButtonNew: View, Equatable {
    @Environment(\.dismiss) var dismiss
    var action: () -> Void
    var usePopover: Bool{
        if #available(iOS 17.0, *) {
            UIDevice.current.userInterfaceIdiom == .pad || UIDevice.current.userInterfaceIdiom == .vision
        } else {
            UIDevice.current.userInterfaceIdiom == .pad
        }
    }
    
    var body: some View {
        Button{
            action()
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
        .accessibilityElement()
        .accessibilityLabel(SymbolPickerTranslation.close.value)
        .accessibilityAddTraits(.isButton)
    }
    init(_ action: @escaping () -> Void) {
        self.action = action
    }
    static func ==(lhs: SPDismissButtonNew, rhs: SPDismissButtonNew) -> Bool{
        true
    }
}

@_documentation(visibility: internal)
struct SPDismissButtonOld: View, Equatable{
    var action: () -> Void
    var usePopover: Bool{
        if #available(iOS 17.0, *) {
            UIDevice.current.userInterfaceIdiom == .pad || UIDevice.current.userInterfaceIdiom == .vision
        } else {
            UIDevice.current.userInterfaceIdiom == .pad
        }
    }
    
    var body: some View {
        Button(SymbolPickerTranslation.close.value){
            action()
        }
        .opacity(usePopover ? 0 : 1)
        .allowsHitTesting(!usePopover)
        .accessibilityElement()
        .accessibilityLabel(SymbolPickerTranslation.close.value)
        .accessibilityAddTraits(.isButton)
    }
    init(_ action: @escaping () -> Void) {
        self.action = action
    }
    static func ==(lhs: SPDismissButtonOld, rhs: SPDismissButtonOld) -> Bool{
        true
    }
}
#endif
#endif
