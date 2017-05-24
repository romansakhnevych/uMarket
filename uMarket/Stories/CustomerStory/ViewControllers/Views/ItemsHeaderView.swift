//
//  ItemsHeaderView.swift
//  uMarket
//
//  Created by Roman Sakhnevych on 5/22/17.
//  Copyright © 2017 Roman Sakhnevych. All rights reserved.
//

import UIKit

class ItemsHeaderView: UITableViewHeaderFooterView {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var feedbacksButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var thumbImageView: UIImageView!

    class func loadFromNib() -> ItemsHeaderView {
        return UINib(nibName: String(describing: ItemsHeaderView.self), bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! ItemsHeaderView
    }
    
}


extension ItemsHeaderView {
    
    func fillWithModel(model: Company) {
        nameLabel.text = model.name!
        thumbImageView.image = UIImage.init(named: model.name!)
        descriptionLabel.text = model.companyDescriptions!
    }
}
