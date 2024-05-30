//
//  Only1ContactView.swift
//  PhotoContact
//
//  Created by Carlos Román Alcaide on 24/5/24.
//

import PhotosUI
import SwiftUI

struct Only1ContactView: View {
    
    let myContacts = Contacts()
    
    @State private var enableAddContact = false
    
    @State var pickerItem: PhotosPickerItem?
    @State private var selectedImageData: Data?
    
    var body: some View {
        
        NavigationStack {
            VStack {
                Section {
                    Text("Congrats, you added \n your 1st contact!")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                }
                
                Section {
    //                Image(contacts.contactList[0].pic ?? systemImage: )
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
                            }
                        }
                         .task(id: pickerItem) {
                             if let data = try? await pickerItem?.loadTransferable(type: Data.self) {
                                 selectedImageData = data
                             }
                         }
                    }
                    
                    if myContacts.contactList.isEmpty != true {
                        Text(myContacts.contactList[0].name)
                            .font(.system(size: 20))
                    } else {
                        Text("Joecito Pera")
                    }
                }
            }
            .toolbar {
                ToolbarItem {
                    Button("Add more contacts", systemImage: "plus.circle.fill") {
                        enableAddContact.toggle()
                    }
                }
            }
            .sheet(isPresented: $enableAddContact) {
                AddContactView()
            }
        }
    }
}

#Preview {
    Only1ContactView()
}
