//
//  Product.swift
//  ApplePay
//
//  Created by Vladyslav Tsykhmistro on 10.02.2020.
//  Copyright © 2020 Vladyslav Tsykhmistro. All rights reserved.
//

import UIKit

struct Product: Equatable {
    var imageName: String
    var title: String
    var price: Int
    
    static func ==(lhs: Product, rhs: Product) -> Bool {
        return lhs.imageName == rhs.imageName && lhs.title == rhs.title && lhs.price == rhs.price
    }
    
}
