//
//  CategoryCell.swift
//  uMarket
//
//  Created by Roman Sakhnevych on 5/2/17.
//  Copyright © 2017 Roman Sakhnevych. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension CategoryCell {
    func fillWithModel(model: Category) {
        thumbImageView.image = UIImage(named: model.name!)!
        titleLabel.text = model.name!
    }
}
