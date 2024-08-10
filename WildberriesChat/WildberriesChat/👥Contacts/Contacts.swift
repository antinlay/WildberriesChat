//
//  Contacts.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 13.06.2024.
//

import SwiftUI
import Contacts

struct Contacts: View {
    @Environment(SearchText.self) private var search
    @State var contacts: [Contact] = Contact.contacts
    
    private var divider: some View {
        Divider()
            .foregroundStyle(.divider)
    }
    
    var body: some View {
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
        .onAppear {
            let status = CNContactStore.authorizationStatus(for: .contacts)
            switch status {
            case .authorized:
                // Fetch and add contacts
                let newContacts = DefaultStorage.shared.fetchContacts()
                DefaultStorage.shared.addContactsToSystem(newContacts)
                contacts = newContacts
            case .notDetermined:
                // Request access to contacts
                CNContactStore().requestAccess(for: .contacts) { granted, error in
                    if granted {
                        // Fetch and add contacts
                        let newContacts = DefaultStorage.shared.fetchContacts()
                        DefaultStorage.shared.addContactsToSystem(newContacts)
                        DispatchQueue.main.async {
                            contacts = newContacts
                        }
                    } else {
                        // Handle error
                        print("Error: \(error?.localizedDescription ?? "Unknown error")")
                    }
                }
            default:
                // Handle other authorization statuses
                break
            }
        }
        .onChange(of: search.text) { _, newValue in
            withAnimation(.interactiveSpring) {
                contacts = Contact.filteredContact(newValue)
            }
        }
    }
}

#Preview {
    Contacts()
        .environment(SearchText())
}
