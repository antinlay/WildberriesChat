//
//  🔢OneTimePasswordView.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 18.07.2024.
//

import SwiftUI

struct OneTimePasswordView: View {
    @Environment(OneTimePassword.self) private var otp
    @State private var code = ""
    
    @State private var buttonDisabled: Bool = true
    @State private var timeRemaining = 12
    
    
    @State private var isCreateProfilePresented = false
    
    var body: some View {
        VStack {
            Text("Введите код")
                .font(FontStyles.headingSecond)
                .padding(.bottom, 8)
            Text("Отправили код на номер\n \(otp.code) \(otp.phoneNumber)")
                .font(FontStyles.bodySecond)
                .multilineTextAlignment(.center)
                .lineSpacing(8)
                .padding(.bottom, 50)
            CodeTextField(code: $code)
                .frame(height: 40)
                .onChange(of: code) { oldValue, newValue in
                    isCreateProfilePresented = (newValue == otp.code)
                }
            Button("Запросить код повторно" + (timeRemaining == 0 ? "" : " (\(timeRemaining))")) {
                timeRemaining = 12
                buttonDisabled = true
                otp±
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
        .navigationDestination(isPresented: $isCreateProfilePresented) {
            CreateProfile()
        }
    }
    
    private func timer() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                timer.invalidate()
                self.buttonDisabled = false
            }
        }
    }
    
    private func sendSMS(_ oneTimePassword: OneTimePassword) {
        for code in oneTimePassword.oneTimePasswordSequence {
            print("Generated code for phone number \(oneTimePassword.oneTimePasswordSequence.phoneNumber): \(code)")
        }
    }
}

#Preview {
    NavigationStack {
        OneTimePasswordView()
            .environment(OneTimePassword(phoneNumber: "9009009090"))
    }
}

#Preview {
    NavigationStack {
        OneTimePasswordView()
            .environment(OneTimePassword(phoneNumber: "9009009090"))
            .preferredColorScheme(.dark)
    }
}
