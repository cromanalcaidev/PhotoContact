//
//  Contact.swift
//  PhotoContact
//
//  Created by Carlos Román Alcaide on 22/5/24.
//

import Foundation
import SwiftUI

struct Contact: Codable, Identifiable {
    let id: UUID
    let name: String
    var pic: Data?
    let phoneNumber: Int
    
//    #if DEBUG
//    static let example = Contact(id: UUID(), name: "Joe Pera", pic: Image("joecitoPera"), phoneNumber: 0034616428065)
//    #endif
    
}

enum LoadingState {
    case isEmpty, only1Contact, severalContacts
}


