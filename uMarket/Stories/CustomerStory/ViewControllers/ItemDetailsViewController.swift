//
//  ItemDetailsViewController.swift
//  uMarket
//
//  Created by Roman Sakhnevych on 5/22/17.
//  Copyright © 2017 Roman Sakhnevych. All rights reserved.
//

import UIKit

class ItemDetailsViewController: BaseViewController {

    let itemPhotoCellIdentifier = String.init(describing: ItemPhotoCell.self)
    let itemDetailsViewIdentifier = String.init(describing: ItemDetailsView.self)
    let feedbackCellIdentifier = String.init(describing: FeedbackCell.self)
    
    var productItem: ProductItem!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Setup
    private func setupCollectionView() {
        collectionViewHeightConstraint.constant = view.frame.width/1.8
        view.layoutIfNeeded()
    }
    
    private func setupTableView() {
        tableView.register(UINib.init(nibName: itemDetailsViewIdentifier, bundle: Bundle.init(for: ItemDetailsView.self)), forHeaderFooterViewReuseIdentifier: itemDetailsViewIdentifier)
    }
}

//MARK: - Collection view data source and delegate
extension ItemDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: itemPhotoCellIdentifier, for: indexPath)
        return cell
    }
}

//MARK: - Collection view flow layout delegate
extension ItemDetailsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

//MARK: - Table view data source, delegate
extension ItemDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productItem.feedbacks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: feedbackCellIdentifier, for: indexPath) as! FeedbackCell
        let feedback = productItem.feedbacks[indexPath.row]
        cell.fillWithModel(model: feedback)

        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: itemDetailsViewIdentifier)
        if headerView == nil {
            headerView = ItemDetailsView.loadFromNib()
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView = view as! ItemDetailsView
        headerView.fillWithModel(model: productItem)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 400
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
}
