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
    
    let savePath = URL.documentsDirectory.appending(path: "SavedContacts")
    
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            contactList = try JSONDecoder().decode([Contact].self, from: data)
        } catch {
            contactList = []
        }
        
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(contactList)
            try data.write(to: savePath)
        } catch {
            print("Unable to save data.")
        }
    }
    
}
