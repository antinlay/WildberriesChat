//
//  🔢OneTimePasswordView.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 18.07.2024.
//

import SwiftUI

struct OneTimePasswordView: View {
    @Binding var countryCode: String
    @Binding var phoneNumber: String
    @State var codeNumber: String = "1"
    
    var body: some View {
        Text("Введите код")
            .font(FontStyles.headingSecond)
            .padding(.bottom, 8)
        Text("Отправили код на номер\n \(countryCode) \(phoneNumber)")
            .font(FontStyles.bodySecond)
            .multilineTextAlignment(.center)
            .lineSpacing(8)
            .padding(.bottom, 50)
        CodeTextField()
    }
}

#Preview {
    OneTimePasswordView(countryCode: .constant("+7"), phoneNumber: .constant("9991234567".applyPhoneMask()))
}
