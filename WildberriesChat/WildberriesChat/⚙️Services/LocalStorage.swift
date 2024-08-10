//
//  DefaultStorage.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 09.08.2024.
//

import SwiftUI
import Contacts

final class DefaultStorage {
    static let shared = DefaultStorage()
    
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
    func fetchContacts() -> [Contact] {
        var contacts = Contact.contacts
        let store = CNContactStore()
        let keys = [CNContactPhoneNumbersKey, CNContactGivenNameKey, CNContactFamilyNameKey, CNContactImageDataAvailableKey, CNContactThumbnailImageDataKey]
        let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])

        do {
            try store.enumerateContacts(with: request) { (contact, stop) in
                let phoneNumbers = contact.phoneNumbers.compactMap { $0.value.stringValue }
                let firstName = contact.givenName
                let lastName = contact.familyName
                let photo = contact.imageDataAvailable ? UIImage(data: contact.thumbnailImageData!) : nil

                let contact = Contact(avatar: photo, name: firstName + " " + lastName, onlineStatus: "", activeStories: false, phoneNumber: phoneNumbers.first ?? "")
                contacts.append(contact)
            }
        } catch {
            print("Error fetching contacts: \(error)")
        }

        return contacts
    }

    func addContactsToSystem(_ contacts: [Contact]) {
        let store = CNContactStore()
        let saveRequest = CNSaveRequest()
        
        for contact in contacts {
            let newContact = CNMutableContact()
            newContact.givenName = contact.name
            newContact.phoneNumbers = [CNLabeledValue(label: CNLabelHome, value: CNPhoneNumber(stringValue: contact.phoneNumber))]
            
            if let avatar = contact.avatar {
                newContact.imageData = avatar.pngData()
            }
            
            saveRequest.add(newContact, toContainerWithIdentifier: nil)
        }
        
        do {
            try store.execute(saveRequest)
        } catch {
            print("Error adding contacts: \(error)")
        }
    }
}
