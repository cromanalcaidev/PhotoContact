//
//  Only1ContactView.swift
//  PhotoContact
//
//  Created by Carlos Román Alcaide on 24/5/24.
//

import SwiftUI

struct Only1ContactView: View {
    let contacts = Contacts()
    
    var body: some View {
        VStack {
            Section {
                Text("Congrats, your 1st contact is...")
                    .font(.title)
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
            }
        }
    }
}

#Preview {
    Only1ContactView()
}
