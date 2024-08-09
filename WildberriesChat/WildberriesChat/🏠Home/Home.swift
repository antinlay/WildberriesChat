//
//  Home.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 18.06.2024.
//

import SwiftUI
import UISystem

struct Home: View {
    @Environment(SearchText.self) var search
    @State var selectedTab: BottomBarRoutes
    
    var body: some View {
        VStack {
            SearchBar(searchText: search.text)
                .padding(.horizontal, 24)
                .padding(.vertical)
            TabView(selection: $selectedTab) {
                Contacts().tag(BottomBarRoutes.contacts)
                Chats().tag(BottomBarRoutes.chats)
                More().tag(BottomBarRoutes.more)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .toolbar{
                ToolBar(selectedTab: selectedTab)
            }
            Spacer()
            BottomBar(selectedTab: $selectedTab)
        }
        .ignoresSafeArea(edges: .bottom)
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .modifier(AppBackground())
    }
}

#Preview {
    NavigationStack {
        Home(selectedTab: .contacts)
            .environment(Router())
            .environment(SearchText())
    }
}
