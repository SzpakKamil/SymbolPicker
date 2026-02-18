//
//  SPSystemColorPicker.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 15/02/2026.
//

import SwiftUI
import ColorKit

public struct SPSystemColorPicker: View {
    @Binding private var color: Color

    public var body: some View {
        PlatformColorPicker(color: $color)
    }

    public init(color: Binding<Color>) {
        self._color = color
    }

    public init(selectedColor: Binding<CKColor>) {
        self._color = selectedColor.asColor
    }
}

#if os(iOS) || os(tvOS) || os(visionOS)
import UIKit

private struct PlatformColorPicker: UIViewControllerRepresentable {
    @Binding var color: Color

    func makeUIViewController(context: Context) -> UIColorPickerViewController {
        let picker = UIColorPickerViewController()
        picker.supportsAlpha = false
        picker.selectedColor = UIColor(color)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIColorPickerViewController, context: Context) {
        let uiColor = UIColor(color)
        if uiViewController.selectedColor != uiColor {
            uiViewController.selectedColor = uiColor
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(color: $color)
    }

    final class Coordinator: NSObject, UIColorPickerViewControllerDelegate {
        private var color: Binding<Color>

        init(color: Binding<Color>) {
            self.color = color
        }

        func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
            color.wrappedValue = Color(uiColor: viewController.selectedColor)
        }

        func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
            color.wrappedValue = Color(uiColor: viewController.selectedColor)
        }
    }
}
#elseif os(macOS)
import AppKit

private struct PlatformColorPicker: NSViewRepresentable {
    @Binding var color: Color

    func makeNSView(context: Context) -> NSColorWell {
        let well = NSColorWell()
        well.showsAlpha = false
        well.isBordered = false
        well.color = NSColor(color)
        well.target = context.coordinator
        well.action = #selector(Coordinator.colorChanged)
        return well
    }

    func updateNSView(_ nsView: NSColorWell, context: Context) {
        let nsColor = NSColor(color)
        if nsView.color != nsColor {
            nsView.color = nsColor
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(color: $color)
    }

    final class Coordinator: NSObject {
        private var color: Binding<Color>

        init(color: Binding<Color>) {
            self.color = color
        }

        @objc func colorChanged(_ sender: NSColorWell) {
            color.wrappedValue = Color(nsColor: sender.color)
        }
    }
}
#endif
