//
//  ContentView.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 06.06.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        Walkthrough()
//            .navigationDestination(for: OnBoardingRoutes.self) { route in
//                route.view
//            }
        Contacts()
    }
}

#Preview {
    ContentView()
        .environment(SearchText())
}
