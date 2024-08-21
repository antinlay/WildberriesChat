//
//  Router.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 03.07.2024.
//

import Foundation
import SwiftUI

protocol Route: Hashable { }

enum ChatsRoutes: Route, CaseIterable {
    case messages
    case newStory
    case stories
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .messages:
            Messages(chat: .constant(.chat0))
        case .newStory:
            NewStory()
        case .stories:
            Stories()
        }
    }
}

enum ContactsRoutes: Route, CaseIterable {
    case newContact
    case contactProfile
    case editContactProfile
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .newContact:
            AddNewContact()
        case .contactProfile:
            AddNewContact()
        case .editContactProfile:
            Stories()
        }
    }
}

enum MoreRoutes: Route, CaseIterable {
    case profile
    case account
    case chats
    case theme
    case notification
    case security
    case storage
    case help
    case inviteFriend
}

enum BottomBarRoutes: Route, CaseIterable {
    case contacts
    case chats
    case more
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .contacts:
            Contacts()
        case .chats:
            Chats()
        case .more:
            More()
        }
    }
    
    var imageResource: ImageResource {
        switch self {
        case .contacts:
            .NavigationBar.userGroup
        case .chats:
            .NavigationBar.messageCircle
        case .more:
            .NavigationBar.moreHorizontal
        }
    }
    
}

enum OnBoardingRoutes: Route {
    case walkthrough
    case verification
    case otp
    case createProfile
    case home
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .walkthrough:
            Walkthrough()
        case .verification:
            Verification()
        case .otp:
            EnterCode()
        case .createProfile:
            CreateProfile()
        case .home:
            Home()
        }
    }
}

@Observable
final class Router {
    var navigationPath = NavigationPath()
    var selectedTab: any Route = OnBoardingRoutes.walkthrough
    
    func navigate(to route: any Route) {
        navigationPath.append(route)
        selectedTab = route
    }    
}
