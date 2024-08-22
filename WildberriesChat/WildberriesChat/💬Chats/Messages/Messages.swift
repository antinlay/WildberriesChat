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
    @Binding var chat: Chat
    
    @Environment(\.dismiss) private var dismiss
    
    @EnvironmentObject private var chatViewModel: ChatViewModel
    @State private var isAiGeneratorPresented = false
    
    let chatTheme = ChatTheme(colors: .init(mainBackground: .neutralReverse))
    
    private func sendMessage(draft: DraftMessage) {
        Task {
            let newMessage = await chatViewModel.send(draft: draft,
                                                      contact: chat.contact,
                                                      chatId: chat.id)
            chat.addNewMessage(newMessage: newMessage)
            print("after", chatViewModel.chats[0].messages.last!)
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
        let messages = chat.messages
        
        ChatView(messages: messages,
                 chatType: .conversation, replyMode: .quote,
                 didSendMessage: sendMessage,
                 messageBuilder: messageViewBuilder,
                 inputViewBuilder: inputViewBuilder,
                 messageMenuAction: messageMenuAction)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                toolbarBackButton {
                    dismiss()
                }
            }
            titleItem(chat.contact.firstName)
            searchItem
            ToolbarItem(placement: .topBarTrailing) {
                toolbarBurgerButton {
                    isAiGeneratorPresented = true
                }
            }
        }
        .sheet(isPresented: $isAiGeneratorPresented, content: {
            NavigationStack {
                AiGenerator()
                    .presentationBackground(.thinMaterial)
            }
        })
        .navigationBarBackButtonHidden(true)
        .chatTheme(chatTheme)
        
    }
}

class ImageSaver: NSObject {
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }
    
    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("Save finished!")
    }
}


#Preview {
    NavigationStack {
        Messages(chat: .constant(.chat0))
    }
}

#Preview("Dark") {
    NavigationStack {
        Messages(chat: .constant(.chat0))
            .preferredColorScheme(.dark)
    }
    .environmentObject(ChatViewModel())
}
