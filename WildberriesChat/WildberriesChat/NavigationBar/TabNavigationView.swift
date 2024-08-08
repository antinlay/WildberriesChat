//
//  TabNavigationView.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 18.06.2024.
//

import SwiftUI

struct TabNavigationView: View {
    @State var selectedTab: TabBottomBar
    
    var body: some View {
        VStack {
            SearchBarView()
                .padding(.horizontal, 24)
                .padding(.vertical)
            TabView(selection: $selectedTab) {
                ContactsView().tag(TabBottomBar.contacts)
                MessagesView().tag(TabBottomBar.messages)
                MoreView().tag(TabBottomBar.more)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .toolbar{
                ToolBarView(selectedTab: $selectedTab)
            }
            TabBarView(selectedTab: $selectedTab)
        }
    }
}

#Preview {
    TabNavigationView(selectedTab: .contacts)
}
