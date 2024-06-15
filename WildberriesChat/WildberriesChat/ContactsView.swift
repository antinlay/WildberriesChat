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
            LazyVStack(content: {
                ForEach(Contact.contacts.indices, id: \.self) { index in
                    let contact = Contact.contacts[index]
                    ContactContainer(contact: contact)
                }
            })
        }
    }
}

#Preview {
    ContactsView()
}
