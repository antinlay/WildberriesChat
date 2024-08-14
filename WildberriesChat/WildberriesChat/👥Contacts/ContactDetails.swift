//
//  ContactDetails.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 16.06.2024.
//

import SwiftUI
import UISystem

struct ContactDetails: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(Router.self) var router
    
    var contact: Contact
    
    private var socialButtons: some View {
        HStack(spacing: 12) {
            ForEach(contact.socials, id: \.0) { social in
                if let socialURL = social.1 {
                    Link(destination: socialURL, label: {
                        Capsule()
                            .stroke(.accent, lineWidth: 1.67)
                            .overlay(Image(ImageResource(name: social.0, bundle: .main)))
                    })
                }
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 40)
        .padding(.horizontal, 26)
    }
    
    var body: some View {
        VStack {
            AvatarProfile(avatarURL: contact.avatarURL)
                .padding(.bottom, 20)
            VStack {
                Text(contact.firstName)
                    .font(.headingSecond)
                Text(contact.phoneNumber.getRussianPhoneMask())
                    .font(.subheadingSecond)
                    .fontWeight(.regular)
                    .foregroundStyle(.appGray)
            }
            .padding(.bottom, 40)
            socialButtons
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding(.top, 46)
        
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                toolbarBackButton {
                    dismiss()
                }
            }
            titleItem("Profile")
            editProfileItem
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavigationStack {
        ContactDetails(contact: Contact.contacts.last!)
    }
}
