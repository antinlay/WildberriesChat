//
//  ContactsView.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 13.06.2024.
//

import SwiftUI

struct ContactsView: View {
    @EnvironmentObject var search: SearchText
    
    var body: some View {
        let contacts = Contact.filteredContact(search.text)
        
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
        .environmentObject(SearchText())
}
