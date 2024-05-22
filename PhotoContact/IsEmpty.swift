//
//  IsEmpty.swift
//  PhotoContact
//
//  Created by Carlos Román Alcaide on 22/5/24.
//

import PhotosUI
import SwiftUI

struct IsEmpty: View {
    
    @State private var pickerItem: PhotosPickerItem?
    @State private var selectedImage: Image?
    @State private var contactName = "Add a name"
    
    @State private var contacts = [Contact]()
    
    
    var body: some View {
        VStack {
            PhotosPicker(selection: $pickerItem) {
                
                if let selectedImage {
                    selectedImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 300)
                        .clipShape(.circle)
                    
                    
                } else {
                    ContentUnavailableView("Select a picture", systemImage: "photo.badge.plus", description: Text("Tap to load a pic"))
                }
            }
            .padding(.vertical, 20)
            .onChange(of: pickerItem) {
                Task {
                    selectedImage = try await pickerItem?.loadTransferable(type: Image.self)
                }
            }
            HStack {
                if let selectedImage {
                    TextField("Add a name", text: $contactName)
                        .multilineTextAlignment(.center)
                }
            }
        }
    }
}

#Preview {
    IsEmpty()
}
