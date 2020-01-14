//
//  CartView.swift
//  FlyingSushi
//
//  Created by Omair on 10/01/2020.
//  Copyright © 2020 comex. All rights reserved.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var cart: Cart
    @State var showAlert = false
    @EnvironmentObject var orderHistory: OrderHistoryList
    @State var isPresented: Bool = false
    
    var body: some View {
        return VStack {
            List(self.cart.orderItems) { orderItem in
                VStack {
                    HStack {
                        
                        Image("\(orderItem.photoItem)")
                            .resizable()
                            .frame(width: 50, height: 50, alignment: .leading)
                        VStack(alignment: .leading) {
                            Text("\(orderItem.nameItem)")
                            Text("\(orderItem.descriptionItem)")
                                .font(.system(size: 10))
                        }
                        Spacer()
                        Text("\(Util.getPriceToString(price: orderItem.priceItem))")
                    }
                }
            }.onAppear {
                UITableView.appearance().separatorStyle = .none
            }
            .onDisappear {
                UITableView.appearance().separatorStyle = .singleLine
            }
            VStack {
                HStack {
                    Spacer()
                    Text("Total price : \(Util.getPriceToString(price: self.cart.getCartPrice()))")
                        .padding(10)
                }
                HStack {
                    Spacer()
                    Button("Order") {
                        if (self.cart.getCartPrice() != 0.0) {
                            let order = Order(orderItems: self.cart.orderItems, priceOrder: self.cart.getCartPrice())
                            self.orderHistory.addOrderHistory(order: order)
                            
                            self.cart.reinitCart()
                            self.showAlert = true
                        }
                    }.alert(isPresented: self.$showAlert) {
                        Alert(title: Text(""), message: Text("Ordered."), dismissButton: .default(Text("Got it!")))
                    }.padding(.bottom, 10).padding(.trailing, 10)
                }
            }
        }
    }
    
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
