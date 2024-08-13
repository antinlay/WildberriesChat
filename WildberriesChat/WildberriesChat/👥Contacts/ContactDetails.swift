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
    @EnvironmentObject private var defaultStorage: DefaultStorage
    var user: User?
    
    private var socialButtons: some View {
        let socials: [ImageResource] = [.Social.twitter, .Social.instagram, .Social.linkedin, .Social.faceBook]
        
        return HStack(spacing: 12) {
            ForEach(socials.indices, id: \.self) { index in
                Capsule()
                    .stroke(.accent, lineWidth: 1.67)
                    .overlay(Image(socials[index]))
                    .onTapGesture {
                        //
                    }
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 40)
        .padding(.horizontal, 26)
    }
    
    var body: some View {
        VStack {
            if let contact = user as? Contact {
                AvatarProfile(uiImage: contact.avatar)
                    .padding(.bottom, 20)
                VStack {
                    Text(user!.firstName)
                        .font(.headingSecond)
                    Text(user!.phoneNumber.getRussianPhoneMask())
                        .font(.subheadingSecond)
                        .fontWeight(.regular)
                        .foregroundStyle(.appGray)
                }
                .padding(.bottom, 40)
                socialButtons
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding(.top, 46)
        
        .toolbar {
            Group {
                shevronItem
                titleItem("Profile")
            }
            editProfileItem
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavigationStack {
        ContactDetails(user: Contact.contacts.last!)
    }
}
