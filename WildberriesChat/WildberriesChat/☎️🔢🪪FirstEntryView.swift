//
//  ☎️🔢🪪FirstEntryView.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 21.07.2024.
//

import SwiftUI

struct FirstEntryView: View {
    @Environment(Router.self) var router
    
    var body: some View {
        switch router.firstEntry {
        case .walkthrough:
            WalkthroughView()
        case .verification:
            VerificationView()
                .environment(OneTimePassword())
        case .otp:
            OneTimePasswordView()
        case .createProfile:
            CreateProfile()
        }
    }
}

#Preview {
    FirstEntryView()
        .environment(Router())
}
