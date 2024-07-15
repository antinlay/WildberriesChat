//
//  ☎️Verification.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 15.07.2024.
//

import SwiftUI

enum LocaleFlags: String, CaseIterable {
    case 🇷🇺
    case 🇸🇰
    case 🇸🇮
    case 🇧🇬
    case 🇭🇷
}

struct VerificationView: View {
    @State var countryCode: LocaleFlags
    
    var body: some View {
        Text("Введите номер телефона")
            .font(FontStyles.headingSecond)
            .padding(.bottom, 8)
        Text("Мы вышлем код подтверждения\n на указанный номер")
            .font(FontStyles.bodySecond)
            .multilineTextAlignment(.center)
            .lineSpacing(8)
        Picker("Код страны", selection: $countryCode) {
            ForEach(LocaleFlags.allCases, id: \.self) {
                Text($0.rawValue)
            }
        }
    }
}

#Preview {
    VerificationView(countryCode: .🇷🇺)
}
