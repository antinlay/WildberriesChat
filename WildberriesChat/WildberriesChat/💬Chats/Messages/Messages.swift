//
//  Messages.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 12.08.2024.
//

import ExyteChat
import SwiftUI
import UISystem

struct Messages: View {
    var index: Int = 0
    @State var chatViewModel = ChatViewModel()
    let chatTheme = ChatTheme(colors: .init(mainBackground: .neutralReverse))

    var body: some View {
        
        ChatView(messages: chatViewModel.chats[index].messages) { draft in
            Task {
                let newMessage = await chatViewModel.send(draft: draft, contact: chatViewModel.chats[index].contact, chatId: chatViewModel.chats[index].id)
                chatViewModel.chats[index].addNewMessage(newMessage: newMessage)
            }
        } messageBuilder: { message, positionInGroup, positionInCommentsGroup, showContextMenuClosure, messageActionClosure, showAttachmentClosure in
            CustomMessage(message: message, positionInGroup: positionInGroup)
        } inputViewBuilder: { text, attachments, inputViewState, inputViewStyle, inputViewActionClosure, dismissKeyboardClosure in
            CustomInput(text: text, attachments: attachments, inputViewStyle: inputViewStyle, inputViewState: inputViewState, inputViewActionClosure: inputViewActionClosure)
        }
        .chatTheme(chatTheme)
    }
}


#Preview {
    Messages()
}

#Preview("Dark") {
    Messages()
        .preferredColorScheme(.dark)
}
