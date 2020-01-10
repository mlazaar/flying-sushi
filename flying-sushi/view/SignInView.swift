//
//  SignInView.swift
//  flying-sushi
//
//  Created by Mohammed Lazaar on 10/01/2020.
//  Copyright © 2020 ddd-project. All rights reserved.
//

import SwiftUI

struct AuthenticationScreen: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var loading = false
    @State var error = false
    
    @EnvironmentObject var session: SessionStore
    
    var body: some View {
        VStack {
            TextField("Email", text: $email).autocapitalization(.none)
            SecureField("Mot de passe", text: $password)
            if (error) {
                Text("ahhh crap")
            }
            Button(action: signIn) {
                Text("Sign in")
            }
        }.padding()
    }
    
    func signIn () {
           loading = true
           error = false
           session.signIn(email: email, password: password) { (result, error) in
               self.loading = false
               if error != nil {
                   self.error = true
               } else {
                   self.email = ""
                   self.password = ""
               }
           }
       }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationScreen().environmentObject(SessionStore())
    }
}
