//
//  ItemsViewController.swift
//  uMarket
//
//  Created by Roman Sakhnevych on 5/25/17.
//  Copyright © 2017 Roman Sakhnevych. All rights reserved.
//

import UIKit

class ItemsViewController: BaseViewController {
    
    let itemsToAddEditItemSegueIdentifier = "itemsToAddEditItemSegueIdentifier"
    let prodcutItemCellIdentifier = String.init(describing: ProductItemCell.self)
    
    var selectedIndexPath: IndexPath?
    var items: [ProductItem] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "ITEMS"
        self.tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(addAction(_:)))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARKL: - Private
    private func getItems() {
        let categoryServices = CategoryServices()
        let array = categoryServices.getCategoriesFromPlist()
        let items = array[0].companies[0].items!
        self.items = items
        tableView.reloadData()
    }
    //MARK: - Setup
    private func setupTableView() {
        tableView.register(UINib.init(nibName: prodcutItemCellIdentifier, bundle: Bundle.init(for: ProductItemCell.self)), forCellReuseIdentifier: prodcutItemCellIdentifier)
        tableView.rowHeight = 130
    }
    
    //MARK: - Actions
    @IBAction func addAction(_ sender: Any) {
        performSegue(withIdentifier: itemsToAddEditItemSegueIdentifier, sender: self)
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == itemsToAddEditItemSegueIdentifier {
            if let indexPath = selectedIndexPath {
                let item = items[indexPath.row]
                let viewController = segue.destination as! AddEditItemViewController
                viewController.item = item
            }
        }
    }
    
}

extension ItemsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: prodcutItemCellIdentifier, for: indexPath) as! ProductItemCell
        let productitem = items[indexPath.row]
        cell.fillWithModel(model: productitem)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
        self.performSegue(withIdentifier: itemsToAddEditItemSegueIdentifier, sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.001
    }
}
