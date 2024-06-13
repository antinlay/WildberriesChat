//
//  ContactsView.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 13.06.2024.
//

import SwiftUI

struct ContactsView: View {
    var body: some View {
//        NavigationStack {
            HStack {
                Image(.userGroup)
                    .imageScale(.small)
                Image(.messageCircle)
                Image(.moreHorizontal)
            }
//        }
//        .frame(maxWidth: .infinity, alignment: .bottom)
    }
}

#Preview {
    ContactsView()
}
