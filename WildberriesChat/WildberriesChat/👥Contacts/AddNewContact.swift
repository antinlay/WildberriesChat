//
//  AddNewContact.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 19.06.2024.
//

import SwiftUI

struct AddNewContact: View {
    @Environment(\.dismiss) var dissmis
    
    var body: some View {
        VStack {
            Text("New Contact")
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                HStack {
                    Image(.shevron)
                }
                .onTapGesture {
                    dissmis()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    AddNewContact()
}
