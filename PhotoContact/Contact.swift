//
//  Contact.swift
//  PhotoContact
//
//  Created by Carlos Román Alcaide on 22/5/24.
//

import Foundation
import SwiftUI

struct Contact {
    let name: String
    var pic: Image
}

enum LoadingState {
    case isEmpty, only1Pic, severalPics
}
