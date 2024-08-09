//
//  TabNavigationView.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 18.06.2024.
//

import SwiftUI

struct TabNavigationView: View {
    @State var selectedTab: BottomBarRoutes
    
    var body: some View {
        VStack {
            SearchBarView()
                .padding(.horizontal, 24)
                .padding(.vertical)
            TabView(selection: $selectedTab) {
                ContactsView().tag(BottomBarRoutes.contacts)
                MessagesView().tag(BottomBarRoutes.messages)
                MoreView().tag(BottomBarRoutes.more)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .toolbar{
                ToolBarView(selectedTab: $selectedTab)
            }
            BottomTabBar(selectedTab: $selectedTab)
        }
    }
}

#Preview {
    TabNavigationView(selectedTab: .contacts)
        .environment(Router())
}
