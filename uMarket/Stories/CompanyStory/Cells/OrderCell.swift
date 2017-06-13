//
//  OrderCell.swift
//  uMarket
//
//  Created by Roman Sakhnevych on 5/28/17.
//  Copyright © 2017 Roman Sakhnevych. All rights reserved.
//

import UIKit

class OrderCell: UITableViewCell {
    
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var deliveryInfoLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension OrderCell {
    func fillWithModel(model: Order) {
        photoImageView.image = UIImage.init(named: model.user!.imageName!)
        usernameLabel.text = model.user!.username!
        deliveryInfoLabel.text = model.country! + ", " + model.city! + ", " + model.street! + ", "  + model.building! + "/" + model.appartment!
        totalPriceLabel.text = "399 ГРН"
    }
}
