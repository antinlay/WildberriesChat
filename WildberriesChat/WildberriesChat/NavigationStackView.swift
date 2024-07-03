//
//  NavigationStackView.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 18.06.2024.
//

import SwiftUI

struct NavigationStackView: View {
    @EnvironmentObject var searchText: SearchText
    @EnvironmentObject var router: Router

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
    NavigationStackView()
        .environmentObject(Router())
}

#Preview {
    NavigationStackView()
        .environmentObject(Router())
        .preferredColorScheme(.dark)
}
