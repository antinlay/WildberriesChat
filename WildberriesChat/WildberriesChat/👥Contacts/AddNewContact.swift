//
//  AddNewContact.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 19.06.2024.
//

import SwiftUI
import UISystem

struct AddNewContact: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Text("New Contact")
        }
        .toolbar {
            shevronItem
            titleItem("New Contact")
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    AddNewContact()
}
