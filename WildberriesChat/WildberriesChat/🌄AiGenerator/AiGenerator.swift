//
//  AiGenerator.swift
//  WildberriesChat
//
//  Created by Ramazan Nazaev on 20.08.2024.
//

import SwiftUI
import UISystem
import ExyteChat

struct AiGenerator: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var prompt: String = ""
    @State private var selectedStyle: KandinskyStyle = .kandinsky
    @State private var generatedImages: [UIImage] = []
    @State private var isLoading: Bool = false
    @FocusState private var isKeyboardHidden
    private var kandinsky = KandinskyImageGeneration()
    
    private func generateImage() async {
        if !prompt.isEmpty {
            isLoading = true
            // Ваш код для вызова API и генерации изображения на основе prompt и selectedStyle
            // Например:
            generatedImages = await kandinsky.generateQuery(parameters: KandinskyParameters(style: selectedStyle ,prompt: prompt))
        }
    }
    
    private var styleButtons: some View {
        HStack {
            ForEach(KandinskyStyle.allCases, id: \.self) { style in
                Button(action: {
                    selectedStyle = style
                }) {
                    Text(style.rawValue)
                        .padding()
                        .background(selectedStyle == style ? Color.accentColor : Color.appGray)
                        .foregroundColor(.white)
                        .cornerRadius(45)
                }
                .disabled(isLoading)
            }
        }
    }
    
    private var enterPrompt: some View {
        TextField("Enter prompt...", text: $prompt)
            .modifier(InputTextField())
            .modifier(InputBackground())
            .focused($isKeyboardHidden)
            .disabled(isLoading)
    }
    
    private var onSendImage: (([UIImage]) -> Void)?
    
    private func saveImage() {
        onSendImage?(generatedImages)
        generatedImages.forEach { inputImage in
            let imageSaver = ImageSaver()
            imageSaver.writeToPhotoAlbum(image: inputImage)
        }
        presentationMode.wrappedValue.dismiss()
    }

    @ViewBuilder private var images: some View {
        Group {
            switch isLoading {
            case true:
                if let image = generatedImages.first {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                } else {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(2)
                }
            case false:
                Text("No image generated yet.")
                    .foregroundColor(.gray)
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            images
                .padding()
            Spacer()
            
            enterPrompt
                .padding()
            styleButtons
                .padding(.horizontal)
            
            Button {
                Task {
                    await generateImage()
                }
                isKeyboardHidden = false
            } label: {
                Text("Generate Image")
            }
            .buttonStyle(ActionButton(isDisabled: isLoading))
            .padding(.horizontal)
        }
        .padding()
        .navigationBarItems(
            leading: Button("Close") {
                presentationMode.wrappedValue.dismiss()
            },
            trailing: Button("Save") {
                saveImage()
            }
                .disabled(generatedImages.isEmpty)
        )
        .onChange(of: generatedImages) { _, _ in
            isLoading = false
        }
    }
}

#Preview {
    NavigationStack {
        AiGenerator()
    }
}
