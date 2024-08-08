//
//  Router.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 03.07.2024.
//

import Foundation
import SwiftUI

//protocol TabsProtocol { }

enum TabBottomBar: CaseIterable {
    case contacts
    case messages
    case more
    
    var imageResource: ImageResource {
        switch self {
        case .contacts:
            return .NavigationBar.userGroup
        case .messages:
            return .NavigationBar.messageCircle
        case .more:
            return .NavigationBar.moreHorizontal
        }
    }
    
}

enum Destination: Hashable {
    case walkthrough
    case verification
    case otp
    case createProfile
}

@Observable
final class Router {
    var navigationPath = NavigationPath()

    var selectedTab: TabBottomBar = .contacts
    var destination: Destination = .walkthrough
    
    func navigate(to destination: Destination) {
        navigationPath.append(destination)
    }
    
    func navigateBack() {
        navigationPath.removeLast()
    }
    
    func navigateRoot() {
        navigationPath.removeLast(navigationPath.count)
    }
}
