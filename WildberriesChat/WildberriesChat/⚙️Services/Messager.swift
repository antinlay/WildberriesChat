//
//  Messager.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 14.08.2024.
//

import SwiftUI

actor Messenger {
    var messages: [Message<Content>]

    init(messages: [Message<Content>] = []) {
        self.messages = messages
    }

    func sendMessage(sender: String, recipient: String, content: Content) {
        let message = Message(timestamp: Date.now, sender: sender, recipient: recipient, content: content)
        messages.append(message)
    }

    func deleteMessage(id: UUID) {
        messages.removeAll { $0.id == id }
    }
}
