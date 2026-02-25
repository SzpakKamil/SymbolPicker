//
//  Blur.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 12/04/2025.
//

#if os(visionOS)
import SwiftUI
import UIKit
import CoreImage.CIFilterBuiltins
import QuartzCore

@_documentation(visibility: internal)
enum VariableBlurDirection {
    case blurredTopClearBottom
    case blurredBottomClearTop
}

@_documentation(visibility: internal)
struct SPBlurView: UIViewRepresentable {

    var maxBlurRadius: CGFloat = 20

    var direction: VariableBlurDirection = .blurredTopClearBottom

    var startOffset: CGFloat = 0

    func makeUIView(context: Context) -> VariableBlurUIView {
        VariableBlurUIView(maxBlurRadius: maxBlurRadius, direction: direction, startOffset: startOffset)
    }

    func updateUIView(_ uiView: VariableBlurUIView, context: Context) {
    }
}

/// credit https://github.com/jtrivedi/VariableBlurView
@_documentation(visibility: internal)
class VariableBlurUIView: UIVisualEffectView {

    init(maxBlurRadius: CGFloat = 20, direction: VariableBlurDirection = .blurredTopClearBottom, startOffset: CGFloat = 0) {
        super.init(effect: UIBlurEffect(style: .regular))

        guard let CAFilter = NSClassFromString("CAFilter")! as? NSObject.Type else {
            print("[VariableBlur] Error: Can't find CAFilter class")
            return
        }
        guard let variableBlur = CAFilter.self.perform(NSSelectorFromString("filterWithType:"), with: "variableBlur").takeUnretainedValue() as? NSObject else {
            print("[VariableBlur] Error: CAFilter can't create filterWithType: variableBlur")
            return
        }

        let gradientImage = makeGradientImage(startOffset: startOffset, direction: direction)

        variableBlur.setValue(maxBlurRadius, forKey: "inputRadius")
        variableBlur.setValue(gradientImage, forKey: "inputMaskImage")
        variableBlur.setValue(true, forKey: "inputNormalizeEdges")
        let backdropLayer = subviews.first?.layer

        backdropLayer?.filters = [variableBlur]

        for subview in subviews.dropFirst() {
            subview.alpha = 0
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open override func didMoveToWindow() {

        guard let window, let backdropLayer = subviews.first?.layer else { return }
        #if os(visionOS)
        let scale = 1.0
        #else
        let scale = window.screen.scale
        #endif
        backdropLayer.setValue(scale, forKey: "scale")
    }

    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    }

    private func makeGradientImage(width: CGFloat = 100, height: CGFloat = 100, startOffset: CGFloat, direction: VariableBlurDirection) -> CGImage { // much lower resolution might be acceptable
        let ciGradientFilter =  CIFilter.linearGradient()
        ciGradientFilter.color0 = CIColor.black
        ciGradientFilter.color1 = CIColor.clear
        ciGradientFilter.point0 = CGPoint(x: 0, y: height)
        ciGradientFilter.point1 = CGPoint(x: 0, y: startOffset * height)
        if case .blurredBottomClearTop = direction {
            ciGradientFilter.point0.y = 0
            ciGradientFilter.point1.y = height - ciGradientFilter.point1.y
        }
        return CIContext().createCGImage(ciGradientFilter.outputImage!, from: CGRect(x: 0, y: 0, width: width, height: height))!
    }
}
#endif

