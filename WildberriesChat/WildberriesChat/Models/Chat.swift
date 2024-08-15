//
//  ChatService.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 14.08.2024.
//

import SwiftUI

protocol MessageContent {
    var text: String? { get set }
    var link: [URL?]? { get set }
    var image: [Data?]? { get set }
}

struct Message: Codable {
    var id = UUID()
    var timestamp: Date
    var sender: String
    var recipient: String
    var content: Content
}
protocol ChatContent {
    var content: [Message] { get set }
}

struct ChatMessage: ChatContent {
    let id = UUID()
    var content: [Message]
}

struct Content: MessageContent, Codable {
    var text: String?
    var link: [URL?]?
    var image: [Data?]?
}
