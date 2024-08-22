//
//  More.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 18.06.2024.
//

import SwiftUI
import UISystem

struct More: View {
    @Environment(Router.self) private var router
    @EnvironmentObject private var defaultStorage: DefaultStorage
    
    private func userContainer(user: Contact) -> some View {
            HStack(spacing: 20) {
                AvatarProfile(contact: user)
                    .frame(width: 50)
                    .padding(.leading)
                VStack(alignment: .leading, spacing: 2) {
                    Text(user.firstName)
                        .font(.bodyFirst)
                        .foregroundStyle(.neutral)
                        .frame(height: 24)
                    Text(user.phoneNumber.getRussianPhoneMask())
                        .font(.metadataFirst)
                        .foregroundStyle(.appGray)
                        .frame(height: 20)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                Image(.shevron)
                    .foregroundColor(.neutral)
                    .scaleEffect(x: -1)
                    .padding(.trailing)
            }
            .frame(maxHeight: 66)
    }
    
    var body: some View {
        ScrollView {
            if let user = defaultStorage.user?.toContact() {
                NavigationLink {
                    ContactDetails(contact: user)
                } label: {
                    userContainer(user: user)
                        .padding(.vertical, 8)
                }
            }

            VStack {
                Group {
                    NavigationLink("Account") { AccountSetting() }.buttonStyle(SettingButton(icon: "Account"))
                    
                    NavigationLink("Chats") { ChatsSetting() }.buttonStyle(SettingButton(icon: "Chats"))
                    
                }
                .padding(.vertical, 8)
                .padding(.horizontal)
            }
            .padding(.bottom, 8)
            
            VStack {
                Group {
                    NavigationLink("Theme") { ThemeSetting() }.buttonStyle(SettingButton(icon: "Theme"))
                    
                    NavigationLink("Notifications") { NotificationSetting() }.buttonStyle(SettingButton(icon: "Notifications"))
                    
                    NavigationLink("Privacy") { SecuritySetting() }.buttonStyle(SettingButton(icon: "Privacy"))
                    
                    NavigationLink("Storage") { StorageSetting() }.buttonStyle(SettingButton(icon: "Storage"))
                    
                    Divider()
                    NavigationLink("Help") { HelpSetting() }.buttonStyle(SettingButton(icon: "Help"))
                    
                    NavigationLink("Invite") { InviteFriendSetting() }.buttonStyle(SettingButton(icon: "Invite"))
                }
                .padding(.vertical, 8)
                .padding(.horizontal)
            }
            
        }
        .modifier(AppBackground())
    }
}


#Preview {
    More()
        .environment(Router())
        .environmentObject(DefaultStorage())
}
