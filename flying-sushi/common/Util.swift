//
//  Util.swift
//  FlyingSushi
//
//  Created by Omair on 12/01/2020.
//  Copyright © 2020 comex. All rights reserved.
//

import Foundation

class Util {
    
    static func getPriceToString(price: Decimal) -> String {
        var priceToString = NSDecimalNumber(decimal: price).stringValue
        if priceToString.count >= 3 {
            priceToString = priceToString + "0 $"
        }
        else if priceToString.count <= 2 {
            priceToString = priceToString + ".00 $"
        }
        return priceToString
    }
    
    static func getIdOrder(idOrder: UUID) -> String {
        return idOrder.uuidString.components(separatedBy: "-")[0]
    }
    
}
