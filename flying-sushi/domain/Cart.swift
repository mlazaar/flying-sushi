//
//  Cart.swift
//  FlyingSushi
//
//  Created by Omair on 10/01/2020.
//  Copyright © 2020 comex. All rights reserved.
//

import Foundation
import os.log

class Cart: ObservableObject {

    @Published var orderItems = [OrderItem]()
    
    init() { }
    
    func addToCart(orderItem: OrderItem) {
        self.orderItems.append(orderItem)
    }
    
    func getCartPrice() -> Decimal {
        var cartPrice: Decimal = 0.0
        for orderItem in self.orderItems {
            cartPrice += orderItem.priceItem
        }
        return cartPrice
    }
    
    func reinitCart() {
        self.orderItems = [OrderItem]()
    }
    
}
