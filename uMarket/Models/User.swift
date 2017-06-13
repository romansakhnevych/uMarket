//
//  User.swift
//  uMarket
//
//  Created by Roman Sakhnevych on 5/29/17.
//  Copyright © 2017 Roman Sakhnevych. All rights reserved.
//

import UIKit

class User: NSObject {

    var username: String?
    var fullName: String?
    var imageName: String?
    
    init(dictionary: [String:Any]) {
        self.username = dictionary["username"] as? String
        self.fullName = dictionary["fullName"] as? String
        self.imageName = dictionary["imageName"] as? String
        super.init()
    }
    
}
