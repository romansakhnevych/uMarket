//
//  CategoryServices.swift
//  uMarket
//
//  Created by Roman Sakhnevych on 5/18/17.
//  Copyright © 2017 Roman Sakhnevych. All rights reserved.
//

import UIKit

class CategoryServices: NSObject {
    
    func getCategoriesFromPlist() -> [Category] {
        var categories = [Category]()
        if let path = Bundle.main.path(forResource: "DataSource", ofType: "plist") {
            if let array = NSArray(contentsOfFile: path) as? [[String: Any]] {
                for categoryItem in array {
                    let category = Category.init(dictionary: categoryItem)
                    categories.append(category)
                }
            }
        }
        return categories
    }
}
