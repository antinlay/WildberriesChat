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
    
    private func sendMessage(draft: DraftMessage) {
        Task {
            let newMessage = await chatViewModel.send(draft: draft, contact: chatViewModel.chats[index].contact, chatId: chatViewModel.chats[index].id)
            chatViewModel.chats[index].addNewMessage(newMessage: newMessage)
        }
    }
    
    private func messageMenuAction(
        action: DefaultMessageMenuAction,
        defaultActionClosure: (Message, DefaultMessageMenuAction) -> Void,
        message: Message
    ) {
        switch action {
        case .reply:
            defaultActionClosure(message, .reply)
        case .edit:
            ()
        }
    }
    
    @ViewBuilder
    private func messageViewBuilder(
        message: Message,
        positionInGroup: PositionInUserGroup,
        positionInCommentsGroup: CommentsPosition?,
        showContextMenuClosure: @escaping () -> Void,
        messageActionClosure: @escaping (Message, DefaultMessageMenuAction) -> Void,
        showAttachmentClosure: @escaping (Attachment) -> Void
    ) -> some View {
        CustomMessage(message: message, positionInGroup: positionInGroup)
    }
    
    @ViewBuilder
    private func inputViewBuilder(
        textBinding: Binding<String>,
        attachments: InputViewAttachments,
        inputViewState: InputViewState,
        inputViewStyle: InputViewStyle,
        inputViewActionClosure: @escaping (InputViewAction) -> Void,
        dismissKeyboardClosure: ()->()
    ) -> some View {
        CustomInput(text: textBinding, attachments: attachments, inputViewStyle: inputViewStyle, inputViewState: inputViewState, inputViewActionClosure: inputViewActionClosure)
    }
    
    var body: some View {
        ChatView(messages: chatViewModel.chats[index].messages, chatType: .conversation, replyMode: .quote, didSendMessage: sendMessage, messageBuilder: messageViewBuilder, inputViewBuilder: inputViewBuilder, messageMenuAction: messageMenuAction)
            .chatNavigation(title: chatViewModel.chats[index].contact.firstName, status: chatViewModel.chats[index].contact.onlineStatus, cover: chatViewModel.chats[index].contact.avatarURL)
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
