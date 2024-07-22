//
//  ☎️Verification.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 15.07.2024.
//

import SwiftUI

struct VerificationView: View {
    @Environment(Router.self) var router
    @Environment(OneTimePassword.self) var otp
    
    @State var countryCode: String = "+7"
    @State var phoneNumber: String = "9999999999"
    @State var isLoading: Bool = false
    
    private var isValidPhoneNumber: Bool {
        phoneNumber.count != 10
    }
    
    private func sendSMS() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isLoading = false
            router.navigate(to: .otp)
        }
    }
    
    private var continueButton: some View {
        Button {
            isLoading = true
            otp.phoneNumber = "\(countryCode)\(phoneNumber)"
            sendSMS()
        } label: {
            Text("Продолжить")
                .modifier(ActionButtonStyle())
        }
        .disabled(isValidPhoneNumber)
        .opacity(isValidPhoneNumber || isLoading ? 0.5 : 1)
        .padding(.top, 69)
        .padding(.horizontal, 24)
    }
    
    var body: some View {
        ZStack {
            Color.appBackground
                .ignoresSafeArea()
            VStack {
                PhoneNumberView(phoneNumber: $phoneNumber, countryCode: $countryCode)
                continueButton
            }
            .blur(radius: isLoading ? .pi : .zero)
            
            ProgressView()
                .scaleEffect(.pi)
                .opacity(isLoading ? 1 : .zero)
        }
        .animation(.easeOut, value: isLoading)
    }
}

#Preview {
    NavigationStack {
        VerificationView()
            .environment(Router())
            .environment(OneTimePassword())
    }
}

#Preview {
    NavigationStack {
        VerificationView()
            .environment(Router())
            .environment(OneTimePassword())
            .preferredColorScheme(.dark)
    }
}
