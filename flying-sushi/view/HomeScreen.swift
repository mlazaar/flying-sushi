//
//  AuthenticationScreen.swift
//  flying-sushi
//
//  Created by Mohammed Lazaar on 10/01/2020.
//  Copyright © 2020 ddd-project. All rights reserved.
//

import SwiftUI
import os.log

extension Color {
    static let backgroundColor = Color("backgroundColor")
    static let buttonColor = Color("buttonColor")
}


struct SignUpView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var displayName: String = ""
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
            TextField("Name", text: $displayName)
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
        session.signUp(email: email, displayName: displayName, password: password) { (result, error) in
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





struct HomeScreen: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var loading = false
    @State var error = false
    
    @EnvironmentObject var session: SessionStore
    
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.backgroundColor.edgesIgnoringSafeArea(.all)
                VStack(alignment: .center){
                    Image("logo")
                        .cornerRadius(70)
                        .frame(width: 100.0)
                    
                    Group{
                        VStack {
                            HStack {
                                Text("Flying")
                                    .font(.system(size: 25, weight: .heavy, design: .default))
                                    .foregroundColor(.white)
                                Text("Sushi")
                                    .font(.system(size: 25, weight: .heavy, design: .default))
                                    .foregroundColor(.buttonColor)
                            }
                            Button(action: signIn) {
                                Text("Sign Up").padding()
                                    .font(.system(size: 25, weight: .heavy, design: .default))
                                    .foregroundColor(.white)
                            }.frame(width: 300)
                                .background(Color.buttonColor)
                                .cornerRadius(20)
                                .offset(y:50)
                        }
                        
                    }
                    Spacer()
                    
                    Section{
                        VStack{
                            Divider()
                                .frame(width: 100.0)
                            HStack{
                                Text("Already signed in ?")
                                    .font(.footnote)
                                    .foregroundColor(.white)
                                NavigationLink(destination: SignUpView()) {
                                    Text("Sign in.").font(.footnote)
                                        .foregroundColor(.buttonColor)
                                }
                            }
                        }
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

struct AuthenticationScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
