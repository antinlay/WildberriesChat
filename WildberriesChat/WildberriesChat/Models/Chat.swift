//
//  ChatService.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 14.08.2024.
//

import SwiftUI

struct Message {
    var timestamp: Date
    var content: String
}

struct ChatMessage {
    let content: Message
    let chatId: String
}
