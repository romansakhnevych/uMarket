//
//  CompaniesHeaderView.swift
//  uMarket
//
//  Created by Roman Sakhnevych on 5/16/17.
//  Copyright © 2017 Roman Sakhnevych. All rights reserved.
//

import UIKit

class CompaniesHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var companyNameLabel: UILabel!
    
    class func loadFromNib() -> CompaniesHeaderView {
        return UINib(nibName: String(describing: CompaniesHeaderView.self), bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! CompaniesHeaderView
    }

}

extension CompaniesHeaderView {
    func fillWithModel(model: Category) {
        thumbImageView.image = UIImage.init(named: model.name!)
        companyNameLabel.text = model.name!
    }
}
