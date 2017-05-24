//
//  ProductItemsViewController.swift
//  uMarket
//
//  Created by Roman Sakhnevych on 5/20/17.
//  Copyright © 2017 Roman Sakhnevych. All rights reserved.
//

import UIKit

class ProductItemsViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let productItemCellIdentifier = String.init(describing: ProductItemCell.self)
    let itemsHeaderViewIdentifier = String.init(describing: ItemsHeaderView.self)
    let productItemsToItemDetailsSegueIdentifier = "productItemsToItemDetailsSegueIdentifier"
    
    var company: Company!
    var selectedIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Setup
    private func setupTableView() {
        tableView.rowHeight = 130
        tableView.register(UINib.init(nibName: itemsHeaderViewIdentifier, bundle: Bundle.init(for: ItemsHeaderView.self)), forHeaderFooterViewReuseIdentifier: itemsHeaderViewIdentifier)
        tableView.register(UINib.init(nibName: productItemCellIdentifier, bundle: Bundle.init(for: ProductItemCell.self)), forCellReuseIdentifier: productItemCellIdentifier)
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == productItemsToItemDetailsSegueIdentifier {
            if let indexPath = selectedIndexPath {
                let viewController = segue.destination as! ItemDetailsViewController
                let item = company.items![indexPath.row]
                viewController.productItem = item
            }
        }
    }
}

extension ProductItemsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return company.items!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: productItemCellIdentifier, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let productItemCell = cell as! ProductItemCell
        let productItem = company.items![indexPath.row]
        productItemCell.fillWithModel(model: productItem)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: itemsHeaderViewIdentifier)
        if headerView == nil {
            headerView = ItemsHeaderView.loadFromNib()
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView = view as! ItemsHeaderView
        headerView.fillWithModel(model: company)
        headerView.layoutIfNeeded()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
        self.performSegue(withIdentifier: productItemsToItemDetailsSegueIdentifier, sender: self)
    }
}
