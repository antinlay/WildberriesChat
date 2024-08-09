//
//  Router.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 03.07.2024.
//

import Foundation
import SwiftUI

protocol Route: Hashable { }

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
        }
    }
}

@Observable
final class Router {
    var navigationPath = NavigationPath()
    var selectedTab: any Route = OnBoardingRoutes.walkthrough
    
    func navigate(to route: any Route) {
        navigationPath.append(route)
    }
    
    func navigateBack() {
        navigationPath.removeLast()
    }
    
    func navigateRoot() {
        navigationPath.removeLast(navigationPath.count)
    }
}
