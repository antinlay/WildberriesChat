//
//  WildberriesChatApp.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 06.06.2024.
//

import SwiftUI

@main
struct WildberriesChatApp: App {
    @State private var router = Router()
    @State private var otp = OneTimePassword()
    @State private var search = SearchText()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navigationPath) {
                ContentView()
                    .navigationDestination(for: Destination.self) { destination in
                        switch destination {
                        case .walkthrough:
                            Walkthrough()
                        case .verification:
                            VerificationView()
                        case .otp:
                            EnterCode()
                        case .createProfile:
                            CreateProfile()
                        }
                    }
            }
            .environment(router)
            .environment(otp)
            .environment(search)
        }
    }
}
