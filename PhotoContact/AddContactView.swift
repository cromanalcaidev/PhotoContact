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
    @State private var pickerItem: PhotosPickerItem?
    @State private var selectedImage: Image?
    @State private var contactName = "Add your contact's name"
    @State var phoneNumber = "Phone"
    
    @State private var contacts = Contacts()
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    PhotosPicker(selection: $pickerItem) {
                        
                        if let selectedImage {
                            selectedImage
//                            Image("joecitoPera")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 250, height: 250)
                                .clipShape(.circle)
                                .toolbar {
                                    ToolbarItemGroup(placement: .topBarTrailing) {
                                        Button("Save contact", systemImage: "", action: saveContact)
                                    }
                                }
                            
                            
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
                    
                    VStack {
                        if selectedImage != nil {
                            Form {
                                Section {
                                    TextField("Add a name", text: $contactName)
                                        .multilineTextAlignment(.center)
                                }
                                
                                Section {
//                                    TextField("Add a phone number", value: $phoneNumber, format: .number)
//                                        .multilineTextAlignment(.center)
                                    
                                    iPhoneNumberField("Phone", text: $phoneNumber)
                                        .flagHidden(false)
                                        .flagSelectable(true)
                                        .prefixHidden(false)
                                        .multilineTextAlignment(.center)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    func saveContact() {
        let newContact = Contact(id: UUID(), name: contactName, pic: selectedImage, phoneNumber: Int(phoneNumber) ?? 00000)
        contacts.contactList.append(newContact)
        dismiss()
    }
}

#Preview {
    AddContactView()
}
