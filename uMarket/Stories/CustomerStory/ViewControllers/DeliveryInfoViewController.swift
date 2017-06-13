//
//  DeliveryInfoViewController.swift
//  uMarket
//
//  Created by Roman Sakhnevych on 5/25/17.
//  Copyright © 2017 Roman Sakhnevych. All rights reserved.
//

import UIKit

class DeliveryInfoViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let placeholders = ["COUNTRY", "CITY", "STREET","BUILDING", "APPARTMENT","POSTCODE", "MOBILE", "E-MAIL", "ADDITIONAL INFO"]
    let array = ["Ukraine", "Lviv", "Shevchenka", "40", "6", "79045", "0938475839", "roman@gmail.com", ""]
    let simpleTextFieldCellIdentifier = String.init(describing: SimpleTextFieldCell.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Setup
    private func setupTableView() {
        tableView.register(UINib.init(nibName: simpleTextFieldCellIdentifier, bundle: Bundle.init(for: SimpleTextFieldCell.self)), forCellReuseIdentifier: simpleTextFieldCellIdentifier)
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableViewAutomaticDimension
    }
}

extension DeliveryInfoViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeholders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: simpleTextFieldCellIdentifier, for: indexPath) as! SimpleTextFieldCell
        cell.textField.placeholder = placeholders[indexPath.row]
        cell.textField.text = array[indexPath.row]
        return cell
    }
}
