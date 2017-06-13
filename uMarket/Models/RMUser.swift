//
//  RMUser.swift
//  uMarket
//
//  Created by Roman Sakhnevych on 6/6/17.
//  Copyright © 2017 Roman Sakhnevych. All rights reserved.
//

import UIKit
import RealmSwift

class RMUser: Object {

    dynamic var id = UUID().uuidString
    dynamic var username = ""
    dynamic var fullName = ""
    dynamic var password = ""
}
