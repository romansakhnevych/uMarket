//
//  LoginButton.swift
//  uMarket
//
//  Created by Roman Sakhnevych on 5/30/17.
//  Copyright © 2017 Roman Sakhnevych. All rights reserved.
//

import UIKit

class LoginButton: CustomButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 3
        self.layer.cornerRadius = 6
        layer.borderColor = UIColor.white.cgColor
    }

}
