//
//  DateListView.swift
//  WildberriesDatePicker
//
//  Created by Janiece Eleonour on 07.07.2024.
//

import SwiftUI

struct DateListView: View {
    @Binding var dateString: Date
    @Binding var localeFlag: LocaleFlags
    
    var body: some View {
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: dateString) ?? dateString
        let theDayBeforeYesterday = Calendar.current.date(byAdding: .day, value: -2, to: dateString) ?? dateString
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: dateString) ?? dateString
        let theDayAfterTomorrow = Calendar.current.date(byAdding: .day, value: 2, to: dateString) ?? dateString
        
        VStack(alignment: .leading) {
            Text("Two days ago:")
                .bold()
            Text("\(theDayBeforeYesterday, localeId: localeFlag.localeId)")
                .padding(.bottom, 6)
            Text("Yesterday: ")
                .bold()
            Text("\(yesterday, localeId: localeFlag.localeId)")
                .padding(.bottom, 6)

            Text("Today: ")
                .bold()
            Text("\(dateString, localeId: localeFlag.localeId)")
                .padding(.bottom, 6)

            Text("Tomorrow:")
                .bold()
            Text("\(tomorrow, localeId: localeFlag.localeId)")
                .padding(.bottom, 6)

            Text("The day after tomorrow:")
                .bold()
            Text("\(theDayAfterTomorrow, localeId: localeFlag.localeId)")
                .padding(.bottom, 6)
        }
        .font(.subheadline)
    }
}

#Preview {
    DateListView(dateString: .constant(.now), localeFlag: .constant(.🇧🇬))
}
