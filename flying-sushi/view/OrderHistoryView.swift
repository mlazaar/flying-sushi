//
//  OrderHistoryView.swift
//  FlyingSushi
//
//  Created by Omair on 12/01/2020.
//  Copyright © 2020 comex. All rights reserved.
//

import SwiftUI
import CoreData

struct OrderHistoryView: View {
    
    @EnvironmentObject var orderHistory: OrderHistoryList
        
    var body: some View {
        return VStack {
            List(self.orderHistory.orderHistory) { order in
                NavigationLink(destination: OrderDetailView(order: order)) {
                    VStack {
                        HStack {
                            Text("Order n°\(Util.getIdOrder(idOrder: order.idOrder))")
                            Spacer()
                            Text("\(Util.getPriceToString(price: order.priceOrder))")
                        }
                    }
                }
            }
        }
    }
    
}

struct OrderHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        OrderHistoryView()
    }
}
