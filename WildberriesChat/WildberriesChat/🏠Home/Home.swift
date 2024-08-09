//
//  Home.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 18.06.2024.
//

import SwiftUI
import UISystem

struct Home: View {
    @State var selectedTab: BottomBarRoutes
    
    var body: some View {
        VStack {
            SearchBarView()
                .padding(.horizontal, 24)
                .padding(.vertical)
            TabView(selection: $selectedTab) {
                Contacts().tag(BottomBarRoutes.contacts)
                Chats().tag(BottomBarRoutes.chats)
                More().tag(BottomBarRoutes.more)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .toolbar{
                ToolBarView(selectedTab: selectedTab)
            }
            Spacer()
            BottomBar(selectedTab: $selectedTab)
        }
        .ignoresSafeArea(edges: .bottom)
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

#Preview {
    NavigationStack {
        Home(selectedTab: .contacts)
            .environment(Router())
            .environment(SearchText())
    }
}
