//
//  Contact.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 13.06.2024.
//

import SwiftUI

struct Contact: Identifiable {
    var id = UUID()
    var avatar: ImageResource? = nil
    var name = ""
    var onlineStatus = ""
    var activeStories = false
    var phoneNumber = ""
}

extension Contact {
    static var contacts: [Contact] = [
        .init(avatar: .Avatars.anastasiya, name: "Анастасия Иванова", onlineStatus: "Last seen yesterday", activeStories: false, phoneNumber: "+79999999999"),
        .init(avatar: .Avatars.petya, name: "Петя", onlineStatus: "Online", activeStories: false, phoneNumber: "+79999999998"),
        .init(avatar: .Avatars.maman, name: "Маман", onlineStatus: "Last seen 3 hours ago", activeStories: true, phoneNumber: "+79999999997"),
        .init(avatar: .Avatars.arbuz, name: "Арбуз Дыня", onlineStatus: "Online", activeStories: false, phoneNumber: "+79999999996"),
        .init(avatar: nil, name: "Иван Иванов", onlineStatus: "Online", activeStories: false, phoneNumber: "+79999999995"),
        .init(avatar: nil, name: "Лиса Алиса", onlineStatus: "Last seen 30 minutes ago", activeStories: true, phoneNumber: "+79999999994")
    ]
}
