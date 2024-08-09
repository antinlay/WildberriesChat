//
//  Contacts.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 13.06.2024.
//

import SwiftUI

struct Contacts: View {
    @Environment(SearchText.self) var search
    
    private var divider: some View {
        Divider()
            .foregroundStyle(.divider)
    }
    
    var body: some View {
        let contacts = Contact.filteredContact(search.text)
        
        ScrollView(.vertical) {
            LazyVStack(spacing: 0) {
                ForEach(contacts, id: \.id) { contact in
                    NavigationLink(destination: ContactDetails(contact: contact)) {
                        ContactContainer(contact: contact)
                            .padding(.top)
                            .padding(.bottom, 12)
                            .padding(.horizontal, 24)
                    }
                    divider
                        .padding(.horizontal, 24)
                }
            }
        }
    }
}

#Preview {
    Contacts()
        .environment(SearchText())
}
