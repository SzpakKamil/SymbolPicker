//
//  SPOptionList-Configuration.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 22/02/2026.
//

import SwiftUI

extension SPOptionList{
    struct InsetedView{
        let view: AnyView
        let inset: SPViewPlacementType
    }
    struct Configuration{
        var topView: InsetedView?
        var bottomView: InsetedView?
        init(){}
    }
}
