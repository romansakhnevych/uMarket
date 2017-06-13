//
//  OrdersViewController.swift
//  uMarket
//
//  Created by Roman Sakhnevych on 5/25/17.
//  Copyright © 2017 Roman Sakhnevych. All rights reserved.
//

import UIKit

class OrdersViewController: BaseViewController {

    let ordersToOrdersHistorySegueIdentifier = "ordersToOrdersHistorySegueIdentifier"
    let ordersToOrdersDetailsSegueIdentifier = "ordersToOrdersDetailsSegueIdentifier"
    let orderCellIdentifier = String.init(describing: OrderCell.self)
    var selectedIndexPath: IndexPath?
    var orders: [Order] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        let ordServ = OrderServices()
        orders = ordServ.getOrders()
    }

    override func viewWillDisappear(_ animated: Bool) {
        orders.remove(at: 0)
        tableView.reloadData()
        self.tabBarItem.badgeValue = "1"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "ORDERS"
        self.tabBarController?.navigationItem.rightBarButtonItem = nil
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setupTableView() {

        tableView.rowHeight = 130
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == ordersToOrdersDetailsSegueIdentifier {
            if let indexPath = selectedIndexPath {
                let order = orders[indexPath.row]
                let viewController = segue.destination as! OrderDetailsViewController
                viewController.order = order
            }
        }

    }
}

extension OrdersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: orderCellIdentifier, for: indexPath) as! OrderCell
        let order = orders[indexPath.row]
        cell.fillWithModel(model: order)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
        performSegue(withIdentifier: ordersToOrdersDetailsSegueIdentifier, sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.001
    }
}
