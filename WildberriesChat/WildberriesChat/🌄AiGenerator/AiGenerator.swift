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
    @Environment(\.dismiss) private var dismiss
    @Environment(KandinskyImageGeneration.self) private var kandinsky
    
    @State private var prompt: String = ""
    @State private var selectedStyle: KandinskyStyle = .kandinsky
    @State private var generatedImages: [UIImage] = []
    
    @State private var isLoading: Bool = false
    @State private var showingAlert = false
    
    @FocusState private var isKeyboardHidden
    
    private func generateImage() async {
        if !prompt.isEmpty {
            isLoading = true
            
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
                .disabled(isLoading || prompt.isEmpty)
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
    
    private func saveImage() {
        generatedImages.forEach { inputImage in
            let imageSaver = ImageSaver()
            imageSaver.writeToPhotoAlbum(image: inputImage)
            generatedImages = []
            showingAlert = true
        }
    }
    
    private var generateButton: some View {
        Button {
            Task {
                await generateImage()
            }
            isKeyboardHidden = false
        } label: {
            Text("Generate Image")
        }
        .buttonStyle(ActionButton(isDisabled: isLoading || prompt.isEmpty))
    }
    
    @ViewBuilder private var images: some View {
        Group {
            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(2)
            } else if !generatedImages.isEmpty {
//                ScrollView(.horizontal, showsIndicators: false) {
                ForEach(generatedImages, id: \.self) { image in
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
//                }
            } else {
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
            generateButton
                .padding(.horizontal)
        }
        .padding()
        .interactiveDismissDisabled()
        
        .navigationBarItems(
            leading:
                Button("Close") { dismiss() },
            trailing:
                Button("Save") { saveImage() }
                .disabled(generatedImages.isEmpty)
        )
        
        .alert("Image saved", isPresented: $showingAlert) {
            Button("OK", role: .cancel) { dismiss() }
        }
        
        .task {
            if generatedImages.isEmpty {
                generatedImages = await kandinsky.images.compactMap { $0.imageFromBase64 }
            }
        }
        
        .onChange(of: generatedImages) { _, _ in
            isLoading = false
        }
        .modifier(AppBackground())
    }
}

#Preview {
    NavigationStack {
        AiGenerator()
    }
    .environment(KandinskyImageGeneration())
}
