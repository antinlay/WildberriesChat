//
//  User.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 09.08.2024.
//

import Foundation

struct User: Codable {
    var phoneNumber: String
    var firstName: String
    var lastName: String?
    var photo: Data?
    var isLoggedIn: Bool
    var contacts = UserContacts.contacts
}

struct UserContacts: Codable {
    var id: UUID
    var avatar: Data?
    var name: String
    var onlineStatus: String
    var activeStories: Bool
    var phoneNumber: String
}

extension UserContacts {
    static var contacts = Contact.contacts.map { contact in
        UserContacts(
            id: contact.id,
            avatar: contact.avatar?.pngData(),
            name: contact.name,
            onlineStatus: contact.onlineStatus,
            activeStories: contact.activeStories,
            phoneNumber: contact.phoneNumber
        )
    }

}
