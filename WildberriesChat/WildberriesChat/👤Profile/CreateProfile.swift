//
//  CreateProfile.swift
//  WildberriesChat
//
//  Created by Janiece Eleonour on 20.07.2024.
//

import SwiftUI
import PhotosUI
import UISystem


struct CreateProfile: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(Router.self) private var router
    @EnvironmentObject private var defaultStorage: DefaultStorage
    
    @State private var avatar: Data?
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var photoPickerItem: PhotosPickerItem?
    
    private var firstNameTextField: some View {
        TextField("Name (requirment)", text: $firstName)
            .modifier(InputTextField())
            .modifier(InputBackground())
    }
    
    private var lastNameTextField: some View {
        TextField("Surname (optional)", text: $lastName)
            .modifier(InputTextField())
            .modifier(InputBackground())
    }
    
    private var saveButton: some View {
        Button("Save") {
            defaultStorage.user?.firstName = "\(firstName) \(lastName)"
            defaultStorage.user?.isLoggedIn = true
            defaultStorage.user?.photo = avatar
            router.navigate(to: OnBoardingRoutes.home)
        }
        .buttonStyle(ActionButton(isDisabled: firstName.isEmpty))
    }
    
    var body: some View {
        ScrollView {
            PhotosPicker(selection: $photoPickerItem) {
                switch avatar {
                case .some(let uiImage):
                    AvatarCircle(avatar: UIImage(data: uiImage)!)
                case .none:
                    AvatarPlaceholder()
                        .overlay(alignment: .bottomTrailing) {
                            Image(ImageResource(name: "CirclePlus", bundle: .main))
                                .offset(x: -8, y: -8)
                        }
                }
            }
            .scaleEffect(0.5)
            .padding(.bottom, -31)
            
            Group {
                firstNameTextField
                lastNameTextField
                saveButton
                    .padding(.top, 44)
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 24)
            
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                toolbarBackButton {
                    dismiss()
                }
            }
            titleItem("Create Profile")
        }
        .onChange(of: photoPickerItem) { _, newValue in
            Task {
                if let loaded = try? await newValue?.loadTransferable(type: Data.self) {
                    avatar = loaded
                } else {
                    print("Failed")
                }
            }
        }
        .navigationBarBackButtonHidden()
        .modifier(AppBackground())
    }
}

#Preview {
    NavigationStack {
        CreateProfile()
            .environmentObject(DefaultStorage())
    }
}

#Preview {
    NavigationStack {
        CreateProfile()
            .preferredColorScheme(.dark)
            .environmentObject(DefaultStorage())
    }
}

