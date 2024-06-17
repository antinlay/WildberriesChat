//
//  ContactDetails.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 16.06.2024.
//

import SwiftUI

struct ContactDetails: View {
    var contact: Contact
    
    var body: some View {
        VStack {
            Circle()
                .fill(.neutralReverse)
                .overlay (
                    Image(.person)
                )
                .frame(width: 200)
                .padding()
            Text(contact.name)
                .font(FontStyles.headingSecond)
            Text(contact.phoneNumber.applyPhoneMask())
                .font(FontStyles.subheadingSecond)
                .fontWeight(.regular)
                .foregroundStyle(.appGray)
            
            HStack(spacing: 12) {
                Capsule()
                    .stroke(.accent, lineWidth: 1.67)
                    .overlay(Image(.Social.twitter))
                    .onTapGesture {
                        //
                    }
                
                Capsule()
                    .stroke(.accent, lineWidth: 1.67)
                    .overlay(Image(.Social.instagram))
                    .onTapGesture {
                        //
                    }
                
                Capsule()
                    .stroke(.accent, lineWidth: 1.67)
                    .overlay(Image(.Social.linkedin))
                    .onTapGesture {
                        //
                    }
                
                Capsule()
                    .stroke(.accent, lineWidth: 1.67)
                    .overlay(Image(.Social.facebook))
                    .onTapGesture {
                        //
                    }
                
            }
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            .padding()
        }
    }
}

#Preview {
    ContactDetails(contact: Contact.contacts.last!)
}
