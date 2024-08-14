//
//  Contacts.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 13.06.2024.
//

import SwiftUI
import UISystem

struct Contacts: View {
    @Environment(Search.self) private var search
    @EnvironmentObject private var defaultStorage: DefaultStorage
    @State private var contacts: [Contact] = []
    
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
        .task {
            do {
                try await defaultStorage.fetchContacts()
                contacts = defaultStorage.contacts
            } catch {
                print("Error")
            }
        }
        .onChange(of: search.text) { _, newValue in
            withAnimation(.interactiveSpring) {
                contacts = defaultStorage.filteredContact(newValue)
            }
        }
    }
}

#Preview {
    Contacts()
        .environment(Search())
}
