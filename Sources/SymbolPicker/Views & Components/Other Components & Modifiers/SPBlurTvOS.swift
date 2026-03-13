//
//  SPBlurTvOS.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI
import ColorKit

#if os(tvOS)
struct SPBlurTvOS: View{
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        let lightColor = CKColor(hexString: "#DDD").color
        let darkColor = CKColor(hexString: "#111").color
        let color = colorScheme == .dark ? darkColor : lightColor
        return Rectangle()
            .fill(LinearGradient(colors: [.clear, color.opacity(1), color], startPoint: .bottom, endPoint: .top))
            .offset(y: -7)
            .scaleEffect(1.2)
    }
}
#endif
