//
//  ☎️Verification.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 15.07.2024.
//

import SwiftUI

struct VerificationView: View {
    @State var countryCode: String
    @State var phoneNumber: String
    
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
                Text("🇷🇺 +7")
                    .padding(.horizontal, 8)
                    .modifier(TextFieldStyle())
                    .modifier(InputBackgroundStyle())
                
                TextField("Номер телефона", text: $phoneNumber)
                    .padding(.horizontal, 8)
                    .modifier(TextFieldStyle())
                    .modifier(InputBackgroundStyle())
                    .keyboardType(.numberPad)
            }
            .padding(.horizontal)
            
            Button("Продолжить") {
                //
            }
            .buttonStyle(<#T##style: PrimitiveButtonStyle##PrimitiveButtonStyle#>)
        }
    }
}

#Preview {
    VerificationView(countryCode: "🇷🇺 +7", phoneNumber: "")
}
