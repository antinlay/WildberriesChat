//
//  ToolBar.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 18.06.2024.
//

import SwiftUI

struct ToolBar: ToolbarContent {
    @Environment(\.dismiss) private var dismiss
    var selectedTab: any Route
    
    var body: some ToolbarContent {
        if case let selectedTab as OnBoardingRoutes = selectedTab {
            // OnBoardingRoutes specific code
            switch selectedTab {
            case .createProfile:
                shevron
                title("Create Profile")
            default:
                shevron
                title("")
            }
        } else if case let selectedTab as BottomBarRoutes = selectedTab {
            // BottomBarRoutes specific code
            switch selectedTab {
            case .contacts:
                title("Contacts")
                addContact()
            case .chats:
                title("Chats")
            case .more:
                title("More")
            }
        } else if case let selectedTab as ContactsRoutes = selectedTab {
            switch selectedTab {
            case .newContact:
                shevron
                title("New Contact")
            case .contactProfile:
                shevron
                title("Profile")
                editProfile
            case .editContactProfile:
                shevron
                title("Profile")
            }
        }
    }
    
    private var editProfile: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Image(.ToolBar.editProfile)
                .font(.headingSecond)
                .padding(.trailing, 10)
        }
    }
    
    private var shevron: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            HStack {
                Image(.shevron)
            }
            .onTapGesture {
                dismiss()
            }
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
            NavigationLink(destination: AddNewContact()) {
                Image(.ToolBar.addContact)
                    .font(.headingSecond)
                    .padding(.trailing, 10)
            }
        }
    }
}
