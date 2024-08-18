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
    var image: Data?
    var name: String
    var onlineStatus: String
    var activeStories: Bool
    var phoneNumber: String
    var socials: [URL?] = []
    
    init(id: UUID = UUID(), image: Data? = nil, name: String, onlineStatus: String, activeStories: Bool, phoneNumber: String, socials: [URL?]) {
        self.id = id
        self.image = image
        self.name = name
        self.onlineStatus = onlineStatus
        self.activeStories = activeStories
        self.phoneNumber = phoneNumber
        self.socials = socials
    }
}
