//
//  ContactDetails.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 16.06.2024.
//

import SwiftUI

struct ContactDetails: View {
    @Environment(\.dismiss) var dissmis
    var contact: Contact
        
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
        let phoneNumber = contact.phoneNumber.getRussianPhoneMask()
        
        VStack {
            AvatarProfile(contact: contact)
                .padding(.bottom, 20)
            VStack {
                Text(contact.name)
                    .font(.headingSecond)
                Text(phoneNumber)
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
                HStack {
                    Image(.shevron)
                }
                .onTapGesture {
                    dissmis()
                }
            }
            
            ToolbarItem(placement: .topBarLeading) {
                Text("Profile")
                    .font(.subheadingFirst)
                    .padding(.leading, 10)
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Image(.ToolBar.editProfile)
                    .font(.headingSecond)
                    .padding(.trailing, 10)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavigationStack {
        ContactDetails(contact: Contact.contacts.last!)
    }
}
