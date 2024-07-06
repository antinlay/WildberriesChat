//
//  FlagsPicker.swift
//  WildberriesDatePicker
//
//  Created by Janiece Eleonour on 07.07.2024.
//

import SwiftUI

struct FlagsPicker: View {
    @Binding var localeFlag: LocaleFlags
    
    var body: some View {
        Picker("Country", selection: $localeFlag) {
            ForEach(LocaleFlags.allCases, id: \.self) { flag in
                Text(flag.rawValue)
            }
        }
        .pickerStyle(.segmented)
        .padding(.bottom)
    }
}

#Preview {
    FlagsPicker(localeFlag: .constant(.🇷🇺))
}
