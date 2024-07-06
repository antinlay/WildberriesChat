//
//  ContactsView.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 13.06.2024.
//

import SwiftUI

struct ContactsView: View {
    @Environment(\.isSearching) var isSearching
    
    let contacts = Contact.contacts
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 0) {
                ForEach(contacts.indices, id: \.self) { index in
                    NavigationLink(destination: ContactDetails(contact: contacts[index])) {
                        ContactContainer(contact: contacts[index])
                    }
                    Divider()
                        .foregroundStyle(.divider)
                        .padding(.horizontal, 24)
                }
            }
        }
    }
}

#Preview {
    ContactsView()
}
