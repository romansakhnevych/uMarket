//
//  PaymentInfoViewController.swift
//  uMarket
//
//  Created by Roman Sakhnevych on 5/25/17.
//  Copyright © 2017 Roman Sakhnevych. All rights reserved.
//

import UIKit

class PaymentInfoViewController: BaseViewController {
    
    let paymentCellIdentifier = "PaymentCell"

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension PaymentInfoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: paymentCellIdentifier, for: indexPath)
        cell.textLabel?.font = UIFont(name: "Merriweather-Regular", size: 17)!
        if indexPath.row == 0 {
            cell.textLabel?.text = "5168 **** **** **72"
            cell.imageView?.image = UIImage.init(named: "PAYMENT INFO")
        } else {
            cell.textLabel?.text = "CASH"
            cell.imageView?.image = UIImage.init(named: "cash")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.001
    }
}
