//
//  👥💬⃛TabsView.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 18.06.2024.
//

import SwiftUI

struct TabsView: View {
    @Environment(Router.self) var router

    var body: some View {
        NavigationStack {
            VStack {
                SearchBarView()
                    .padding(.horizontal, 24)
                    .padding(.vertical)
                TabNavigationView(selectedTab: router.selectedTab as! BottomBarRoutes)
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
        }
        .tint(.accent)
        .transition(.slide)
    }
}

#Preview {
    TabsView()
        .environment(Router())
        .environment(SearchText())
}

#Preview {
    TabsView()
        .environment(Router())
        .environment(SearchText())
        .preferredColorScheme(.dark)
}
