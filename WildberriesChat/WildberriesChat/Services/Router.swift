//
//  Router.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 03.07.2024.
//

import Foundation
import SwiftUI

enum Tabs: CaseIterable {
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

final class Router: ObservableObject {
    @Published var selectedTab: Tabs = .contacts
}
