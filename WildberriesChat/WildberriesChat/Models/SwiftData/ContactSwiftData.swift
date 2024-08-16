//
//  ContactSwiftData.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 16.08.2024.
//

import Foundation
import SwiftData

@Model class ContactSwiftData {
    var id = UUID()
    var avatarURL: URL?
    var name: String
    var onlineStatus: String
    var activeStories: Bool
    var phoneNumber: String
    var socials: [(String, URL?)] = [("Social/Instagram", nil), ("Social/Twitter", nil), ("Social/LinkedIn", nil), ("Social/Facebook", nil)]
    
    init(id: UUID = UUID(), avatarURL: URL? = nil, name: String, onlineStatus: String, activeStories: Bool, phoneNumber: String, socials: [(String, URL?)]) {
        self.id = id
        self.avatarURL = avatarURL
        self.name = name
        self.onlineStatus = onlineStatus
        self.activeStories = activeStories
        self.phoneNumber = phoneNumber
        self.socials = socials
    }
}
