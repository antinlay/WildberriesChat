//
//  PrivacyAndTerms.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 12.06.2024.
//

import SwiftUI

struct PrivacyAndTerms: View {
    @State private var isPolicyPresented = false
    @State private var isTermsPresented = false
    
    var body: some View {
        Text("By clicking the continue button, I agree with ")
            .font(.metadataSecond)
            .foregroundStyle(.appGray)
            .padding(2)
        HStack(spacing: 0) {
            Text("Privacy Policy")
                .font(.metadataSecond)
                .foregroundStyle(.accent)
                .onTapGesture {
                    isPolicyPresented = true
                }
                .sheet(isPresented: $isTermsPresented, content: {
                    UserAgreement()
                        .presentationBackground(.thinMaterial)
                })
            Text(" and ")
                .font(.metadataSecond)
                .foregroundStyle(.appGray)
            Text("Terms of Use")
                .font(.metadataSecond)
                .foregroundColor(.accent)
                .onTapGesture {
                    isTermsPresented = true
                }
                .sheet(isPresented: $isPolicyPresented, content: {
                    UserAgreement()
                        .presentationBackground(.thinMaterial)
                })
        }
    }
}

#Preview {
    PrivacyAndTerms()
}
