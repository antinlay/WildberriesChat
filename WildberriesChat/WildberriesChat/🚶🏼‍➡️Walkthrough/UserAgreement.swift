//
//  UserAgreement.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 08.06.2024.
//

import SwiftUI

struct UserAgreement: View {
    @Environment(\.dismiss) var dissmis
    
    var body: some View {
        Button("Close") {
            dissmis()
        }
    }
}

#Preview {
    UserAgreement()
}
