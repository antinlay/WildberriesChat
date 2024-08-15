//
//  ToolBar.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 18.06.2024.
//

import SwiftUI

public extension View {
    var editProfileItem: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Image(ImageResource(name: "ToolBar/EditProfile", bundle: .main))
                .font(.headingSecond)
                .padding(.trailing, 10)
        }
    }
    
    var shevronItem: some View {
        HStack {
            Image(ImageResource(name: "Shevron", bundle: .main))
        }
    }
    
    func titleItem(_ title: String) -> some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Text(title)
                .font(.subheadingFirst)
                .padding(.leading, 10)
        }
    }
    
    func addContactItem(destinationView: some View) -> some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            NavigationLink {
                destinationView
            } label: {
                Image(ImageResource(name: "ToolBar/AddContact", bundle: .main))
            }
            
            .padding(.trailing, 10)
        }
    }
    
    var newChatItem: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            HStack(spacing: 8) {
                Button {
                    //
                } label: {
                    Image(ImageResource(name: "ToolBar/NewChat", bundle: .main))
                }
                
                Button {
                    //
                } label: {
                    Image(ImageResource(name: "ToolBar/ReadAll", bundle: .main))
                }
                
            }
            .padding(.trailing, 10)
        }
    }
}

public extension View {
    func toolbarBackButton(completion: @escaping () -> Void) -> some View {
        return Button {
            completion()
        } label: {
            shevronItem
        }
    }
}
