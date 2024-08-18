//
//  AvatarContactInitials.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 14.06.2024.
//

import SwiftUI

public struct AvatarContactInitials: View {
    var initials: String
    
    public init(initials: String) {
        self.initials = initials
    }
    
    public var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(Color("AccentColor", bundle: .main))
            .frame(width: 48, height: 48)
            .overlay {
                Text(initials)
                    .font(.bodyFirst)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                
            }
    }
}

#Preview {
    AvatarContactInitials(initials: "BB")
}
