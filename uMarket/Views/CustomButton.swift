//
//  CustomButton.swift
//  uMarket
//
//  Created by Roman Sakhnevych on 5/23/17.
//  Copyright © 2017 Roman Sakhnevych. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    //MARK: - Setup
    func setupUI() {
        self.layer.cornerRadius = 4
        self.layer.masksToBounds = false
        self.backgroundColor = UIColor.mainColor()
        self.tintColor = UIColor.white
        self.titleLabel?.font = UIFont(name: "Merriweather-Regular", size: 17)!
    }

}
