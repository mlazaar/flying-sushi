//
//  MenuView.swift
//  flying-sushi
//
//  Created by Mohammed Lazaar on 13/01/2020.
//  Copyright © 2020 ddd-project. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var session: SessionStore
    
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "bag.fill")
                    .imageScale(.large)
                NavigationLink(destination: OrderHistoryView()
                ) {
                    Text("Orders")
                    }
                    .padding(.leading)
                    .navigationBarTitle("Orders")
                
            }
            .padding(.top, 100)
            HStack {
                Image(systemName: "cart.fill")
                    .imageScale(.large)
                NavigationLink(destination: CartView()
                ) {
                    Text("Cart")
                }
                    .navigationBarTitle("Cart")
                    .padding(.leading)
                
            }
            .padding(.top, 30)
            HStack {
                Image(systemName: "power")
                    .imageScale(.large)
                
                Button(action: {
                    withAnimation{
                        self.logout()
                    }
                    
                }) {
                    Text("Logout")
                }.padding(.leading)
            }
            .padding(.top, 30)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .edgesIgnoringSafeArea(.all)
    }
    
    func logout(){
        session.signOut()
    }
}
