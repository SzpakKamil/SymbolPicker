//
//  SPPagePicker-Configuration.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 22/02/2026.
//

import Foundation

extension SPPagePicker{
    struct Configuration{
        var supportedTypes: [SPPageType]
        
        init(){
            self.supportedTypes = SPPageType.allCases
        }
    }
}
