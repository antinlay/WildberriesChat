//
//  👥💬⃛TabsView.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 18.06.2024.
//

import SwiftUI

struct TabsView: View {
    @EnvironmentObject var searchText: SearchText
    @Environment(Router.self) var router

    var body: some View {
        NavigationStack {
            VStack {
                SearchBarView(searchText: $searchText.text)
                    .padding(.horizontal, 24)
                    .padding(.vertical)
                TabNavigationView(selectedTab: router.selectedTab)
            }
            .background(.appBackground)
            .ignoresSafeArea(.keyboard, edges: .bottom)
        }
        .tint(.accent)
        .transition(.slide)
    }
}

#Preview {
    TabsView()
        .environment(Router())
        .environmentObject(SearchText())
}

#Preview {
    TabsView()
        .environment(Router())
        .environmentObject(SearchText())
        .preferredColorScheme(.dark)
}
