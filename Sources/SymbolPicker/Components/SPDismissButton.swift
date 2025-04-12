//
//  SPDismissButton.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 12/04/2025.
//

import SwiftUI

#if !os(macOS)
struct SPDismissButton: View {
    let pickerData: SymbolPickerData
    var body: some View {
        if #available(iOS 15.0, macOS 12.0, visionOS 1.0, *){
            SPDismissButtonNew()
        }else{
            SPDismissButtonOld(pickerData: pickerData)
        }
    }
}

@available(iOS 15.0, macOS 12.0, visionOS 1.0, *)
struct SPDismissButtonNew: View {
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
}

struct SPDismissButtonOld: View {
    let pickerData: SymbolPickerData

    var usePopover: Bool{
        if #available(iOS 17.0, *) {
            UIDevice.current.userInterfaceIdiom == .pad || UIDevice.current.userInterfaceIdiom == .vision
        } else {
            UIDevice.current.userInterfaceIdiom == .pad
        }
    }
    
    var body: some View {
        Button("OK"){
            pickerData.isPresented.wrappedValue = false
        }
        .opacity(usePopover ? 0 : 1)
        .allowsHitTesting(!usePopover)
    }
}
#endif
