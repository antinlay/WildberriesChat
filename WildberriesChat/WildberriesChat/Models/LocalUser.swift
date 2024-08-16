//
//  LocalUser.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 09.08.2024.
//

import Foundation

//protocol User {
//    var phoneNumber: String { get set }
//    var firstName: String { get set }
//}

struct LocalUser: Codable {
    var phoneNumber: String
    var firstName: String
    var lastName: String?
    var photo: Data?
    var isLoggedIn: Bool
    var activeStory: Bool = false
    var chatsId: [String] = ["0", "1", "2"]
}
