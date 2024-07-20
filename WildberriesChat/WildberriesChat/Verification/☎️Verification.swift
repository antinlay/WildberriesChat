//
//  ☎️Verification.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 15.07.2024.
//

import SwiftUI

struct VerificationView: View {
    @State var countryCode: String = "+7"
    @State var phoneNumber: String = ""
    @State var isLoading: Bool = false
    @State var isShowingOTP: Bool = false
    
    private var isValidPhoneNumber: Bool {
        phoneNumber.count != 10
    }
    
    private func sendSMS() {
        sleep(3)
        isLoading = false
    }
    
    private var continueButton: some View {
        NavigationLink("Продолжить") {
            OneTimePasswordView(countryCode: $countryCode, phoneNumber: $phoneNumber)
                .environment(OneTimePassword(phoneNumber: "\(countryCode)\(phoneNumber)"))
        }
        .modifier(ActionButtonStyle())
        .disabled(isValidPhoneNumber || isLoading)
        .opacity(isValidPhoneNumber || isLoading ? 0.5 : 1)
        .padding(.top, 69)
        .padding(.horizontal, 24)
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    PhoneNumberView(phoneNumber: $phoneNumber, countryCode: $countryCode)
                        .transition(.blurReplace)
                    continueButton
                        .transition(.opacity)
                }
                .animation(.smooth, value: isLoading)
                
                ProgressView()
                    .scaleEffect(.pi)
                    .opacity(isLoading ? 1 : .zero)
            }
        }
    }
}

#Preview {
    VerificationView()
}
