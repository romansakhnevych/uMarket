//
//  ItemDetailsView.swift
//  uMarket
//
//  Created by Roman Sakhnevych on 5/23/17.
//  Copyright © 2017 Roman Sakhnevych. All rights reserved.
//

import UIKit

protocol ItemDetailsViewDelegate : class {
    func didAddItem()
}

class ItemDetailsView: UITableViewHeaderFooterView {
    
    weak var delegate: ItemDetailsViewDelegate?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fullDescriptionLabel: UILabel!
    @IBOutlet weak var priceLabel
    : UILabel!
    
    @IBOutlet weak var add: CustomButton!
    class func loadFromNib() -> ItemDetailsView {
        return UINib(nibName: String(describing: ItemDetailsView.self), bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! ItemDetailsView
    }
    
    @IBAction func add(_ sender: Any) {
        delegate?.didAddItem()
    }
    override func awakeFromNib() {
        contentView.backgroundColor = UIColor.white
    }
}

extension ItemDetailsView {
    func fillWithModel(model: ProductItem) {
        nameLabel.text = model.name!
        fullDescriptionLabel.text = model.fullDescription!
        priceLabel.text = model.price!
    }
}
