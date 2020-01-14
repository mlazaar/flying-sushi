//
//  Order.swift
//  FlyingSushi
//
//  Created by Omair on 12/01/2020.
//  Copyright © 2020 comex. All rights reserved.
//

import Foundation

class Order: Identifiable {
    
    var idOrder = UUID()
    var orderItems = [OrderItem]()
    var priceOrder: Decimal
    var dateTimeOrder: Date
    
    init(orderItems: [OrderItem], priceOrder: Decimal) {
        self.orderItems = orderItems
        self.priceOrder = priceOrder
        self.dateTimeOrder = Date()
    }
    
}
