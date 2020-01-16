//
//  CheckoutView.swift
//  flying-sushi
//
//  Created by Mohammed Lazaar on 16/01/2020.
//  Copyright © 2020 ddd-project. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    
    @EnvironmentObject var cart: Cart
    @EnvironmentObject var orderHistory: OrderHistoryList
    @Environment(\.presentationMode) var presentationMode

    
    
    static let paymentTypes = ["Cash", "Credit Card", "Paypal", "Nature"]
    static let droneTypes = ["Phantom", "Mavic Pro", "Apple Fly", "Android Shit"]
    
    @State private var paymentType = 0
    @State private var droneType = 0
    @State private var showingPaymentAlert = false
    
    var body: some View {
        Form{
            Section{
                Picker ("How do you want to pay ?", selection: $paymentType){
                    ForEach(0 ..< Self.paymentTypes.count){
                        Text(Self.paymentTypes[$0])
                    }
                }
                
            }
            Section(header: Text("Which drone do you want to use (faster to the left) ?").font(.footnote)){
                Picker ("Drone :?", selection: $droneType){
                    ForEach(0 ..< Self.droneTypes.count){
                        Text(Self.droneTypes[$0])
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Total \(Util.getPriceToString(price: self.cart.getCartPrice()))")) {
                    Button("Confirm Order"){
                        self.showingPaymentAlert.toggle()
                    }
            }
            .navigationBarTitle("Payment", displayMode: .inline)
            .alert(isPresented: $showingPaymentAlert) {
                Alert(title: Text("Delete book"), message: Text("Are you sure?"), primaryButton: .default(Text("Thanks")) {
                    let order = Order(orderItems: self.cart.orderItems, priceOrder: self.cart.getCartPrice())
                    self.orderHistory.addOrderHistory(order: order)
                    self.presentationMode.wrappedValue.dismiss()
                    self.cart.reinitCart()

                    }, secondaryButton: .cancel()
                )
            }
        }
        
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
    }
}
