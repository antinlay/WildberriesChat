//
//  Contact.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 13.06.2024.
//

import SwiftUI
import ExyteChat

struct Contact: Identifiable {
    var id = UUID()
    var avatarURL: URL?
    var imageData: Data?
    var firstName: String
    var onlineStatus: String
    var activeStories: Bool
    var phoneNumber: String
    var socials: [(String, URL?)] = [("Social/Instagram", nil), ("Social/Twitter", nil), ("Social/LinkedIn", nil), ("Social/Facebook", nil)]
}

extension [Contact] {
    func filteredContact(_ searchText: String) -> [Contact] {
        searchText.isEmpty ? self : self.filter { contact in
            contact.firstName.lowercased().contains(searchText.lowercased()) || contact.phoneNumber.contains(searchText)
        }
    }
}

extension Contact {
    func toUser() -> User {
        User(id: self.id.uuidString, name: self.firstName, avatarURL: self.avatarURL, isCurrentUser: false)
    }
}

extension Contact {
    static var contacts: [Contact] = [
        .init(avatarURL: URL(string: "https://s3-alpha-sig.figma.com/img/dff3/9826/1c3f407d0c7ff3bc9e52078ef2bbe372?Expires=1724630400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=nBxeAfsPeKvV~HBhJivK-D8yDyBZGlb59bPqyX2QasRo2Bl3UcdyXiii3YoPulfQOEYScmcDa3Hd4df8-NO0G1dGTISwoS-PYVD96ZPXrrBySIU0nG0kl4kq4naLyvnwY0WrdtqpyZKCPA0I3yk4c5IFGPPW-MkbaC-~mDgXJWamZWeTUqrUE72WGplwOcbDUARBZayLZA8unS8~e25Acs8oSj~aAIT1ltu~hvjw3UvgkuaBKVypIYu~T3U53Eje4ZTN6I2RT9Nqmv5WwpCe-OewFEjZtjM10HrYEMdiNlODNDESFOJCpu42sIR910SEa55zogIYiq0OheLBdUyoTw__"),
              firstName: "Анастасия Иванова",
              onlineStatus: "Last seen yesterday",
              activeStories: false,
              phoneNumber: "+79999999999",
              socials: [("Social/Instagram", URL(string: "https://instagram.com")), ("Social/Twitter", URL(string: "https://twitter.com")), ("Social/LinkedIn", URL(string: "https://linkedin.com")), ("Social/Facebook", URL(string: "https://facebook.com"))]),
        .init(avatarURL: URL(string: "https://s3-alpha-sig.figma.com/img/1fc2/0c81/2121f46e84fc081ac2db4ad8a1450beb?Expires=1724630400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=bnGrEoAZn~pCl1KFkhhtGhZt0xYSRQlpHHXQGuz5R-CKnWYk5Caa23XTf5AJQq7icFPoTXs2UHk381lk~KCRgwKnfWLFVIh21SMP8i88U~7dGS5y2GT2tjN00Xo3ePf7xOFcTg~ai1bRoEVSZRNBjUlW-O7hrykJPGaQzJx0TQ23nR0e4ci6lt3yljA46wQuS8gjQP7E9DuC18XlLi76k6hrKtV7QFZHATxCQOz4o4UlMCeG1w8NRP6NwaW6V329-y5VbFh1ugGyklizpaAx7Ds1ZGKDDBExwwIPxZC3SAr5lYZnObJCbJ3IWGaI3SMMXT6kLQAE8l4B5TxZCXRuDg__"),
              firstName: "Петя",
              onlineStatus: "Online",
              activeStories: false,
              phoneNumber: "+79999999998",
              socials: [("Social/Instagram", URL(string: "https://instagram.com")), ("Social/Twitter", URL(string: "https://twitter.com")), ("Social/LinkedIn", URL(string: "https://linkedin.com")), ("Social/Facebook", URL(string: "https://facebook.com"))]),
        .init(avatarURL: URL(string: "https://s3-alpha-sig.figma.com/img/fed1/a269/a70ee65e1cab2c63136a619f1b00e1fe?Expires=1724630400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=hZvOe~YdRisMttz0UVczGTKrw6ScL~qy0m1-7w~QyiIMWpXeSmwUgkuHwwo7CQ-V3Krov6JN6THNASe9CrvdP9HIzDGNYYRJLsZmk9PzE-WWWtWHLQQUimylALAE4QkBQip1AGcR~oEmcoE9~UdP00a-xJuqZGUAv4GJFhMuiws71UhmHlUX1KGcT~64tlWi79viyQEc8zTGAXTcq1TdhS3z5J78wfRbIZ-jJcW8LEveE6D8KfO1WgY65JPN7FnCp~xeOfCGuM3qvj75USTBxtVrpJ~TFUJW9vNqZASzTJl2-5Zgp41AD-Bo03QLsNBjOqNfnyxJmxqGaKgkDhX3hQ__"),
              firstName: "Маман",
              onlineStatus: "Last seen 3 hours ago",
              activeStories: true,
              phoneNumber: "+79999999997",
              socials: [("Social/Instagram", URL(string: "https://instagram.com")), ("Social/Twitter", URL(string: "https://twitter.com")), ("Social/LinkedIn", URL(string: "https://linkedin.com")), ("Social/Facebook", URL(string: "https://facebook.com"))]),
        .init(avatarURL: URL(string: "https://s3-alpha-sig.figma.com/img/8ab4/9616/2c4ab2e6878b848cf34cec5937b90ffb?Expires=1724630400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=fv0F7Y3BSHMpPu9GuW5eKfhn2CPibJWjuA7KdBCAAJ9lP6VoXrKVWshg6GtUrAln1CkjDhmFH~RzbH5fwzqnKCPhevblRP4Rf~YvwKfv9RvEBFXzqqg0lhkSHyKXX-iI1tVjJaGKHE0Qc3718EZzvoNTJCfDxe-m9Mi~0F~CQ9O4FJgotjho1HxVgHk96aYyHYsFDeX6rppLyBhkXc~7aC-dE21Qf1Z~8ga2k01SFjxDfD9lb~zb~4Znni~yu1HeQJVB-uG7LAwVK774vRiGJ5at1~yyV49GdbsIzbeNNbNWrGxoBFQraXE052vXAQp5zXPTsllbk-BCQ0AXbrCCmA__"), 
              firstName: "Арбуз Дыня",
              onlineStatus: "Online",
              activeStories: false,
              phoneNumber: "+79999999996",
              socials: [("Social/Instagram", URL(string: "https://instagram.com")), ("Social/Twitter", URL(string: "https://twitter.com")), ("Social/LinkedIn", URL(string: "https://linkedin.com")), ("Social/Facebook", URL(string: "https://facebook.com"))]),
        .init(firstName: "Иван Иванов", 
              onlineStatus: "Online",
              activeStories: false,
              phoneNumber: "+79999999995",
              socials: [("Social/Instagram", URL(string: "https://instagram.com")), ("Social/Twitter", URL(string: "https://twitter.com")), ("Social/LinkedIn", URL(string: "https://linkedin.com")), ("Social/Facebook", URL(string: "https://facebook.com"))]),
        .init(firstName: "Лиса Алиса", 
              onlineStatus: "Last seen 30 minutes ago",
              activeStories: true,
              phoneNumber: "+79999999994",
              socials: [("Social/Instagram", URL(string: "https://instagram.com")), ("Social/Twitter", URL(string: "https://twitter.com")), ("Social/LinkedIn", URL(string: "https://linkedin.com")), ("Social/Facebook", URL(string: "https://facebook.com"))])
    ]
}
