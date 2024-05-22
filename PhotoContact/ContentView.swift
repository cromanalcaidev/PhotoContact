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
    
    @State private var contacts = [Contact]()
    
    var loadingState: LoadingState {
        if contacts.isEmpty {
            return LoadingState.isEmpty
        } else if contacts.count == 1 {
            return LoadingState.only1Pic
        } else {
            return LoadingState.severalPics
        }
    }
    
    var body: some View {
        VStack {
            switch loadingState {
            case .isEmpty:
                IsEmpty()
            case .only1Pic:
                Text("")
            case .severalPics:
                Text("")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
