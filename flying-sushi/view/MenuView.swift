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
                Image(systemName: "person.circle.fill")
                    .foregroundColor(.buttonColor)
                    .imageScale(.large)
                Text("Profile")
                    .foregroundColor(.buttonColor)
                    .font(.headline)
                    .padding(.leading)

            }
            .padding(.top, 100)
            HStack {
                Image(systemName: "bag.fill")
                    .foregroundColor(.backgroundColor)
                    .imageScale(.small)
                NavigationLink(destination: OrderHistoryView()
                ) {
                    Text("Orders")
                        .foregroundColor(.buttonColor)
                        .font(.headline)                 }
                    .padding(.leading)
                    .navigationBarTitle("Orders")
                
            }
            .padding(.top, 30)
            HStack {
                Image(systemName: "cart.fill")
                    .foregroundColor(.buttonColor)
                    .imageScale(.large)
                NavigationLink(destination: CartView()
                ) {
                    Text("Cart")
                        .foregroundColor(.buttonColor)
                        .font(.headline)                 }
                    .navigationBarTitle("Cart")
                    .padding(.leading)
                
                
            }
            .padding(.top, 30)
            HStack {
                Image(systemName: "power")
                    .foregroundColor(.buttonColor)
                    .imageScale(.large)
                
                Button(action: {
                    withAnimation{
                        self.logout()
                    }
                    
                }) {
                    Text("Logout")
                        .foregroundColor(.buttonColor)
                        .font(.headline)                }
                
            }
            .padding(.top, 30)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.backgroundColor)
        .edgesIgnoringSafeArea(.all)
    }
    
    func logout(){
        session.signOut()
    }
}
