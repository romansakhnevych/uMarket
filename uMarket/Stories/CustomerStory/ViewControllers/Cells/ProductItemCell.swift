//
//  ProductItemCell.swift
//  uMarket
//
//  Created by Roman Sakhnevych on 5/20/17.
//  Copyright © 2017 Roman Sakhnevych. All rights reserved.
//

import UIKit

class ProductItemCell: UITableViewCell {
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension ProductItemCell {
    func fillWithModel(model: ProductItem) {
        thumbImageView.image = UIImage.init(named: model.name!)
        nameLabel.text = model.name!
        shortDescriptionLabel.text = model.shortDescription!
        priceLabel.text = model.price!
    }
}
