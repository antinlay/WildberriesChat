//
//  NavigationStackView.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 18.06.2024.
//

import SwiftUI

struct NavigationStackView: View {
    @State private var searchText = ""
    @State private var selectedTab: ImageResource = .NavigationBar.userGroup

    var body: some View {
        NavigationStack {
            VStack {
                SearchBarView(searchText: $searchText)
                    .padding(.horizontal, 24)
                    .padding(.vertical)
                TabNavigationView(selectedTab: selectedTab)
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
}

#Preview {
    NavigationStackView()
        .preferredColorScheme(.dark)
}
