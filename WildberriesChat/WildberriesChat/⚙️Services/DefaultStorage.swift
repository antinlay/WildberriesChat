//
//  DefaultStorage.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 09.08.2024.
//

import SwiftUI
import Contacts

final class DefaultStorage: ObservableObject {
    var contacts: [Contact]
    
    private let store = CNContactStore()
    private let userDefaults = UserDefaults.standard
    private let userKey = "user"
    
    init(contacts: [Contact] = []) {
        self.contacts = contacts
        Task {
            do {
                try await fetchContacts()
            } catch {
                print("Error")
            }
        }
    }
    
    var user: LocalUser? {
        get {
            if let data = userDefaults.data(forKey: userKey) {
                return try? JSONDecoder().decode(LocalUser.self, from: data)
            }
            return nil
        }
        set {
            if let data = try? JSONEncoder().encode(newValue) {
                userDefaults.set(data, forKey: userKey)
            }
        }
    }

    private func checkAuthorization() async throws {
        switch CNContactStore.authorizationStatus(for: .contacts) {
        case .authorized:
            // All ok
            return
        case .restricted, .denied:
            print("Access to contacts is denied")
        case .notDetermined:
            // Request authorization
            try await store.requestAccess(for: .contacts)
        @unknown default:
            print("Authorization status case not handled")
        }
    }
    
    func fetchContacts() async throws {
        try await checkAuthorization()
        contacts = try await withCheckedThrowingContinuation { continuation in
            let keysToFetch = [CNContactPhoneNumbersKey, CNContactGivenNameKey, CNContactFamilyNameKey, CNContactImageDataKey]
            let request = CNContactFetchRequest(keysToFetch: keysToFetch as [CNKeyDescriptor])
            var newContacts: [Contact] = Contact.contacts
            do {
                try store.enumerateContacts(with: request) { contact, _ in
                    newContacts.append(contact.toContact())
                }
                return continuation.resume(with: .success(newContacts))
            } catch {
                return continuation.resume(throwing: error)
            }
        }
    }
}

extension CNContact {
    func toContact() -> Contact {
        Contact(imageData: self.imageData,
                firstName: self.givenName + " \(self.familyName)",
                onlineStatus: "",
                activeStories: false,
                phoneNumber: self.phoneNumbers.first?.value.stringValue ?? "")
    }
}

extension LocalUser {
    func toContact() -> Contact {
        Contact(imageData: self.photo,
                firstName: self.firstName,
                onlineStatus: "Online",
                activeStories: false,
                phoneNumber: self.phoneNumber)
    }
}
