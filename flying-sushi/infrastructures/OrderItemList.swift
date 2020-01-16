//
//  OrderItemList.swift
//  FlyingSushi
//
//  Created by Omair on 09/01/2020.
//  Copyright © 2020 comex. All rights reserved.
//

import Foundation
import Firebase

class OrderItemList {
    
    let orderItemList: [OrderItem] = [
            OrderItem(nameItem: "Avocado Cheese Maki", descriptionItem: "x6 pieces", priceItem: 3.90, photoItem: "maki-cheese-avocat"),
            OrderItem(nameItem: "California Shrimp Tempura", descriptionItem: "x6 pieces", priceItem: 6.70, photoItem: "california-ebi-tempura"),
            OrderItem(nameItem: "California Fresh Salmon", descriptionItem: "x6 pieces", priceItem: 6.20, photoItem: "california-fresh-salmon"),
            OrderItem(nameItem: "Chicken Katsu California", descriptionItem: "x6 pieces", priceItem: 6.50, photoItem: "chicken-katsu-california"),
            OrderItem(nameItem: "Salmon Aburi Roll", descriptionItem: "x6 pieces", priceItem: 6.90, photoItem: "salmon-aburi-roll"),
            OrderItem(nameItem: "California Salmon Avocado", descriptionItem: "x6 pieces", priceItem: 5.70, photoItem: "california-saumon-avocat"),
            OrderItem(nameItem: "Salmon Sushi", descriptionItem: "x2 pieces", priceItem: 3.90, photoItem: "saumon"),
            OrderItem(nameItem: "Teriyaki Chicken Poke Bowl", descriptionItem: "peanuts / arugula / teriyaki sauce / sesame / edamame / chicken / vegetables", priceItem: 14.90, photoItem: "poke-bowl-poulet-teriyaki"),
            OrderItem(nameItem: "Salmon Maki", descriptionItem: "x6 pieces", priceItem: 5.20, photoItem: "maki-saumon"),
            OrderItem(nameItem: "Plain rice", descriptionItem: "Plain rice, the perfect accompaniment for your maki and sushi.", priceItem: 2.50, photoItem: "riz-nature")
    ]
    private var ref: DatabaseReference = Database.database().reference()

    
}
