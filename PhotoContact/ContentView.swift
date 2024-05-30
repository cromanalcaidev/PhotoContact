//
//  ContentView.swift
//  PhotoContact
//
//  Created by Carlos Román Alcaide on 22/5/24.
//

import PhotosUI
import SwiftUI

struct ContentView: View {
    
    @State private var pickerItem: PhotosPickerItem?
    @State private var selectedImage: Image?
    
    var contacts = Contacts()
    
    var loadingState: LoadingState {
        if contacts.contactList.isEmpty {
            return LoadingState.isEmpty
        } else if contacts.contactList.count == 1 {
            return LoadingState.only1Contact
        } else {
            return LoadingState.severalContacts
        }
    }
    
    var body: some View {
        VStack {
            switch loadingState {
            case .isEmpty:
                IsEmptyView()
            case .only1Contact:
                Only1ContactView()
            case .severalContacts:
                Text("Hello")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
