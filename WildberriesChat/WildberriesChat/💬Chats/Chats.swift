//
//  Chats.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 18.06.2024.
//

import ExyteChat
import SwiftUI
import UISystem


@Observable final class ChatViewModel {
    var chats: [Chat] = [Chat.chat0, Chat.chat1, Chat.chat2]

    func send(draft: DraftMessage, contact: Contact, chatId: String) async -> Message {
        await Message.makeMessage(id: UUID().uuidString, user: User.user, draft: draft)
    }
}

struct Chats: View {
    @State var contacts: [Contact] = Contact.contacts
    @State var chatViewModel = ChatViewModel()
    
    private var yourStory: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 18)
                    .stroke(.storyBorder, lineWidth: 2)
                    .frame(width: 56, height: 56)
                RoundedRectangle(cornerRadius: 16)
                    .frame(width: 48, height: 48)
                    .foregroundColor(.neutralReverse)
                    .overlay {
                        Image(.ToolBar.addContact)
                            .foregroundStyle(.storyBorder)
                    }
            }
            Text("Your")
                .font(.metadataSecond)
        }
    }
    
    private var storiesScrollView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 16) {
                yourStory
                ForEach(contacts.filter { $0.activeStories == true }, id: \.id) { contact in
                    VStack {
                        ZStack {
                            AvatarStoryBorder()
                            Avatar(contact: contact)
                        }
                        Text(contact.firstName.components(separatedBy: " ").first ?? contact.firstName)
                            .font(.metadataSecond)
                    }
                }
            }
            .padding(.horizontal, 24)
        }
    }
    
    private var chatContainers: some View {
        ScrollView {
            SearchBar()
                .padding(.vertical)
                .padding(.horizontal, 24)
            ForEach(chatViewModel.chats.indices, id: \.self) { index in
                NavigationLink {
                    ChatView(messages: chatViewModel.chats[index].messages) { draft in
                        Task {
                            let newMessage = await chatViewModel.send(draft: draft, contact: chatViewModel.chats[index].contact, chatId: chatViewModel.chats[index].id)
                            chatViewModel.chats[index].addNewMessage(newMessage: newMessage)
                        }
                    }
                } label: {
                    ChatContainer(contact: chatViewModel.chats[index].contact, messageText: chatViewModel.chats[index].messages.last!.text, dateStatusText: "Today", unreadMessageCount: chatViewModel.chats[index].messages.last!.status != .read ? 1 : 0)
                        .padding(.horizontal, 24)
                }
            }
        }
    }
    
    var body: some View {
        VStack {
            storiesScrollView
                .frame(height: 108)
            Divider()
            chatContainers
        }
    }
}

#Preview {
    Chats()
        .environment(Search())
}
