//
//  IsEmptyView.swift
//  PhotoContact
//
//  Created by Carlos Román Alcaide on 24/5/24.
//

import SwiftUI

struct IsEmptyView: View {
    @State private var enableAddContact = false
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Add \n a contact", action: addContact)
            .frame(width: 140, height: 140)
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .overlay(
                Circle()
                    .stroke(.blue)
                    .scaleEffect(animationAmount)
                    .opacity(2 - animationAmount)
                    .animation(
                        .easeOut(duration: 1.4)
                            .repeatForever(autoreverses: false),
                        value: animationAmount
                    )
            )
            .onAppear {
                animationAmount = 2
            }
            .sheet(isPresented: $enableAddContact) {
                AddContactView()
            }
    }
    
    func addContact() {
        enableAddContact.toggle()
    }
}

#Preview {
    IsEmptyView()
}
