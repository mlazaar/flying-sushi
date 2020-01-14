//
//  OrderItemView.swift
//  FlyingSushi
//
//  Created by Omair on 10/01/2020.
//  Copyright © 2020 comex. All rights reserved.
//

import SwiftUI
import os.log

struct ItemView: View {
    
    var orderItem: OrderItem
    @EnvironmentObject var cart: Cart
    @State var showAlert = false
    
    var body: some View {
        return VStack {
            HStack {
                Image("\(self.orderItem.photoItem)")
                    .resizable()
                    .frame(width: 90, height: 90, alignment: .leading)
                VStack(alignment: .leading) {
                    Text("\(self.orderItem.nameItem)")
                        .padding(.top, 10)
                    Text("\(self.orderItem.descriptionItem)")
                        .font(.system(size: 12))
                    Spacer()
                    HStack {
                        Text("\(Util.getPriceToString(price: self.orderItem.priceItem))")
                            .font(.system(size: 14))
                            .padding(.bottom, 10)
                        Spacer()
                        Button(action: {
                            self.cart.addToCart(orderItem: self.orderItem)
                            self.showAlert = true
                        }) {
                            Text("Add to cart")
                                .font(.system(size: 14))
                                .foregroundColor(.blue)
                                .padding(.bottom, 10)
                        }.alert(isPresented: $showAlert) {
                            Alert(title: Text(""), message: Text("\(self.orderItem.nameItem) added to cart."), dismissButton: .default(Text("Got it!")))
                        }
                    }
                }
            }
        }
    }
    
}

//struct OrderItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        OrderItemView()
//    }
//}
