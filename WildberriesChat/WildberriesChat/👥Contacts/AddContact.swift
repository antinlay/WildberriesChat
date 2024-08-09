//
//  AddContact.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 19.06.2024.
//

import SwiftUI

struct AddContact: View {
    @Environment(\.dismiss) var dissmis
    
    var body: some View {
        VStack {
            Text("Add Contact")
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
    AddContact()
}
