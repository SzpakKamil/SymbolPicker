//
//  SPPopoverWrapper.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 18/02/2026.
//

import SwiftUI

#if os(iOS)
import UIKit

struct SPPopoverWrapper<Content: View>: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    let arrowEdge: Edge
    let content: () -> Content

    func makeUIViewController(context: Context) -> UIViewController {
        let controller = UIViewController()
        controller.view.backgroundColor = .clear
        return controller
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if isPresented {
            context.coordinator.present(from: uiViewController, content: content(), arrowEdge: arrowEdge)
        } else {
            context.coordinator.dismiss(from: uiViewController)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(isPresented: $isPresented)
    }

    class Coordinator: NSObject, UIPopoverPresentationControllerDelegate {
        @Binding var isPresented: Bool
        private var hostingController: UIViewController?

        init(isPresented: Binding<Bool>) {
            self._isPresented = isPresented
        }

        func present<V: View>(from parent: UIViewController, content: V, arrowEdge: Edge) {
            // If already presenting this specific controller, update its content but don't re-present
            if let hc = hostingController as? UIHostingController<V>, parent.presentedViewController == hc {
                hc.rootView = content
                
                // Update size if content changes
                let windowSize = parent.view.window?.bounds.size ?? UIScreen.main.bounds.size
                let maxWidth = windowSize.width * 0.9
                let maxHeight = windowSize.height * 0.9
                let idealSize = hc.sizeThatFits(in: .zero)
                let finalWidth = min(max(idealSize.width, 100), maxWidth)
                let finalHeight = min(max(idealSize.height, 100), maxHeight)
                hc.preferredContentSize = CGSize(width: finalWidth, height: finalHeight)
                return
            }

            // If the parent is presenting something else that isn't our controller, dismiss it first
            if let presented = parent.presentedViewController, presented != hostingController {
                presented.dismiss(animated: false)
            }

            let hc = UIHostingController(rootView: content)
            hc.view.backgroundColor = .clear
            hc.modalPresentationStyle = .popover
            
            // Determine sizing constraints
            let windowSize = parent.view.window?.bounds.size ?? UIScreen.main.bounds.size
            let maxWidth = windowSize.width * 0.9
            let maxHeight = windowSize.height * 0.9
            
            // Get the ideal size of the content
            let idealSize = hc.sizeThatFits(in: .zero)
            
            // Apply logic: Minimum size (100x100), capped by window size
            let finalWidth = min(max(idealSize.width, 100), maxWidth)
            let finalHeight = min(max(idealSize.height, 100), maxHeight)
            
            hc.preferredContentSize = CGSize(width: finalWidth, height: finalHeight)
            
            if let popover = hc.popoverPresentationController {
                popover.sourceView = parent.view
                popover.sourceRect = CGRect(x: parent.view.bounds.midX, y: parent.view.bounds.midY, width: 0, height: 0)
                popover.delegate = self
                
                if arrowEdge == .top || arrowEdge == .bottom {
                    popover.permittedArrowDirections = [.up, .down]
                } else {
                    popover.permittedArrowDirections = [.left, .right]
                }
            }
            
            self.hostingController = hc
            parent.present(hc, animated: true)
        }

        func dismiss(from parent: UIViewController) {
            guard let hc = hostingController, parent.presentedViewController == hc else {
                return
            }
            
            if !hc.isBeingDismissed {
                hc.dismiss(animated: true) {
                    self.hostingController = nil
                }
            }
        }

        func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
            self.isPresented = false
            self.hostingController = nil
        }

        func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
            return .none
        }

        func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
            return .none
        }
    }
}

public extension View {
    @ViewBuilder
    func spPopover<Content: View>(isPresented: Binding<Bool>, arrowEdge: Edge = .bottom, @ViewBuilder content: @escaping () -> Content) -> some View {
        #if os(iOS)
        self.background(
            SPPopoverWrapper(isPresented: isPresented, arrowEdge: arrowEdge, content: content)
        )
        #else
        self.popover(isPresented: isPresented, attachmentAnchor: .rect(.bounds), arrowEdge: arrowEdge, content: content)
        #endif
    }
}
#elseif !os(watchOS) && !os(tvOS)
public extension View {
    @ViewBuilder
    func spPopover<Content: View>(isPresented: Binding<Bool>, arrowEdge: Edge = .bottom, @ViewBuilder content: @escaping () -> Content) -> some View {
        self.popover(isPresented: isPresented, attachmentAnchor: .rect(.bounds), arrowEdge: arrowEdge, content: content)
    }
}
#endif
