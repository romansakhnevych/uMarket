//
//  ProductItem.swift
//  uMarket
//
//  Created by Roman Sakhnevych on 5/17/17.
//  Copyright © 2017 Roman Sakhnevych. All rights reserved.
//

import UIKit

class ProductItem: NSObject {
    var name: String?
    var shortDescription: String?
    var fullDescription: String?
    var price: String?
//    var feedbacks: [Feedback]?
    
    init(dictionary: [String:String]) {
        self.name = dictionary["name"]!
        self.shortDescription = dictionary["description"]!
        self.fullDescription = dictionary["fullDescription"]!
        self.price = dictionary["price"]!
//        self.feedbacks = Feedback.parseFeedbacks(array: dictionary["feedbacks"] as! [[String:String]])
        super.init()
    }
    
    class func parseItems(array: [[String:String]]) -> [ProductItem] {
        var items = [ProductItem]()
        for item in array {
            let productItem = ProductItem.init(dictionary: item)
            items.append(productItem)
        }
        return items
    }
}
