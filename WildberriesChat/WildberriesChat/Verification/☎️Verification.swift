//
//  ☎️Verification.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 15.07.2024.
//

import SwiftUI

struct VerificationView: View {
    @State var countryCode: String = "+7"
    @State var phoneNumber: String = "9876543221"
    @State var isLoading: Bool = false
    
    private var isValidPhoneNumber: Bool {
        phoneNumber.count != 10
    }
    
    private var continueButton: some View {
        Button("Продолжить") {
            isLoading = true
        }
        .modifier(ActionButtonStyle())
        .disabled(isValidPhoneNumber || isLoading)
        .opacity(isValidPhoneNumber || isLoading ? 0.5 : 1)
        .padding(.top, 69)
        .padding(.horizontal, 24)
    }
    
    var body: some View {
            VStack {
                if !isLoading {
                    PhoneNumberView(phoneNumber: $phoneNumber, countryCode: $countryCode)
                        .transition(.blurReplace)
                    continueButton
                        .transition(.opacity)
                } else {
                    ProgressView()
                        .scaleEffect(.pi)
                }
            }
            .animation(.easeOut, value: isLoading)
            
        }
}

#Preview {
    VerificationView()
}
