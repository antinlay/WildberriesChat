//
//  ChatService.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 14.08.2024.
//

import SwiftUI

protocol MessageContent {
    var text: String? { get set }
    var link: URL? { get set }
    var image: Data? { get set }
}

struct Message<C: MessageContent> {
    var id = UUID()
    var timestamp: Date
    var sender: String
    var recipient: String
    var content: C
}
protocol ChatContent {
    associatedtype C: MessageContent
    var content: [Message<C>] { get set }
}

struct ChatMessage<C: MessageContent>: ChatContent {
    let id = UUID()
    var content: [Message<C>]
}

struct Content: MessageContent {
    var text: String?
    var link: URL?
    var image: Data?
}
