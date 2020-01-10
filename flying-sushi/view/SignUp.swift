//
//  SignUp.swift
//  flying-sushi
//
//  Created by Mohammed Lazaar on 09/01/2020.
//  Copyright © 2020 ddd-project. All rights reserved.
//

import SwiftUI
import Firebase

struct SignUp: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    
    var body: some View {
        Group {
            VStack {
                HStack {
                    Text("Email")
                    TextField("Entrez une adresse email", text: $email)
                }
                .padding()
                HStack {
                    Text("Mot de passe")
                    TextField("Entrez un mot de passe", text: $password)
                }
                .padding()
                
                Button(action: signUp) {
                    Text("Inscription")
                }
            }
        }
        .padding()
    }
    
    func signUp() {
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
