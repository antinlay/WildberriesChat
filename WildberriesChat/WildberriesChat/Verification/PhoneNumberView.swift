//
//  PhoneNumberView.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 16.07.2024.
//

import SwiftUI

struct PhoneNumberView: View {
    @Binding var phoneNumber: String
    @Binding var countryCode: String
    
    var body: some View {
        VStack {
            Text("Введите номер телефона")
                .font(FontStyles.headingSecond)
                .padding(.bottom, 8)
            Text("Мы вышлем код подтверждения\n на указанный номер")
                .font(FontStyles.bodySecond)
                .multilineTextAlignment(.center)
                .lineSpacing(8)
                .padding(.bottom, 50)
            HStack(alignment: .center, spacing: 8) {
                HStack {
                    Image(.Flags.russian)
                        .clipShape(.rect(cornerRadius: 4))
                    Text(countryCode)
                }
                .padding(.horizontal, 8)
                .modifier(TextFieldStyle())
                .modifier(InputBackgroundStyle())
                
                TextField("Номер телефона", text: $phoneNumber)
                    .padding(.horizontal, 8)
                    .modifier(TextFieldStyle())
                    .modifier(InputBackgroundStyle())
                    .keyboardType(.numberPad)
            }
            .padding(.horizontal, 24)
        }
    }
}

#Preview {
    PhoneNumberView(phoneNumber: .constant(""), countryCode: .constant("+7"))
}
