//
//  AddEditItemViewController.swift
//  uMarket
//
//  Created by Roman Sakhnevych on 5/25/17.
//  Copyright © 2017 Roman Sakhnevych. All rights reserved.
//

import UIKit

class AddEditItemViewController: BaseViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let itemPhotoCellIdentifier = String.init(describing: ItemPhotoCell.self)
    var item: ProductItem?

    
    @IBOutlet weak var itemName: UITextField!
    @IBOutlet weak var itemPrice: UITextField!
    @IBOutlet weak var itemDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Setup
    private func setupCollectionView() {
        collectionView.register(UINib.init(nibName: itemPhotoCellIdentifier, bundle: Bundle.init(for: ItemPhotoCell.self)), forCellWithReuseIdentifier: itemPhotoCellIdentifier)
    }
    
    private func setupUI() {
        title = "ITEM"
        if let it = item {
            itemName.text = it.name!
            itemPrice.text = it.price!
            itemDescription.text = it.fullDescription!
        } else {
            itemName.text = ""
            itemPrice.text = "0"
        }
        
    }
}

//MARK: - Collection view data source and delegate
extension AddEditItemViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if item != nil {
              return 2
        } else {
            return 1
        }
      
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: itemPhotoCellIdentifier, for: indexPath) as! ItemPhotoCell
        if indexPath.row == 0 {
            cell.imageView.image = UIImage.init(named: "add")
        } else {
            cell.imageView.image = UIImage.init(named: (item?.name!)!)
        }
        return cell
    }
}

//MARK: - Collection view flow layout delegate
extension AddEditItemViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
