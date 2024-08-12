//
//  PhoneNumber.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 16.07.2024.
//

import SwiftUI
import UISystem

struct PhoneNumber: View {
    @Binding var phoneNumber: String
    @Binding var countryCode: String
    
    private var actionText: some View {
        Text("Введите номер телефона")
            .font(.headingSecond)
    }
    
    private var interpretationText: some View {
        Text("Мы вышлем код подтверждения\n на указанный номер")
            .font(.bodySecond)
            .multilineTextAlignment(.center)
            .lineSpacing(8)
    }
    
    private var enterCountryCode: some View {
        HStack {
            Image(.Flags.russian)
            Text(countryCode)
        }
        .modifier(InputTextField())
        .modifier(InputBackground())
    }
    
    private var enterPhoneNumber: some View {
        TextField("000 000-00-00", text: $phoneNumber)
            .modifier(InputTextField())
            .modifier(InputBackground())
            .keyboardType(.numberPad)
            .onChange(of: phoneNumber) { _, _ in
                phoneNumber.applyRussianPhoneMask()
            }

    }
    
    var body: some View {
        VStack {
            actionText
                .padding(.bottom, 8)
            interpretationText
                .padding(.bottom, 50)
            HStack(alignment: .center, spacing: 8) {
                enterCountryCode
                enterPhoneNumber                
            }
            .padding(.horizontal, 24)
        }
        .task {
            phoneNumber.applyRussianPhoneMask()
        }
    }
}

#Preview {
    PhoneNumber(phoneNumber: .constant(""), countryCode: .constant("+7"))
}

#Preview {
    PhoneNumber(phoneNumber: .constant(""), countryCode: .constant("+7"))
        .preferredColorScheme(.dark)
}
