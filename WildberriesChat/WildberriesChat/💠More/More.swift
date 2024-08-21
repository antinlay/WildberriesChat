//
//  More.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 18.06.2024.
//

import SwiftUI
import UISystem

struct More: View {
    @EnvironmentObject private var defaultStorage: DefaultStorage

    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.gray)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(defaultStorage.user?.firstName ?? "Иван Иванов")
                        .font(.headline)
                        .foregroundColor(.primary)
                    Text(defaultStorage.user?.phoneNumber.getRussianPhoneMask() ?? "+7 999 999-99-99")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.secondary)
            }
            .padding()
            
            
            List {
                NavigationLink(destination: (AccountView())) {
                    SettingsRow(icon: "person", title: "Аккаунт")
                }
                
                NavigationLink(destination: Chats()) {
                    SettingsRow(icon: "bubble.left.and.bubble.right", title: "Чаты")
                }
                
                NavigationLink(destination: Chats()) {
                    SettingsRow(icon: "sun.max", title: "Тема")
                }
                
                NavigationLink(destination: Chats()) {
                    SettingsRow(icon: "bell", title: "Уведомления")
                }
                
                NavigationLink(destination: Chats()) {
                    SettingsRow(icon: "shield", title: "Безопасность")
                }
                
                NavigationLink(destination: Chats()) {
                    SettingsRow(icon: "folder", title: "Память и ресурсы")
                }
                
                Section {
                    NavigationLink(destination: Chats()) {
                        SettingsRow(icon: "questionmark.circle", title: "Помощь")
                    }
                    
                    NavigationLink(destination: Chats()) {
                        SettingsRow(icon: "envelope", title: "Пригласи друга")
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
        }
    }
    
    struct SettingsRow: View {
        var icon: String
        var title: String
        
        var body: some View {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.primary)
                Text(title)
                    .foregroundColor(.primary)
                Spacer()
            }
            .padding(.vertical, 8)
        }
    }
}

struct AccountView: View {
    var body: some View {
        Text("Аккаунт")
    }
}

#Preview {
    More()
}
