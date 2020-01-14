//
//  OrderItemList.swift
//  FlyingSushi
//
//  Created by Omair on 09/01/2020.
//  Copyright © 2020 comex. All rights reserved.
//

import Foundation

class OrderHistoryList: ObservableObject {
    
    @Published var orderHistory = [Order]()
    
    init() { }
    
    func addOrderHistory(order: Order) {
        self.orderHistory.append(order)
    }
    
}
