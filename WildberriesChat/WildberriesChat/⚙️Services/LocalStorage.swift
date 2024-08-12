//
//  DefaultStorage.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 09.08.2024.
//

import SwiftUI
import Contacts

enum ContactError: Error, LocalizedError {
    case accessDenied
    case unhandledCase

    var errorDescription: String? {
        switch self {
        case .accessDenied:
            return "Access to contacts is denied"
        case .unhandledCase:
            return "Authorization status case not handled"
        }
    }
}

final class DefaultStorage: ObservableObject {
    @Published var contacts = Contact.contacts

    private let store = CNContactStore()    
    private let userDefaults = UserDefaults.standard
    private let userKey = "user"
    
    var user: User? {
        get {
            if let data = userDefaults.data(forKey: userKey) {
                return try? JSONDecoder().decode(User.self, from: data)
            }
            return nil
        }
        set {
            if let data = try? JSONEncoder().encode(newValue) {
                userDefaults.set(data, forKey: userKey)
            }
        }
    }
}

extension DefaultStorage {
    func filteredContact(_ searchText: String) -> [Contact] {
        searchText.isEmpty ? contacts : contacts.filter { $0.name.lowercased().contains(searchText.lowercased())}
    }
    
    private func checkAuthorization() async throws {
            switch CNContactStore.authorizationStatus(for: .contacts) {
            case .authorized:
                // All ok
                return
            case .restricted, .denied:
                throw ContactError.accessDenied
            case .notDetermined:
                // Request authorization
                try await store.requestAccess(for: .contacts)
            @unknown default:
                throw ContactError.unhandledCase
            }
        }

    func fetchContacts() async throws -> [Contact] {
        try await checkAuthorization()
        var contacts = Contact.contacts
        let keys = [CNContactPhoneNumbersKey, CNContactGivenNameKey, CNContactFamilyNameKey, CNContactImageDataAvailableKey, CNContactThumbnailImageDataKey]
        let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])

        do {
            try store.enumerateContacts(with: request) { (contact, stop) in
                let phoneNumbers = contact.phoneNumbers.compactMap { $0.value.stringValue }
                let firstName = contact.givenName
                let lastName = contact.familyName
                let photo = contact.imageDataAvailable ? UIImage(data: contact.thumbnailImageData!) : nil

                let contact = Contact(avatar: photo, name: firstName + " " + lastName, onlineStatus: "", activeStories: false, phoneNumber: phoneNumbers.first ?? "")
                // Проверяем, существует ли уже контакт с таким же номером телефона
                if !contacts.contains(where: { $0.phoneNumber == contact.phoneNumber }) {
                    contacts.append(contact)
                }            }
        } catch {
            print("Error fetching contacts: \(error)")
        }
        
        return contacts
    }
}
