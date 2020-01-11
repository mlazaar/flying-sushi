//
//  ContentView.swift
//  flying-sushi
//
//  Created by Mohammed Lazaar on 09/01/2020.
//  Copyright © 2020 ddd-project. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    
    @EnvironmentObject var session: SessionStore

    var body: some View {
        Group {
            if(session.session != nil) {
                AppView()
            } else {
                HomeScreen()
            }
        }.onAppear(perform: getUser)
    }
    
    
    func getUser(){
        session.listen()
    }
}

struct ContentView_Previews: PreviewProvider {
    @EnvironmentObject var session: SessionStore

    
    static var previews: some View {
        ContentView().environmentObject(SessionStore())
    }
}
