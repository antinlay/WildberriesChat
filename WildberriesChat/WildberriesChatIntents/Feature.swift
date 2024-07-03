//
//  Feature.swift
//  WildberriesChatIntents
//
//  Created by Janiece Eleonour on 03.07.2024.
//

import SwiftUI
import SwiftData

@Model
class Feature {
    var id = UUID()
    var title = ""
    var featureDescription = ""
    var platform = Platform.iphone
    
    init(id: UUID = UUID(), title: String, featureDescription: String, platform: Platform) {
        self.id = id
        self.title = title
        self.featureDescription = featureDescription
        self.platform = platform
    }
}
