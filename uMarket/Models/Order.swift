//
//  Order.swift
//  uMarket
//
//  Created by Roman Sakhnevych on 5/29/17.
//  Copyright © 2017 Roman Sakhnevych. All rights reserved.
//

import UIKit

class Order: NSObject {
    var user: User?
    var country: String?
    var city: String?
    var street: String?
    var building: String?
    var appartment: String?
    var postcode: String?
    var mobile: String?
    var email: String?
    var additionalInfo: String?
    var items: [ProductItem]?
    
    init(dictionary:[String:Any]) {
        self.user = User(dictionary: dictionary["user"] as! [String: Any])
        self.country = dictionary["country"] as? String
        self.city = dictionary["city"] as? String
        self.street = dictionary["street"] as? String
        self.building = dictionary["building"] as? String
        self.appartment = dictionary["appartment"] as? String
        self.postcode = dictionary["postcode"] as? String
        self.mobile = dictionary["mobile"] as? String
        self.email = dictionary ["email"] as? String
        self.additionalInfo = dictionary["additionalInfo"] as? String
        self.items = ProductItem.parseItems(array: (dictionary["items"]) as! Array<ProductItem>)
        super.init()
    }
}

