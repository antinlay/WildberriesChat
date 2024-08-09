//
//  🔐Verification.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 15.07.2024.
//

import SwiftUI

struct Verification: View {
    @Environment(Router.self) var router
    @Environment(OneTimePassword.self) var otp
    
    @State var countryCode: String = "+7"
    @State var phoneNumber: String = "9999999999"
    @State var isLoading: Bool = false
    
    private var isValidPhoneNumber: Bool {
        phoneNumber.filter { "0"..."9" ~= $0 }.count != 10
    }
    
    private func sendSMS() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isLoading = false
            router.navigate(to: OnBoardingRoutes.otp)
        }
    }
    
    private var continueButton: some View {
        Button("Продолжить") {
            isLoading = true
            otp.phoneNumber = "\(countryCode)\(phoneNumber)"
            sendSMS()
        }
        .buttonStyle(ActionButton(isDisabled: isValidPhoneNumber || isLoading))
        .disabled(isValidPhoneNumber)
        .opacity(isValidPhoneNumber || isLoading ? 0.5 : 1)
    }
    
    private var waiting: some View {
        ProgressView()
            .scaleEffect(.pi)
    }
    
    var body: some View {
        ZStack {
            VStack {
                PhoneNumber(phoneNumber: $phoneNumber, countryCode: $countryCode)
                    .padding(.bottom, 69)
                continueButton
                    .padding(.horizontal, 24)

            }
            .blur(radius: isLoading ? .pi : .zero)
            
            waiting
                .opacity(isLoading ? 1 : .zero)
        }
        .animation(.easeOut, value: isLoading)
        .modifier(AppBackground())
    }
}

#Preview {
    NavigationStack {
        Verification()
            .environment(Router())
            .environment(OneTimePassword())
    }
}

#Preview {
    NavigationStack {
        Verification()
            .environment(Router())
            .environment(OneTimePassword())
            .preferredColorScheme(.dark)
    }
}
