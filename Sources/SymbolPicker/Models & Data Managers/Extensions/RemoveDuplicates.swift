//
//  RemoveDuplicates.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 23/02/2026.
//

import SwiftUI

@_documentation(visibility: internal)
extension Array where Element: Equatable{
    func removeDuplicates(where predicate: (Element, Element) -> Bool = { $0 == $1}) -> [Element] {
        var result: [Element] = []
        for value in self {
            if !result.contains(where: { predicate(value, $0) }) {
                result.append(value)
            }
        }
        return result
    }
}
