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
                VStack {
                    List {
                        ForEach(mySampleContacts) { myContact in
                            HStack {
                                VStack {
                                    Text(myContact.name)
                                        .font(.system(size: 18))
                                        .fontWeight(.bold)
                                    
                                    Text(myContact.phoneNumber, format: .number.grouping(.never))
                                    
                                }
                                
                            }
                        }
                    }
                }
                .navigationTitle("My contacts")
            } else if myContacts.contactList.isEmpty == false {
                VStack {
//                    List {
//                        ForEach(myContacts.contactList) { myContact in
//                            HStack {
//                                if myContact.pic != nil {
//                                    myContact.pic?
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(width: 50, height: 50)
//                                        .clipShape(.circle)
//                                    
//                                }
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
                }
                .navigationTitle("My contacts")
            }
        }
        
    }
}

#Preview {
    SeveralContactsView()
}
