//
//  ContactsView.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 13.06.2024.
//

import SwiftUI

struct ContactsView: View {
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 0) {
                ForEach(Contact.contacts.indices, id: \.self) { index in
                    let contact = Contact.contacts[index]
                    NavigationLink(destination: ContactDetails(contact: contact)) {
                        ContactContainer(contact: contact)
                    }
                    Divider()
                        .background(.divider)
                        .padding(.horizontal, 24)
                }
            }
        }
        .background(.appBackground)
    }
}

#Preview {
    ContactsView()
}
