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
        let socials = [Image(.Social.twitter), Image(.Social.instagram), Image(.Social.linkedin), Image(.Social.facebook)]
        
        VStack {
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
                        .overlay(socials[index])
                        .onTapGesture {
                            //
                        }
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.appBackground)

        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                HStack {
                    Image(.shevron)
                    Text("Контакт")
                        .font(FontStyles.subheadingFirst)
                        .padding(.leading, 10)
                }
                .onTapGesture {
                    dissmis()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .transition(.scale)
        .background(.appBackground)
    }
}

#Preview {
    ContactDetails(contact: Contact.contacts.first!)
}
