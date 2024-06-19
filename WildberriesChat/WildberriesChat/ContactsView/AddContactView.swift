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
            
            ToolbarItem(placement: .topBarLeading) {
                Text("Profile")
                    .font(FontStyles.subheadingFirst)
                    .padding(.leading, 10)
            }
            
            ToolbarItem(placement: .topBarTrailing) {
//                NavigationLink(destination: AddContactView()) {
                    Image(.ToolBar.editProfile)
                        .font(FontStyles.headingSecond)
                        .padding(.trailing, 10)
//                }
            }

        }
        .navigationBarBackButtonHidden(true)
        .background(.appBackground)
    }
}

#Preview {
    AddContactView()
}
