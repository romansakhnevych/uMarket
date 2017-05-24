//
//  CompanyCell.swift
//  uMarket
//
//  Created by Roman Sakhnevych on 5/13/17.
//  Copyright © 2017 Roman Sakhnevych. All rights reserved.
//

import UIKit

class CompanyCell: UITableViewCell {

    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension CompanyCell {
    func fillWithModel(model: Company) {
        thumbImageView.image = UIImage.init(named: model.name!)
        nameLabel.text = model.name!
        shortDescriptionLabel.text = model.companyDescriptions!
    }
}
