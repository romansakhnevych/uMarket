//
//  BaseTabBarController.swift
//  uMarket
//
//  Created by Roman Sakhnevych on 5/2/17.
//  Copyright © 2017 Roman Sakhnevych. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        customizeUi()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - UI
    
    private func customizeUi() {
        setupSelectedItemBackground()
        setupTabBarTints()
    }
    
    private func setupSelectedItemBackground() {
        let numberOfItems = CGFloat(tabBar.items!.count)
        let tabBarItemSize = CGSize(width: tabBar.frame.width / numberOfItems, height: tabBar.frame.height)
        tabBar.selectionIndicatorImage = UIImage.imageWithColor(color: UIColor.mainColor(), size: tabBarItemSize).resizableImage(withCapInsets: UIEdgeInsets.zero)
        tabBar.frame.size.width = self.view.frame.width + 4
        tabBar.frame.origin.x = -2
    }
    
    private func setupTabBarTints() {
        tabBar.tintColor = UIColor.white
    }
}

