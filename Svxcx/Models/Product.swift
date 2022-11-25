//
//  Product.swift
//  Svxcx
//
//  Created by Vardhan Chopada on 11/24/22.
//

import Foundation

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var price: Int
}

var productList = [Product(name: "1", image: "I1", price: 54),
                   Product(name: "1", image: "I2", price: 23),
                   Product(name: "1", image: "I3", price: 44),
                   Product(name: "1", image: "I4", price: 74),
                   Product(name: "1", image: "I5", price: 97),
                   Product(name: "1", image: "I6", price: 89)]
                    
