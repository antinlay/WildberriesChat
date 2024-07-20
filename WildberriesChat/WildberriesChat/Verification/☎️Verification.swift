//
//  ☎️Verification.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 15.07.2024.
//

import SwiftUI

struct VerificationView: View {
    @State var countryCode: String = "+7"
    @State var phoneNumber: String = "9999999999"
    @State var isLoading: Bool = false
    @State var isPresentedOTP: Bool = false
    
    private var isValidPhoneNumber: Bool {
        phoneNumber.count != 10
    }
    
    private func sendSMS() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // Задержка в 2 секунды
            self.isLoading = false
            self.isPresentedOTP = true
        }
    }
    
    private var continueButton: some View {
        Button {
            isLoading = true
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
        NavigationStack {
            ZStack {
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
            .navigationDestination(isPresented: $isPresentedOTP) {
                OneTimePasswordView(countryCode: $countryCode, phoneNumber: $phoneNumber)
                    .environment(OneTimePassword(phoneNumber: "\(countryCode)\(phoneNumber)"))
            }
        }
    }
}

#Preview {
    VerificationView()
}
