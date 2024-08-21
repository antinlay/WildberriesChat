//
//  CustomAttachment.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 18.08.2024.
//

import SwiftUI
import ExyteChat

struct CustomAttachment: View {
    var attachment: Attachment
    var imageSize: CGSize
    var cornerRadius: CGFloat

    var body: some View {
        AsyncImage(url: attachment.thumbnail) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(width: imageSize.width, height: imageSize.height)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageSize.width, height: imageSize.height)
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            default:
                Image(systemName: "photo")
            }
        }
    }
}

#Preview {
    CustomAttachment(attachment: Attachment.message1, imageSize: CGSize(width: 150, height: 262), cornerRadius: 4)
}
