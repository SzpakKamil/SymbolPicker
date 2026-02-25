//
//  SPSpacing.swift
//  SymbolPicker
//
//  Created by Kamil Szpak on 21/02/2026.
//

import SwiftUI


public struct SPComponentSpacing: Sendable{
    public let spacings: [DynamicTypeSize: CGFloat]
    public let osScaleFactors: [SPSupportedPlatforms: CGFloat]
    public let horizontalPadding: [SPSupportedPlatforms: CGFloat]
    public let verticalPadding: [SPSupportedPlatforms: CGFloat?]
    
    public init(spacings: [DynamicTypeSize : CGFloat], osScaleFactors: [SPSupportedPlatforms : CGFloat], horizontalPadding: [SPSupportedPlatforms : CGFloat], verticalPadding: [SPSupportedPlatforms : CGFloat]) {
        self.spacings = spacings
        self.osScaleFactors = osScaleFactors
        self.horizontalPadding = horizontalPadding
        self.verticalPadding = verticalPadding
    }
}
public struct SPSpacing: Sendable{
    public let colorPicker: SPComponentSpacing
    public let optionList: SPComponentSpacing
    
    public init(colorPicker: SPComponentSpacing, optionList: SPComponentSpacing) {
        self.colorPicker = colorPicker
        self.optionList = optionList
    }
    public init(){
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
                .iOS()          : 1,
                .macOS()        : 0.4,
                .tvOS()         : 1.4,
                .visionOS()     : 1,
                .watchOS()      : 1
            ],
            horizontalPadding: [:],
            verticalPadding: [:]
        )
        self.optionList = .init(
            spacings: [
                DynamicTypeSize.xSmall          : 18,
                DynamicTypeSize.small           : 20,
                DynamicTypeSize.medium          : 22,
                DynamicTypeSize.large           : 24,
                DynamicTypeSize.xLarge          : 26,
                DynamicTypeSize.xxLarge         : 28,
                DynamicTypeSize.xxxLarge        : 30,
                DynamicTypeSize.accessibility1  : 32,
                DynamicTypeSize.accessibility2  : 34,
                DynamicTypeSize.accessibility3  : 36,
                DynamicTypeSize.accessibility4  : 38,
                DynamicTypeSize.accessibility5  : 40,
            ],
            osScaleFactors:  [
                .iOS()          : 1.4,
                .macOS()        : 1,
                .tvOS(26)       : 3.5,
                .tvOS()         : 4.0,
                .visionOS()     : 1.2,
                .watchOS()      : 0.85
            ],
            horizontalPadding: [
                .iOS()      : 20,
                .macOS()    : 15,
                .tvOS(26)   : 30,
                .tvOS()     : 80,
                .visionOS() : 20,
                .watchOS()  : 10,
            ],
            verticalPadding: [
                .iOS()      : 20,
                .macOS()    : 15,
                .watchOS()  : 0,
                .tvOS(26)   : 30,
                .tvOS()     : 80,
            ]
        )
        
    }
    
    static func getSize(in typeSize: DynamicTypeSize, for componentSpacing: SPComponentSpacing, adjustedForPlatform: Bool = true) -> CGFloat {
        let baseSize = componentSpacing.spacings[typeSize] ?? 0
        guard adjustedForPlatform else { return baseSize }

        let current = SPSupportedPlatforms.currentPlatform
        let currentVersion = current.majorVersion ?? 0

        let bestMatchFactor = componentSpacing.osScaleFactors
            .filter { $0.key.isSamePlatform(as: current) }
            .filter { ($0.key.majorVersion ?? 0) <= currentVersion }
            .sorted { ($0.key.majorVersion ?? 0) > ($1.key.majorVersion ?? 0) }
            .first?.value

        // Fallback to 1.0 if no platform match is found at all
        return baseSize * (bestMatchFactor ?? 1.0)
    }
    
    static func getHorizonalPadding(for componentSpacing: SPComponentSpacing) -> CGFloat? {
        let current = SPSupportedPlatforms.currentPlatform
        let currentVersion = current.majorVersion ?? 0

        let horizontalPadding = componentSpacing.horizontalPadding
            .filter { $0.key.isSamePlatform(as: current) }
            .filter { ($0.key.majorVersion ?? 0) <= currentVersion }
            .sorted { ($0.key.majorVersion ?? 0) > ($1.key.majorVersion ?? 0) }
            .first?.value

        return horizontalPadding ?? 0
    }
    
    static func getVerticalPadding(for componentSpacing: SPComponentSpacing) -> CGFloat? {
        let current = SPSupportedPlatforms.currentPlatform
        let currentVersion = current.majorVersion ?? 0

        let verticalPadding = componentSpacing.verticalPadding
            .filter { $0.key.isSamePlatform(as: current) }
            .filter { ($0.key.majorVersion ?? 0) <= currentVersion }
            .sorted { ($0.key.majorVersion ?? 0) > ($1.key.majorVersion ?? 0) }
            .first?.value

        return verticalPadding ?? 0
    }
}


