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
        Circle()
            .fill(.neutralReverse)
            .overlay (
                Image(.person)
            )
            .frame(width: 200)
        Text(contact.name)
            .font(FontStyles.headingSecond)
        Text(contact.phoneNumber.applyPhoneMask())
            .font(FontStyles.subheadingSecond)
            .fontWeight(.regular)
            .foregroundStyle(.appGray)
        
        HStack {
            
        }
    }
}

#Preview {
    ContactDetails(contact: Contact.contacts.last!)
}
