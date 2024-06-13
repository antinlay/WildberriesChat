//
//  Contact.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 13.06.2024.
//

import SwiftUI

struct Contact: Identifiable {
    var id = UUID()
    var avatar: Image? = nil
    var name = ""
    var onlineStatus = false
    var activeStories = false
    var phoneNumber = ""
}

extension Contact {
    static var contacts: [Contact] = [
        .init(avatar: Image(.Avatars.anastasiya), name: "Анастасия Иванова", onlineStatus: false, activeStories: false, phoneNumber: "+79999999999"),
        .init(avatar: Image(.Avatars.petya), name: "Петя", onlineStatus: true, activeStories: false, phoneNumber: "+79999999998"),
        .init(avatar: Image(.Avatars.maman), name: "Маман", onlineStatus: false, activeStories: true, phoneNumber: "+79999999997"),
        .init(avatar: Image(.Avatars.arbuz), name: "Арбуз Дыня", onlineStatus: true, activeStories: false, phoneNumber: "+79999999996"),
        .init(avatar: nil, name: "Иван Иванов", onlineStatus: true, activeStories: false, phoneNumber: "+79999999995"),
        .init(avatar: nil, name: "Арбуз Дыня", onlineStatus: true, activeStories: false, phoneNumber: "+79999999994")
    ]
}
