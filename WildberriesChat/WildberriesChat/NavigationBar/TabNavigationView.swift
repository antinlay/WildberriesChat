//
//  TabNavigationView.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 18.06.2024.
//

import SwiftUI

struct TabNavigationView: View {
    @State var selectedTab: Tabs
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ContactsView().tag(Tabs.contacts)
            MessagesView().tag(Tabs.messages)
            MoreView().tag(Tabs.more)
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .toolbar{
            ToolBarView(selectedTab: $selectedTab)
        }
        
        TabBarView(selectedTab: $selectedTab)
    }
}

#Preview {
    TabNavigationView(selectedTab: .contacts)
}
