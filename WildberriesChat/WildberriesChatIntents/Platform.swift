//
//  Platform.swift
//  WildberriesChatIntents
//
//  Created by Janiece Eleonour on 03.07.2024.
//

import SwiftUI
import AppIntents

enum Platform: String, CaseIterable, Identifiable, Codable, AppEnum {
    
    case allPlatforms = "All Platforms"
    case iphone = "iPhone"
    case ipad = "iPad"
    case applewatch = "Apple Watch"
    case visionPro = "Vision Pro"
    case mac = "Mac"
    case appletv = "Apple TV"
    
    var id: Self {
        return self
    }
    
    var icon: String {
        switch self {
        case .allPlatforms:
            return "apple.logo"
        case .iphone:
            return "iphone"
        case .ipad:
            return "ipad"
        case .appletv:
            return "appletv.fill"
        case .mac:
            return "macbook"
        case .applewatch:
            return "applewatch"
        case .visionPro:
            return "visionpro"
        }
    }
    
    static var typeDisplayRepresentation = TypeDisplayRepresentation(stringLiteral: "Platform")
    
    static var caseDisplayRepresentations: [Platform: DisplayRepresentation] = [
        .allPlatforms: "All Platforms",
        .iphone: "iPhone",
        .ipad: "iPad",
        .applewatch: "Apple Watch",
        .visionPro: "Vision Pro",
        .mac: "Mac",
        .appletv: "Apple TV"
    ]
    
}
