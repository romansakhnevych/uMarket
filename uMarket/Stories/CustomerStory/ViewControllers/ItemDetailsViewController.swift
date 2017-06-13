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
    let images = ["Business folio", "bf2", "bf3"]
    var canAdd = false
    
    
    @IBOutlet weak var pageControl: UIPageControl!
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
        collectionView.register(UINib.init(nibName: itemPhotoCellIdentifier, bundle: Bundle.init(for: ItemPhotoCell.self)), forCellWithReuseIdentifier: itemPhotoCellIdentifier)
        collectionViewHeightConstraint.constant = view.frame.width/1.8
        view.layoutIfNeeded()
    }
    
    private func setupTableView() {
        tableView.register(UINib.init(nibName: itemDetailsViewIdentifier, bundle: Bundle.init(for: ItemDetailsView.self)), forHeaderFooterViewReuseIdentifier: itemDetailsViewIdentifier)
    }
    
    func showAlert()  {
        showAlertControllerCart(withTitle: "", message: "Item was added to cart", okHandler: nil) {
           
            let tbc = self.navigationController?.tabBarController
            
            self.navigationController?.popToRootViewController(animated: true)
        
        }
    }
    
    func showLogin() {
        let signInController = UIStoryboard.init(name: "Login", bundle: Bundle.main).instantiateViewController(withIdentifier: "lvc")
        self.present(signInController, animated: true) { 
            self.canAdd = true
        }
        
    }
}

//MARK: - Collection view data source and delegate
extension ItemDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: itemPhotoCellIdentifier, for: indexPath) as! ItemPhotoCell
        cell.imageView.image = UIImage.init(named: images[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.row
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

extension ItemDetailsViewController: ItemDetailsViewDelegate {
    func didAddItem() {
        if canAdd {
        self.showAlert()
        } else {
            self.showLogin()
        }
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
        var headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: itemDetailsViewIdentifier) as? ItemDetailsView
        if headerView == nil {
            headerView = ItemDetailsView.loadFromNib()
        }
        headerView?.delegate = self
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
