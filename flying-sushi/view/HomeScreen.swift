//
//  AuthenticationScreen.swift
//  flying-sushi
//
//  Created by Mohammed Lazaar on 10/01/2020.
//  Copyright © 2020 ddd-project. All rights reserved.
//

import SwiftUI
import os.log

struct SignInView: View{
    @State var email: String = ""
    @State var password: String = ""
    @State var displayName: String = ""
    @State var loading = false
    @State var error = false
    
    @EnvironmentObject var session: SessionStore
    @ObservedObject private var keyboard = KeyboardGuardian()
    
    
    var body: some View {
        ZStack{
            Color.backgroundColor.edgesIgnoringSafeArea(.all)
            VStack(alignment: .center) {
                // LOGO
                Image("signin")
                    .resizable()
                    .cornerRadius(70)
                    .frame(width: 200,height: 200)
                    .offset(y:-60)
                
                HStack {
                    Text("Sign")
                        .font(.system(size: 25, weight: .heavy, design: .default))
                        .foregroundColor(.white)
                        .padding(.bottom)
                    Text("In")
                        .font(.system(size: 25, weight: .heavy, design: .default))
                        .foregroundColor(.buttonColor)
                        .padding(.bottom)
                }
                
                TextField("E-mail address", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .cornerRadius(13)
                    .autocapitalization(.none)
                    .padding()
                
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .cornerRadius(13)
                    .autocapitalization(.none)
                    .padding()
                
                Button(action: signIn) {
                    Text("Sign In").padding()
                        .font(.system(size: 25, weight: .heavy, design: .default))
                        .foregroundColor(.white)
                }
                .frame(width: 300)
                .background(Color.buttonColor)
                .cornerRadius(20)
                .offset(y:50)
            }
        }        .padding(.bottom, keyboard.currentHeight)
            .animation(.easeOut(duration: 0.16))
        
        
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


struct SignUpView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var displayName: String = ""
    @State var loading = false
    @State var error = false
    
    
    private var validated: Bool {
        !password.isEmpty
    }
    
    @EnvironmentObject var session: SessionStore
    @ObservedObject private var keyboard = KeyboardGuardian()
    
    
    
    var body: some View {
        ZStack{
            Color.backgroundColor.edgesIgnoringSafeArea(.all)
            VStack(alignment: .center) {
                Image("signup")
                    .resizable()
                    .cornerRadius(70)
                    .frame(width: 200,height: 200)
                    .offset(y:-60)
                HStack {
                    Text("Create")
                        .font(.system(size: 25, weight: .heavy, design: .default))
                        .foregroundColor(.white)
                        .padding(.bottom)
                    Text("an account")
                        .font(.system(size: 25, weight: .heavy, design: .default))
                        .foregroundColor(.buttonColor)
                        .padding(.bottom)
                }
                TextField("E-mail address", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .cornerRadius(13)
                    .autocapitalization(.none)
                    .padding()
                TextField("Name", text: $displayName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .cornerRadius(13)
                    .autocapitalization(.none)
                    .padding()
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .cornerRadius(13)
                    .autocapitalization(.none)
                    .padding()
                
                
                Button(action: signUp) {
                    Text("Sign Up").padding()
                        .font(.system(size: 25, weight: .heavy, design: .default))
                        .foregroundColor(.white)
                }
                .frame(width: 300)
                .background(Color.buttonColor)
                .cornerRadius(20)
                .offset(y:30)
                
                
                
            }
        }
        .padding(.bottom, keyboard.currentHeight)
        .animation(.easeOut(duration: 0.16))
        
        
        
    }
    
    
    func signUp () {
        loading = true
        error = false
        session.signUp(email: email, displayName: displayName, password: password) { (result, error) in
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


struct HomeScreen: View {
    
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
                          NavigationLink(destination: SignUpView()) {
                              Text("Sign Up").padding()
                                  .font(.system(size: 25, weight: .heavy, design: .default))
                                  .foregroundColor(.white)
                          }
                          .frame(width: 300)
                          .background(Color.buttonColor)
                          .cornerRadius(20)
                          .offset(y:30)
                        
                
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
                                NavigationLink(destination: SignInView()) {
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
}

struct AuthenticationScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
}
