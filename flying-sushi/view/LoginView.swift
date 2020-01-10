//
//  LoginView.swift
//  flying-sushi
//
//  Created by Mohammed Lazaar on 09/01/2020.
//  Copyright © 2020 ddd-project. All rights reserved.
//

import SwiftUI
import UIKit


struct LoginView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    
    var body: some View {
        VStack(spacing: 20.0) {
            Text("Flying Sushi")
            TextField("Email", text: $email)
            SecureField("Mot de passe", text: $password)
          
        }
        .padding()
    }
    

}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
