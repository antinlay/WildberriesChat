//
//  FeatureManager.swift
//  WildberriesChatIntents
//
//  Created by Janiece Eleonour on 03.07.2024.
//

import SwiftUI
import SwiftData

// MARK: - Feature Manager

class FeatureManager: ObservableObject {
    
    // MARK: - Properties
    
    @Published var modelContext: ModelContext? = nil
    
    // MARK: - Init
    
    static let shared = FeatureManager()
    private init() {}
    
}

// MARK: - Helpers

extension FeatureManager {
    
    func addFeature(title: String, description: String, platform: Platform) {
        withAnimation {
            let feature = Feature(
                title: title,
                featureDescription: description,
                platform: platform
            )
            modelContext?.insert(feature)
        }
    }
    
    func deleteFeature(_ feature: Feature) {
        withAnimation {
            modelContext?.delete(feature)
        }
    }
    
}
