//
//  OrderDetailView.swift
//  FlyingSushi
//
//  Created by Omair on 12/01/2020.
//  Copyright © 2020 comex. All rights reserved.
//

import SwiftUI

struct OrderDetailView: View {
    
    var order: Order
    
    var body: some View {
        VStack {
            List(self.order.orderItems) { orderItem in
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(orderItem.nameItem)")
                        Text("\(orderItem.descriptionItem)")
                            .font(.system(size: 10))
                    }
                    Spacer()
                    Text("\(Util.getPriceToString(price: orderItem.priceItem))")
                }
            }
            Spacer()
            Text("\(getDateTimeToString(dateTimeOrder: self.order.dateTimeOrder))")
            Text("Total price : \(Util.getPriceToString(price: self.order.priceOrder))")
                .padding(10)
        }
        .navigationBarTitle("Order n°\(Util.getIdOrder(idOrder: self.order.idOrder))")
    }
    
    func getDateTimeToString(dateTimeOrder: Date) -> String {
        let calendar = Calendar.current
        let day = calendar.component(.day, from: dateTimeOrder)
        let month = calendar.component(.month, from: dateTimeOrder)
        let year = calendar.component(.year, from: dateTimeOrder)
        let hour = calendar.component(.hour, from: dateTimeOrder)
        let minutes = calendar.component(.minute, from: dateTimeOrder)
        let dateTimeString = "Ordered on \(day)/\(month)/\(year) at \(hour):\(minutes)"
        return dateTimeString
    }
    
    
}

//struct OrderDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        OrderDetailView()
//    }
//}
