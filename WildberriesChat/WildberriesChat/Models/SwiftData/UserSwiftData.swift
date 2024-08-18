//
//  UserSwiftData.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 16.08.2024.
//

import Foundation
import SwiftData

@Model class UserSwiftData {
    let id: String
    let name: String
    let avatarURL: URL?
    let isCurrentUser: Bool

    init(id: String, name: String, avatarURL: URL?, isCurrentUser: Bool) {
        self.id = id
        self.name = name
        self.avatarURL = avatarURL
        self.isCurrentUser = isCurrentUser
    }
}
