//
//  SeveralContactsView.swift
//  PhotoContact
//
//  Created by Carlos Román Alcaide on 25/5/24.
//

import iPhoneNumberField
import SwiftUI

struct SeveralContactsView: View {
    
    
    let myContacts = Contacts()
    
    let mySampleContacts = [
        Contact(id: UUID(), name: "Joe Pera 1", phoneNumber: 333),
        Contact(id: UUID(), name: "Joe Pera 2", phoneNumber: 3334413212),
        Contact(id: UUID(), name: "Joe Pera 3", phoneNumber: 33334112312)
    ]
    
    var body: some View {
        NavigationStack {
            if myContacts.contactList.isEmpty == true {
                Text("Emtpy list")
//                VStack {
//                    List {
//                        ForEach(mySampleContacts) { myContact in
//                            HStack {
//                                VStack {
//                                    Text(myContact.name)
//                                        .font(.system(size: 18))
//                                        .fontWeight(.bold)
//                                    
//                                    Text(myContact.phoneNumber, format: .number.grouping(.never))
//                                    
//                                }
//                                
//                            }
//                        }
//                    }
//                }
//                .navigationTitle("My contacts")
            } else if myContacts.contactList.isEmpty == false {
                VStack {
                    Text("Full list")
//                    List {
//                        ForEach(myContacts.contactList, id: \.id) { myContact in
//                            HStack {
//                                VStack {
//                                    Text(myContact.name)
//                                        .font(.system(size: 18))
//                                        .fontWeight(.bold)
//                                    
//                                    Text(myContact.phoneNumber, format: .number.grouping(.never))
//                                    
//                                    if myContact.pic != nil {
//                                        if let uiImage = UIImage(data: myContact.pic!) {
//                                            Image(uiImage: uiImage)
//                                                .resizable()
//                                                .scaledToFill()
//                                                .frame(width: 250, height: 250, alignment: .center)
//                                                .clipShape(.circle)
//                                        }
//                                    }
//                                }
//                            }
//                        }
//                    }
                }
                .navigationTitle("My contacts")
            }
        }
    }
}

#Preview {
    SeveralContactsView()
}
