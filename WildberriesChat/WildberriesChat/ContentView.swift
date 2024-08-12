//
//  ContentView.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 06.06.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var defaultStorage: DefaultStorage
    @Environment(Router.self) private var router
    
    var body: some View {
        switch defaultStorage.user?.isLoggedIn {
        case .some(_):
            Home(selectedTab: .contacts)
                .navigationDestination(for: OnBoardingRoutes.self) { route in
                    route.view
                }
        case .none:
            Walkthrough()
                .navigationDestination(for: OnBoardingRoutes.self) { route in
                    route.view
                }
        }
    }
}

#Preview {
    ContentView()
        .environment(Search())
        .environment(Router())
        .environmentObject(DefaultStorage())
}
