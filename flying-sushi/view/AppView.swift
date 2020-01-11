//
//  AppView.swift
//  flying-sushi
//
//  Created by Mohammed Lazaar on 10/01/2020.
//  Copyright © 2020 ddd-project. All rights reserved.
//

import SwiftUI

struct AppView: View {
    
    @EnvironmentObject var session: SessionStore
    
    var body: some View {
        
        ZStack{
            VStack{
                
                HStack(spacing: 20.0){
                    Text("Hello, \(String(session.session!.email ?? " App"))")
                    Button(action: logout) {
                        Text("Logout")
                    }.foregroundColor(.red)
                }
            }
        }
    }
    
    func logout(){
        session.signOut()
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView().environmentObject(SessionStore())
    }
}
