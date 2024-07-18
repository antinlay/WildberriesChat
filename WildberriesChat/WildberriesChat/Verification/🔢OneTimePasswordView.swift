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
    @State var buttonDisabled: Bool = true
    @State var timeRemaining = 12
    
    func timer() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                timer.invalidate()
                self.buttonDisabled = false
            }
        }
    }
    
    var body: some View {
        VStack {
            Text("Введите код")
                .font(FontStyles.headingSecond)
                .padding(.bottom, 8)
            Text("Отправили код на номер\n \(countryCode) \(phoneNumber)")
                .font(FontStyles.bodySecond)
                .multilineTextAlignment(.center)
                .lineSpacing(8)
                .padding(.bottom, 50)
            CodeTextField()
                .frame(height: 40)
            Button("Запросить код повторно" + (timeRemaining == 0 ? "" : " (\(timeRemaining))")) {
                timeRemaining = 12
                buttonDisabled = true
                timer()
            }
            .font(FontStyles.subheadingSecond)
            .disabled(buttonDisabled)
            .padding(.top, 69)
            .padding(.horizontal, 24)
        }
        .onAppear(perform: {
            timer()
        })
    }
}

#Preview {
    OneTimePasswordView(countryCode: .constant("+7"), phoneNumber: .constant("9991234567".applyPhoneMask()))
}
