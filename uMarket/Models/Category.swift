//
//  Category.swift
//  uMarket
//
//  Created by Roman Sakhnevych on 5/18/17.
//  Copyright © 2017 Roman Sakhnevych. All rights reserved.
//

import UIKit

class Category: NSObject {
    var name: String?
    var companies: [Company]
    
    init(dictionary: [String:Any]) {
        self.name = dictionary["name"] as? String
        self.companies = Company.parseCompanies(array: dictionary["companies"] as! [[String : Any]])
    }
}
