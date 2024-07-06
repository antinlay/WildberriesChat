//
//  DatePickerView.swift
//  WildberriesDatePicker
//
//  Created by Janiece Eleonour on 07.07.2024.
//

import SwiftUI

struct DatePickerView: View {
    @Binding var dateString: Date

    var body: some View {
        DatePicker("Choose Date", selection: $dateString, displayedComponents: .date)
        DatePicker("Choose Time", selection: $dateString, displayedComponents: .hourAndMinute)
            .padding(.vertical)
    }
}

#Preview {
    DatePickerView(dateString: .constant(.init()))
}
