//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Mac on 6/29/24.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                ProfileSummary(profile: modelData.profile)
                    .toolbar {
                        ToolbarItem {
                            NavigationLink {
                                ProfileEdit(draftProfile: modelData.profile)
                            } label: {
                                Text("Edit")
                            }
                        }
                    }
            }.padding()
        }
    }
}

#Preview {
    NavigationStack {
        ProfileHost()
            .environment(ModelData())
    }
}
