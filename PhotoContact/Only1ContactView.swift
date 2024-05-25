//
//  Only1ContactView.swift
//  PhotoContact
//
//  Created by Carlos Román Alcaide on 24/5/24.
//

import SwiftUI

struct Only1ContactView: View {
    @State private var enableAddContact = false
    let contacts = Contacts()
    
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
                    Image("joecitoPera")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .clipShape(.circle)
                        .padding()
                    
                    Text("Joe Pera")
                        .font(.system(size: 20))
                }
            }
            .toolbar {
                ToolbarItem {
                    Button("Add more contacts", systemImage: "plus.circle.fill") {
                        enableAddContact.toggle()
                    }
                }
            }
        }
    }
}

#Preview {
    Only1ContactView()
}
