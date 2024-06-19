//
//  AddContactView.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 19.06.2024.
//

import SwiftUI

struct AddContactView: View {
    @Environment(\.dismiss) var dissmis
    
    var body: some View {
        ScrollView {
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
        .background(.appBackground)
    }
}

#Preview {
    AddContactView()
}
