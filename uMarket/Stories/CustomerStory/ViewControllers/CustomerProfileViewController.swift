//
//  CustomerProfileViewController.swift
//  uMarket
//
//  Created by Roman Sakhnevych on 5/2/17.
//  Copyright © 2017 Roman Sakhnevych. All rights reserved.
//

import UIKit

class CustomerProfileViewController: BaseViewController {
    
    let profileCellIdentifier = "ProfileCell"
    let titles = ["PAYMENT INFO", "DELIVERY INFO", "HISTORY"]
    
    let profileToPaymentInfoSegueIdentifier = "profileToPaymentInfoSegueIdentifier"
    let profileToDeliveryInfoSegueIdentifier = "profileToDeliveryInfoSegueIdentifier"
    let profileToHistorySegueIdentifier = "profileToHistorySegueIdentifier"
    
    @IBOutlet weak var userPhotoImageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Setup
    private func setupUI() {
        title = "PROFILE"
        userPhotoImageView.layer.cornerRadius = userPhotoImageView.frame.height / 2
        userPhotoImageView.layer.masksToBounds = true
    }
}

extension CustomerProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return titles.count
        case 1: return 1
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: profileCellIdentifier, for: indexPath)
        cell.textLabel?.font = UIFont(name: "Merriweather-Regular", size: 17)!
        var title: String!
        var imageName: String!
        switch indexPath.section {
        case 0:
            title = titles[indexPath.row]
            imageName = titles[indexPath.row]
            cell.textLabel?.textColor = UIColor.init(colorLiteralRed: 50.0/255.0, green: 50.0/255.0, blue: 50.0/255.0, alpha: 1)
        case 1:
            title = "LOGOUT"
            imageName = "LOGOUT"
            cell.textLabel?.textColor = UIColor.red
        default: print("udefined section")
        }
        cell.textLabel?.text = title
        cell.imageView?.image = UIImage.init(named: imageName)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            return
        }
        var identifier: String!
        switch indexPath.row {
        case 0:
            identifier = profileToPaymentInfoSegueIdentifier
        case 1:
            identifier = profileToDeliveryInfoSegueIdentifier
        case 2:
            identifier = profileToHistorySegueIdentifier
        default:
            print("undefined row")
        }
        
        self.performSegue(withIdentifier: identifier, sender: self)
    }
    
}
