//
//  HistoryViewController.swift
//  uMarket
//
//  Created by Roman Sakhnevych on 5/25/17.
//  Copyright © 2017 Roman Sakhnevych. All rights reserved.
//

import UIKit

class HistoryViewController: BaseViewController {
    
    var historyItems: [ProductItem] = []
    let productItemCellIdentifier = String.init(describing: ProductItemCell.self)

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getHistoryItems()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Private
    private func getHistoryItems() {
        let productItemServices = ProductItemServices()
        historyItems = productItemServices.getWishItems()
        tableView.reloadData()
    }
    
    //MARK: - Setup
    private func setupTableView() {
        tableView.register(UINib.init(nibName: productItemCellIdentifier, bundle: Bundle.init(for: ProductItemCell.self)), forCellReuseIdentifier: productItemCellIdentifier)
        tableView.rowHeight = 130
    }
    
}


extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyItems.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: productItemCellIdentifier, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let productItemCell = cell as! ProductItemCell
        let item = historyItems[indexPath.row]
        productItemCell.fillWithModel(model: item)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.001
    }
}
