//
//  WildberriesChatApp.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 06.06.2024.
//

import SwiftUI

@main
struct WildberriesChatApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ZStack {
                    ContentView()
                        .environment(Router())
                        .environment(SearchText())
                }
                .background(.appBackground, ignoresSafeAreaEdges: .all)
            }
        }
    }
}
