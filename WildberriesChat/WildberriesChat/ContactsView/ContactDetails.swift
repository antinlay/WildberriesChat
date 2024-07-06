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
    
    var body: some View {
        let socials: [ImageResource] = [.Social.twitter, .Social.instagram, .Social.linkedin, .Social.facebook]
        
        ScrollView {
            CircleAvatar(contact: contact)
            Text(contact.name)
                .font(FontStyles.headingSecond)
            Text(contact.phoneNumber.applyPhoneMask())
                .font(FontStyles.subheadingSecond)
                .fontWeight(.regular)
                .foregroundStyle(.appGray)
            
            HStack {
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
            .padding()
        }
        .frame(maxWidth: .infinity)
        .background(.appBackground)

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
                    .font(FontStyles.subheadingFirst)
                    .padding(.leading, 10)
            }
            
            ToolbarItem(placement: .topBarTrailing) {
//                NavigationLink(destination: AddContactView()) {
                    Image(.ToolBar.editProfile)
                        .font(FontStyles.headingSecond)
                        .padding(.trailing, 10)
//                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .background(.appBackground)
    }
}

#Preview {
    ContactDetails(contact: Contact.contacts.last!)
}
