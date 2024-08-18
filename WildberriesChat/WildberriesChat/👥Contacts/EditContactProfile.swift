//
//  EditContactProfile.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 13.08.2024.
//

import SwiftUI
import UISystem

struct EditContactProfile: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        shevronItem
                    }
                }
                titleItem("Profile")
            }
    }
}

#Preview {
    EditContactProfile()
}
