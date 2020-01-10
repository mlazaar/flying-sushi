//
//  AuthenticationScreen.swift
//  flying-sushi
//
//  Created by Mohammed Lazaar on 10/01/2020.
//  Copyright © 2020 ddd-project. All rights reserved.
//

import SwiftUI


struct SignUpView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var loading = false
    @State var error = false
    
    @EnvironmentObject var session: SessionStore
    
    var body: some View {
        let nav = VStack(alignment: .center) {
            Text("Create an account")
                .font(.title)
                .padding(.horizontal)
                .padding(.vertical)
            TextField("E-mail address", text: $email)
                .autocapitalization(.none)
                .padding()
            SecureField("Password", text: $password)
                .padding()
            
            Button(action: signUp) {
                Text("Sign Up")
            }.foregroundColor(.red)
            
            Divider()
        }.padding()
        
        return nav
    }
    
    func signUp () {
        print("sign me up")
        loading = true
        error = false
        session.signUp(email: email, password: password) { (result, error) in
            self.loading = false
            if error != nil {
                print("\(String(describing: error))")
                self.error = true
            } else {
                self.email = ""
                self.password = ""
            }
        }
    }
}


struct SignInView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var loading = false
    @State var error = false
    
    @EnvironmentObject var session: SessionStore
    
    var body: some View {
        
        VStack {
            
            Spacer()
            Group {
                Image("Image")
                    .resizable()
                    .scaledToFit()
                    .frame(width:75, height:75)
                
                Text("Flying Sushi")
                    .font(.title)
                    .padding(.bottom)
            }
            Divider()
            
            TextField("E-mail address", text: $email)
                .autocapitalization(.none)
                .padding()
            SecureField("Password", text: $password)
                .padding()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("Sign in")
            }
            
            Spacer()
            
            VStack {
                Divider()
                HStack(alignment: .center) {
                    Text("Don't have an account?")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    
                    NavigationLink(destination: SignUpView()) {
                        Text("Sign up.").font(.footnote)
                    }
                }
                .padding()
            }
            
        }
        
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


struct AuthenticationScreen: View {
    var body: some View {
        NavigationView{
            SignInView()
        }
    }
    
}

struct AuthenticationScreen_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationScreen()
    }
}
