//
//  CategoriesViewController.swift
//  uMarket
//
//  Created by Roman Sakhnevych on 4/24/17.
//  Copyright © 2017 Roman Sakhnevych. All rights reserved.
//

import UIKit
import FirebaseDatabase

class CategoriesViewController: BaseViewController {
    //MARK: - Constants
    let categoryCellIdentifier = String.init(describing: CategoryCell.self)
    let categoriesToCompaniesSegueIdentifier = "categoriesToCompaniesSegueIdentifier"
    var selectedIndexPath: IndexPath?
    var categories: [Category]!
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
//    let categories = ["Leather Goods", "Women's Accesories", "Furniture"]
    //MARK: - Properties
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "CATEGORIES"
        setupTableView()
        getCategories()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Setup
    private func setupTableView() {
        tableView.rowHeight = view.frame.width / 1.8
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == categoriesToCompaniesSegueIdentifier {
            if let indexPath = selectedIndexPath {
                let viewController = segue.destination as! CompaniesViewController
                let category = categories[indexPath.row]
                viewController.category = category
            }
        }
        
    }
    
    //MARK: - DataSource
    private func getCategories() {
        let categoryServices = CategoryServices()
        categories = categoryServices.getCategoriesFromPlist()
        tableView.reloadData()
    }
}

//MARK: - Table view
extension CategoriesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: categoryCellIdentifier, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let categoryCell = cell as! CategoryCell
        let category = categories[indexPath.row]
        categoryCell.fillWithModel(model: category)
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
        performSegue(withIdentifier: categoriesToCompaniesSegueIdentifier, sender: self)
    }
    
}
