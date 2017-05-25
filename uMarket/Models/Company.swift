//
//  Company.swift
//  uMarket
//
//  Created by Roman Sakhnevych on 5/17/17.
//  Copyright © 2017 Roman Sakhnevych. All rights reserved.
//

import UIKit

class Company: NSObject {

    var name: String?
    var companyDescriptions: String?
    var items: [ProductItem]?
    
    init(dictionary: [String : Any]) {
        self.name = dictionary["name"] as? String
        self.companyDescriptions = dictionary["description"] as? String
        self.items = ProductItem.parseItems(array: dictionary["items"] as! Array<AnyObject> )
    }
    
    class func parseCompanies(array: [[String:Any]]) -> [Company] {
        var companies = [Company]()
        for companyItem in array {
            let company = Company.init(dictionary: companyItem)
            companies.append(company)
        }
        return companies
    }
}

