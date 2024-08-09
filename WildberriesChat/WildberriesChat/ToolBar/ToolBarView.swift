//
//  ToolBarView.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 18.06.2024.
//

import SwiftUI

struct ToolBarView: ToolbarContent {
    var selectedTab: BottomBarRoutes
    
    var body: some ToolbarContent {
        switch selectedTab {
        case .contacts:
            title("Contacts")
            addContact()
        case .chats:
            title("Chats")
        case .more:
            title("More")
        }
    }
    
    func title(_ title: String) -> some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Text(title)
                .font(.subheadingFirst)
                .padding(.leading, 10)
        }
    }
    
    func addContact() -> some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            NavigationLink(destination: AddContact()) {
                Image(.ToolBar.addContact)
                    .font(.headingSecond)
                    .padding(.trailing, 10)
            }
        }
    }    
}
