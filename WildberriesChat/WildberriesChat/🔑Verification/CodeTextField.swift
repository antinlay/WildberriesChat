//
//  CodeTextField.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 18.07.2024.
//

import SwiftUI

struct CodeTextField: View {
    @Binding var code: String
    @FocusState private var isCodeFocused: Bool
    
    var limit: Int = 4
    
    private func text(_ digit: String.Element) -> some View {
            Text("\(digit)")
                .font(.headingFirst)
                .multilineTextAlignment(.center)
    }
    
    private var placeHolder: some View {
        Circle()
            .frame(width: 24, height: 24)
            .foregroundColor(.inputGray)
    }
    
    private var customTextField: some View {
        TextField("", text: $code)
            .opacity(.zero)
            .keyboardType(.numberPad)
            .focused($isCodeFocused)
    }
        
    var body: some View {
        let digits = Array(code)

        HStack(spacing: 48) {
            ForEach(0..<limit, id:\.self) { index in
                ZStack {
                    placeHolder
                        .opacity(digits.count > index ? .zero : 1)
                    if let digit = digits[safe: index] {
                        text(digit)
                    }
                }
                .animation(.easeOut, value: digits.count > index)
                .onTapGesture {
                    isCodeFocused = true
                }
            }
        }
        .background {
            customTextField
        }
    }
}

#Preview {
    CodeTextField(code: .constant(""))
}
