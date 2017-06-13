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
    var imageView: UIImageView!

    @IBOutlet weak var tv: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tv.selectRow(at: IndexPath(row:0, section: 0), animated: true, scrollPosition: .top)
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
            let imageView = UIImageView(frame: CGRect(x: (cell.frame.width) - 45, y: 8, width: 30, height: 30))
            imageView.image = #imageLiteral(resourceName: "check")
            self.imageView = imageView
            cell.addSubview(imageView)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        let imageView = UIImageView(frame: CGRect(x: (cell?.frame.width)! - 45, y: 8, width: 30, height: 30))
            imageView.image = #imageLiteral(resourceName: "check")
            self.imageView = imageView
        cell?.addSubview(imageView)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        self.imageView.removeFromSuperview()
    }
}
