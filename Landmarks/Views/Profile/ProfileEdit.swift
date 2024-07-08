//
//  ProfileEdit.swift
//  Landmarks
//
//  Created by Janiece Eleonour on 08.07.2024.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

struct ProfileEdit: View {
    @Environment(\.dismiss) private var save
    @Environment(ModelData.self) var modelData
    
    @State var draftProfile: Profile
    
    var body: some View {
        ScrollView {
            TextField(draftProfile.username, text: $draftProfile.username)
                .padding()
                .textFieldStyle(.roundedBorder)
            
            Toggle("Notifications", isOn: $draftProfile.prefersNotifications)
                .padding()
            
            Picker("Seasonal Photo", selection: $draftProfile.seasonalPhoto) {
                ForEach(Profile.Season.allCases, id: \.self) { season in
                    Text(season.rawValue)
                }
            }
            .pickerStyle(.navigationLink)
            .padding()
            
            DatePicker("Goal Date", selection: $draftProfile.goalDate, displayedComponents: .date)
                .datePickerStyle(.compact)
                .padding()
        }
        .toolbar {
            ToolbarItem {
                Button {
                    modelData.profile = draftProfile
                    save()
                } label: {
                    Text("Save")
                }

            }
        }
    }
}

#Preview {
    NavigationStack {
        ProfileEdit(draftProfile: .default)
            .environment(ModelData())
    }
}
