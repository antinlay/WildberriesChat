//
//  ContactsView.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 13.06.2024.
//

import SwiftUI

struct ContactsView: View {
    @State private var searchText = ""
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(content: {
                ForEach(Contact.contacts.indices, id: \.self) { index in
                    let contact = Contact.contacts[index]
                    ContactContainer(contact: contact)
                }
            })
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        }
        .navigationTitle("Контакты")
    }
}

#Preview {
    ContactsView()
}
