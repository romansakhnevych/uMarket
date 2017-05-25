//
//  FeedbackCell.swift
//  uMarket
//
//  Created by Roman Sakhnevych on 5/24/17.
//  Copyright © 2017 Roman Sakhnevych. All rights reserved.
//

import UIKit

class FeedbackCell: UITableViewCell {

    @IBOutlet weak var authorPictureImageView: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var feedbackLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        authorPictureImageView.layer.cornerRadius = authorPictureImageView.frame.height / 2
        authorPictureImageView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension FeedbackCell {
    func fillWithModel(model: Feedback) {
        self.authorNameLabel.text = model.authorName!
        self.authorPictureImageView.image = UIImage.init(named: model.authorImageName!)
        self.feedbackLabel.text = model.feedback!
    }
}
