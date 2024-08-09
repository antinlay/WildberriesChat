//
//  🔢EnterCode.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 18.07.2024.
//

import SwiftUI

struct EnterCode: View {
    @Environment(OneTimePassword.self) private var otp
    @Environment(Router.self) private var router
    
    @State private var code = ""
    
    @State private var buttonDisabled: Bool = true
    @State private var timeRemaining = 12
    
    private var actionText: some View {
        Text("Введите код")
            .font(.headingSecond)
    }
    
    private var interpretationText: some View {
        Text("Отправили код \(otp.code) на номер\n  \(otp.phoneNumber.getRussianPhoneMask())")
            .font(.bodySecond)
            .multilineTextAlignment(.center)
            .lineSpacing(8)
    }
    
    private var resendCodeButton: some View {
        Button("Запросить код повторно" + (timeRemaining == 0 ? "" : " (\(timeRemaining))")) {
            timeRemaining = 12
            buttonDisabled = true
            otp±
            timer()
        }
        .font(.subheadingSecond)
        .disabled(buttonDisabled)
    }
    
    var body: some View {
        VStack {
            actionText
                .padding(.bottom, 8)
            interpretationText
                .padding(.bottom, 50)
            CodeTextField(code: $code)
                .frame(height: 40)
                .onChange(of: code) { _, newValue in
                    if newValue == otp.code {
                        router.navigate(to: OnBoardingRoutes.createProfile)
                    }
                }
            resendCodeButton
                .padding(.top, 69)
                .padding(.horizontal, 24)
        }
        .modifier(AppBackground())
        .onAppear(perform: {
            timer()
        })
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
}

#Preview {
    NavigationStack {
        EnterCode()
            .environment(Router())
            .environment(OneTimePassword(phoneNumber: "9009009090"))
    }
}

#Preview {
    NavigationStack {
        EnterCode()
            .environment(Router())
            .environment(OneTimePassword(phoneNumber: "9009009090"))
            .preferredColorScheme(.dark)
    }
}
