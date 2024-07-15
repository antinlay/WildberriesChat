//
//  ☎️Verification.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 15.07.2024.
//

import SwiftUI

struct VerificationView: View {
    @State var countryCode: String = "+7"
    @State var phoneNumber: String = "9996613282"
    private var isValidPhoneNumber: Bool {
        phoneNumber.count != 10
    }
    
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
            
            Button("Продолжить") {
                //
            }
            .modifier(ActionButtonStyle())
            .disabled(isValidPhoneNumber)
            .opacity(isValidPhoneNumber ? 0.5 : 1)
            .padding(.top, 69)
            .padding(.horizontal, 24)
        }
    }
}

#Preview {
    VerificationView()
}
