//
//  OrderServices.swift
//  uMarket
//
//  Created by Roman Sakhnevych on 5/29/17.
//  Copyright © 2017 Roman Sakhnevych. All rights reserved.
//

import UIKit

class OrderServices: NSObject {

    func getOrders() -> [Order] {
        var items = [Order]()
        if let path = Bundle.main.path(forResource: "OrderItems", ofType: "plist") {
            if let array = NSArray(contentsOfFile: path) as? [[String: Any]] {
                for item in array {
                    let pitem = Order.init(dictionary: item)
                    items.append(pitem)
                }
            }
        }
        return items

    }
}
