//
//  ProductItemServices.swift
//  uMarket
//
//  Created by Roman Sakhnevych on 5/23/17.
//  Copyright © 2017 Roman Sakhnevych. All rights reserved.
//

import UIKit

class ProductItemServices: NSObject {

    func getCartItems() -> [ProductItem] {
        var items = [ProductItem]()
        if let path = Bundle.main.path(forResource: "CartItems", ofType: "plist") {
            if let array = NSArray(contentsOfFile: path) as? [[String: Any]] {
                for item in array {
                    let pitem = ProductItem.init(dictionary: item)
                    items.append(pitem)
                }
            }
        }
        return items
    }
    
    func getWishItems() -> [ProductItem] {
        var items = [ProductItem]()
        if let path = Bundle.main.path(forResource: "WishItems", ofType: "plist") {
            if let array = NSArray(contentsOfFile: path) as? [[String: Any]] {
                for item in array {
                    let pitem = ProductItem.init(dictionary: item)
                    items.append(pitem)
                }
            }
        }
        return items
    }
}
