//
//  OrderItem.swift
//  FlyingSushi
//
//  Created by Omair on 10/01/2020.
//  Copyright © 2020 comex. All rights reserved.
//

import Foundation

class OrderItem: Identifiable {
    
    var id = UUID()
    var nameItem: String
    var descriptionItem: String
    var priceItem: Decimal
    var photoItem: String
    
    init(nameItem: String, descriptionItem: String, priceItem: Decimal, photoItem: String) {
        self.nameItem = nameItem
        self.descriptionItem = descriptionItem
        self.priceItem = priceItem
        self.photoItem = photoItem
    }
    
}
