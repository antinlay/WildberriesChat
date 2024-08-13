//
//  Home.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 18.06.2024.
//

import SwiftUI
import UISystem

struct Home: View {
    @Environment(Router.self) var router
    @State var selectedTab: BottomBarRoutes = .contacts
            
    var body: some View {
        VStack {
            SearchBar()
                .padding(.horizontal, 24)
                .padding(.vertical)
            TabView(selection: $selectedTab) {
                Contacts().tag(BottomBarRoutes.contacts)
                Chats().tag(BottomBarRoutes.chats)
                More().tag(BottomBarRoutes.more)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            Spacer()
            BottomBar(selectedTab: $selectedTab)
        }
        .toolbar {
            switch selectedTab {
            case .contacts:
                Group {
                    addContactItem(destinationView: AddNewContact())
                    titleItem("Contacts")
                }
            case .chats:
                Group {
                    newChatItem
                    titleItem("Chats")
                }
            case .more:
                Group {
                    titleItem("More")
                }
            }
        }
        .ignoresSafeArea(edges: .bottom)
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .modifier(AppBackground())
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        Home()
            .environment(Router())
            .environment(Search())
    }
}
