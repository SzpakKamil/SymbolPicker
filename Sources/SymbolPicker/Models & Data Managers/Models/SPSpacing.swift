//
//  SPSpacing.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 21/02/2026.
//

import SwiftUI


struct ComponentSpacing: Sendable{
    let spacings: [DynamicTypeSize: CGFloat]
    let osScaleFactors: [SPSupportedPlatforms: CGFloat]
    
    init(spacings: [DynamicTypeSize : CGFloat], osScaleFactors: [SPSupportedPlatforms : CGFloat]) {
        self.spacings = spacings
        self.osScaleFactors = osScaleFactors
    }
}
public struct SPSpacing: Sendable{
    let colorPicker: ComponentSpacing
    
    init(){
        self.colorPicker = .init(
            spacings:[
                DynamicTypeSize.xSmall          : 45,
                DynamicTypeSize.small           : 45,
                DynamicTypeSize.medium          : 45,
                DynamicTypeSize.large           : 50,
                DynamicTypeSize.xLarge          : 55,
                DynamicTypeSize.xxLarge         : 60,
                DynamicTypeSize.xxxLarge        : 65,
                DynamicTypeSize.accessibility1  : 70,
                DynamicTypeSize.accessibility2  : 75,
                DynamicTypeSize.accessibility3  : 80,
                DynamicTypeSize.accessibility4  : 85,
                DynamicTypeSize.accessibility5  : 90,
            ],
            osScaleFactors: [
                .iOS        : 1,
                .macOS      : 0.4,
                .tvOS       : 1.4,
                .visionOS   : 1,
                .watchOS    : 1
            ]
        )
    }
    
    static func getSize(in typeSize: DynamicTypeSize, for componentSpacing: ComponentSpacing, adjustedForPlatform: Bool = true ) -> CGFloat{
        let size = (componentSpacing.spacings[typeSize] ?? 0)
        let scaleFactor = (componentSpacing.osScaleFactors[SPSupportedPlatforms.currentPlatform] ?? 1)
        return adjustedForPlatform ? size * scaleFactor : size
    }
}


enum SPSupportedPlatforms: Hashable{
    case iOS, macOS, tvOS, watchOS, visionOS
    
    static var currentPlatform: SPSupportedPlatforms {
        #if os(iOS)
        return .iOS
        #elseif os(macOS)
        return .macOS
        #elseif os(tvOS)
        return .tvOS
        #elseif os(watchOS)
        return .watchOS
        #else
        return .visionOS
        #endif
    }
}
