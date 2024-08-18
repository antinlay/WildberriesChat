//
//  WildberriesChatIntents.swift
//  WildberriesChatIntents
//
//  Created by Janiece Eleonour on 01.07.2024.
//

import AppIntents

struct WildberriesChatIntents: AppIntent {
    static var title: LocalizedStringResource { "Open Mom Contact" }
    
    static var openAppWhenRun: Bool = false
    
    // MARK: - Parameters
    
    @Parameter(title: "Platform", requestValueDialog: "Where would you like to see this feature?")
    var platform: Platform
    
    @Parameter(title: "Title", requestValueDialog: "What's the title of the feature?")
    var title: String
    
    @Parameter(title: "Description", requestValueDialog: "What's the description of the feature?")
    var description: String
    
    // MARK: - Summary
    
    static var parameterSummary: some ParameterSummary {
        Summary("Create a new feature for the platform \(\.$platform)")
    }
    
    @MainActor
    func perform() async throws -> some IntentResult {
        FeatureManager.shared.addFeature(
            title: title,
            description: description,
            platform: platform
        )
        
        return .result(value: "New Feature for \(platform.rawValue)\n\n\(title):\n\(description)")
    }
}
