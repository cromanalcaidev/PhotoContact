//
//  Contacts.swift
//  PhotoContact
//
//  Created by Carlos Román Alcaide on 24/5/24.
//

import Foundation
import SwiftUI

@Observable
class Contacts {
    var contactList = [Contact]() {
        didSet {
            save()
        }
    }
    
    let savePath = URL.documentsDirectory.appending(path: "SavedPlaces")
    
    let myContacts = [
        Contact(id: UUID(), name: "Joe Pera 1", pic: Image("joecitoPera"), phoneNumber: 333),
        Contact(id: UUID(), name: "Joe Pera 2", pic: Image("joecitoPera"), phoneNumber: 3334413212),
        Contact(id: UUID(), name: "Joe Pera 3", pic: Image("joecitoPera"), phoneNumber: 33334112312)
    ]
    
    func save() {
//        do {
//            let data = try JSONEncoder().encode(contactList)
//            try data.write(to: savePath)
//        }
    }
    
}
