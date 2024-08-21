//
//  Chats.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 18.06.2024.
//

import ExyteChat
import SwiftUI
import UISystem

final class ChatViewModel: ObservableObject {
    @Published var chats: [Chat] = [Chat.chat0, Chat.chat1, Chat.chat2]

    func send(draft: DraftMessage, contact: Contact, chatId: String) async -> Message {
        print("before ", chats[0].messages.last!)

        let newMessage = await Message.makeMessage(id: UUID().uuidString, user: User.user, status: .sent, draft: draft)
        return newMessage
    }
    
    func filteredChats(_ searchQuery: String) -> [Chat] {
        chats.filter { chat in
            let contactMatch = chat.contact.firstName.lowercased().contains(searchQuery)
            let messageMatch = chat.messages.compactMap { $0.text.contains(searchQuery) }.first
            return contactMatch || messageMatch ?? false
        }
    }
}

struct Chats: View {
    @Environment(Search.self) private var search
    @EnvironmentObject private var chatViewModel: ChatViewModel
    @EnvironmentObject private var defaultStorage: DefaultStorage

    @State private var contacts: [Contact] = Contact.contacts
    @State private var chats: [Chat] = [Chat.chat0, Chat.chat1, Chat.chat2]
    
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
    
    @ViewBuilder private var chatContainers: some View {
        @Bindable var searchQuery = search

        ScrollView {
            SearchBar()
                .padding(.vertical)
                .padding(.horizontal, 24)
            ForEach($chats, id: \.id) { chat in
                NavigationLink {
                    Messages(chat: chat)
                } label: {
                    ChatContainer(chat: chat)
                        .padding(.horizontal, 24)
                }
            }
            .onChange(of: search.text) { _, newValue in
                withAnimation(.interactiveSpring) {
                    chats = chatViewModel.filteredChats(searchQuery.text)
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
