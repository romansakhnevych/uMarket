//
//  WishListViewController.swift
//  uMarket
//
//  Created by Roman Sakhnevych on 5/2/17.
//  Copyright © 2017 Roman Sakhnevych. All rights reserved.
//

import UIKit

class WishListViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let productItemCellIdentifier = String.init(describing: ProductItemCell.self)
    var wishItems: [ProductItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "WISH LIST"
        setupTableView()
        getWishItems()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Private
    private func getWishItems() {
        let productItemServices = ProductItemServices()
        wishItems = productItemServices.getWishItems()
        tableView.reloadData()
    }
    
    //MARK: - Setup
    private func setupTableView() {
        tableView.register(UINib.init(nibName: productItemCellIdentifier, bundle: Bundle.init(for: ProductItemCell.self)), forCellReuseIdentifier: productItemCellIdentifier)
        tableView.rowHeight = 130
    }

}


extension WishListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wishItems.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: productItemCellIdentifier, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let productItemCell = cell as! ProductItemCell
        let item = wishItems[indexPath.row]
        productItemCell.fillWithModel(model: item)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.001
    }
}
