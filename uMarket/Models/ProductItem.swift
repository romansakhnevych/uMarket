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
    var feedbacks: [Feedback] = []
    
    init(dictionary: [String:Any]) {
        self.name = dictionary["name"]! as? String
        self.shortDescription = dictionary["description"]! as? String
        self.fullDescription = dictionary["fullDescription"]! as? String
        self.price = dictionary["price"]! as? String
        self.feedbacks = Feedback.parseFeedbacks(array: dictionary["feedbacks"] as! [[String:String]])
        super.init()
    }
    
    class func parseItems(array: Array<AnyObject>) -> [ProductItem] {
        var items = [ProductItem]()
        for item in array {
            let productItem = ProductItem.init(dictionary: item as! [String : Any])
            items.append(productItem)
        }
        return items
    }
}
