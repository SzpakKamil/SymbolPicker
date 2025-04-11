//
//  IfModifier.swift
//  SymbolPicker
//
//  Created by KamilSzpak on 11/04/2025.
//

import SwiftUI

public extension View {
    func `if`<ModifiedContent: View>(
    @ViewBuilder body: (_ content: Self) -> ModifiedContent
  ) -> ModifiedContent {
    body(self)
  }
}
