//
//  SeveralContactsView.swift
//  PhotoContact
//
//  Created by Carlos Román Alcaide on 25/5/24.
//

import SwiftUI

struct SeveralContactsView: View {
    
    let myContacts = [
        Contact(id: UUID(), name: "Joe Pera 1", phoneNumber: 333),
        Contact(id: UUID(), name: "Joe Pera 2", pic: Image("joecitoPera"), phoneNumber: 3334413212),
        Contact(id: UUID(), name: "Joe Pera 3", pic: Image("joecitoPera"), phoneNumber: 33334112312)
    ]
    
    var body: some View {
        VStack {
            List {
                ForEach(myContacts) { myContact in
                    HStack {
                        if myContact.pic != nil {
                            myContact.pic?
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .clipShape(.circle)
                            
                        }
                        Text(myContact.name)
                    }
                }
            }
        }
    }
}

#Preview {
    SeveralContactsView()
}
