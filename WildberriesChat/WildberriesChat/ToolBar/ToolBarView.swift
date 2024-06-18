//
//  ToolBarView.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 18.06.2024.
//

import SwiftUI

struct ToolBarView: ToolbarContent {
    var selectedTab: ImageResource

    var body: some ToolbarContent {
        
        switch selectedTab {
        case .NavigationBar.userGroup:
            title("Contacts")
            addContact()
        case .NavigationBar.messageCircle:
            title("Messages")
        case .NavigationBar.moreHorizontal:
            title("More")
        default:
            title("Contacts")
        }
    }
    
    func title(_ title: String) -> some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Text(title)
                .font(FontStyles.subheadingFirst)
                .padding(.leading, 10)
        }
    }
    
    func addContact() -> some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Image(.ToolBar.addContact)
                .font(FontStyles.headingSecond)
                .padding(.trailing, 10)
        }

    }
}

//#Preview {
//    ContactsView()
//        .toolbar {
//            ToolBarView(title: .constant("Контакты"))
//        }
//}
