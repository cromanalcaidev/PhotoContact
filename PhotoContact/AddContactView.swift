//
//  AddContactView.swift
//  PhotoContact
//
//  Created by Carlos Román Alcaide on 24/5/24.
//

import iPhoneNumberField
import PhotosUI
import SwiftUI

struct AddContactView: View {
    
    @State private var contacts = Contacts()
    
    @State private var contactName = "Add your contact's name"
    @State var phoneNumber = "Add your contact's number"
    
    @State var pickerItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    
    
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            List {
                Section("Contact name") {
                    TextField("Name", text: $contactName)
                }
                
                Section("Phone number") {
                    TextField("Phone number", text: $phoneNumber)
                        .keyboardType(.numberPad)
                }
                
                
                
                Section("Contact photo") {
                    PhotosPicker(selection: $pickerItem,
                                 matching: .images,
                                 photoLibrary: .shared()) {
                        
                        if let imageData = selectedImageData,
                           let uiImage = UIImage(data: imageData) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 250, height: 250, alignment: .center)
                                .clipShape(.circle)
                            Button("Remove picture", role: .destructive) {
                                withAnimation {
                                    pickerItem = nil
                                    selectedImageData = nil
                                }
                            }
                            
                        } else {
                            Label("Add picture", systemImage: "photo")
                        }
                    }
                     .task(id: pickerItem) {
                         if let data = try? await pickerItem?.loadTransferable(type: Data.self) {
                             selectedImageData = data
                         }
                     }
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Save contact", systemImage: "square.and.arrow.down") {
                        saveContact()
                        dismiss()
                    }
                }
            }
        }
    }
    func saveContact() {
        let newContact = Contact(id: UUID(), name: contactName, pic: selectedImageData, phoneNumber: Int(phoneNumber) ?? 00000)
        contacts.contactList.append(newContact)
    }
}

#Preview {
    AddContactView()
}
