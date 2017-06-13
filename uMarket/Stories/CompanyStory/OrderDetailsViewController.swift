//
//  OrderDetailsViewController.swift
//  uMarket
//
//  Created by Roman Sakhnevych on 5/30/17.
//  Copyright © 2017 Roman Sakhnevych. All rights reserved.
//

import UIKit

class OrderDetailsViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let placeholders = ["COUNTRY", "CITY", "STREET","BUILDING", "APPARTMENT","POSTCODE", "MOBILE", "E-MAIL", "ADDITIONAL INFO"]
    var order: Order!
    let prodcutItemCellIdentifier = String.init(describing: ProductItemCell.self)
    
    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib.init(nibName: prodcutItemCellIdentifier, bundle: Bundle.init(for: ProductItemCell.self)), forCellReuseIdentifier: prodcutItemCellIdentifier)
        setupUI()
    }
    
    @IBAction func complete(_ sender: Any) {
        showAlertController(withTitle: "", message: "Are you sure you want to complete this order?", okHandler: {
            self.navigationController?.popViewController(animated: true)
        }) { 
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupUI() {
        fullNameLabel.text = order.user!.fullName!
        usernameLabel.text = order.user!.username!
        userImageView.image = UIImage.init(named: order.user!.imageName!)
    }
}
extension OrderDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return placeholders.count
        } else {
            return order.items!.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: String.init(describing:OrderDetailCell.self), for: indexPath) as! OrderDetailCell
            cell.placeholderLabel.text = placeholders[indexPath.row] + ":"
            switch indexPath.row {
            case 0:
                cell.valueLabel.text = order.country!
            case 1:
                cell.valueLabel.text = order.city!
            case 2:
                cell.valueLabel.text = order.street!
            case 3:
                cell.valueLabel.text = order.building!
            case 4:
                cell.valueLabel.text = order.appartment!
            case 5:
                cell.valueLabel.text = order.postcode!
            case 6:
                cell.valueLabel.text = order.mobile!
            case 7:
                cell.valueLabel.text = order.email!
            case 8:
                cell.valueLabel.text = order.additionalInfo!
            default:
                print("unexpected row")
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: prodcutItemCellIdentifier, for: indexPath) as! ProductItemCell
            let item = order.items![indexPath.row]
            cell.fillWithModel(model: item)
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.001
    }
}
