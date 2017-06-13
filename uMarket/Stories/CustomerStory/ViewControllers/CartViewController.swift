//
//  CartViewController.swift
//  uMarket
//
//  Created by Roman Sakhnevych on 5/2/17.
//  Copyright © 2017 Roman Sakhnevych. All rights reserved.
//

import UIKit

class CartViewController: BaseViewController {
    
    let productItemCellIdentifier = String.init(describing: ProductItemCell.self)
    var paymentVerified = false
    var deliveryInfoVerified = false
    
    @IBOutlet weak var tableView: UITableView!
    
    var cartItems: [ProductItem]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CART"
        setupTableView()
        getCartItems()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
  
    @IBAction func checkOut(_ sender: Any) {
        if paymentVerified == false {
            performSegue(withIdentifier: "pay", sender: self)
            paymentVerified = true
        } else if deliveryInfoVerified == false {
                performSegue(withIdentifier: "deliver", sender: self)
            deliveryInfoVerified = true
        } else {
         showAlertController(withTitle: "Success", message: "Thank you for your order!", completionHandler: {
            self.cartItems?.removeAll()
            self.tableView.reloadData()
         })
        }
    }
    
    
    //MARK: - Private
    private func getCartItems() {
        let productItemServices = ProductItemServices()
        cartItems = productItemServices.getCartItems()
        tableView.reloadData()
    }
    
    //MARK: - Setup
    private func setupTableView() {
        tableView.register(UINib.init(nibName: productItemCellIdentifier, bundle: Bundle.init(for: ProductItemCell.self)), forCellReuseIdentifier: productItemCellIdentifier)
        tableView.rowHeight = 130
    }
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItems!.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: productItemCellIdentifier, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let productItemCell = cell as! ProductItemCell
        let item = cartItems![indexPath.row]
        productItemCell.fillWithModel(model: item)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.001
    }
}
