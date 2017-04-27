//
//  Products.swift
//  Simple-Shopping-Cart
//
//  Created by Md Asif Huda on 4/26/16.
//  Copyright © 2016 Md Asif Huda. All rights reserved.
//

import Foundation

class Products {
    
    class func dowloandNewProducts() -> [ProductModel]
    {
        
        let iPad = ProductModel(name: "iPad Pro", price: 599.0, quantity: 0, quantityMax: 5)
        
        let appleWatch = ProductModel(name: "Apple Watch", price: 399.0, quantity: 0, quantityMax: 2)
        
        let appleTv = ProductModel(name: "Apple TV", price: 299.0, quantity: 0, quantityMax: 10)
        
        return [iPad, appleWatch, appleTv]
        
    }
}
