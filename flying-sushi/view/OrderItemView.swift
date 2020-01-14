//
//  OrderItemView.swift
//  FlyingSushi
//
//  Created by Omair on 12/01/2020.
//  Copyright © 2020 comex. All rights reserved.
//

import SwiftUI

struct OrderItemView: View {
    
    var orderItemList = OrderItemList()
    
    var body: some View {
        VStack {
            List(orderItemList.orderItemList) { orderItem in
                ItemView(orderItem: orderItem)
            }
        }
    }
}

struct OrderItemView_Previews: PreviewProvider {
    static var previews: some View {
        OrderItemView()
    }
}
