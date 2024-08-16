//
//  ChatSwiftData.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 16.08.2024.
//

import Foundation
import SwiftData

@Model class ChatMessages {
    let id: String
    var messages: [MessageSwiftData]
    
    init(id: String, messages: [MessageSwiftData]) {
        self.id = id
        self.messages = messages
    }
}
