//
//  CompaniesViewController.swift
//  uMarket
//
//  Created by Roman Sakhnevych on 5/13/17.
//  Copyright © 2017 Roman Sakhnevych. All rights reserved.
//

import UIKit

class CompaniesViewController: BaseViewController {
    
    let companyCellIdentifier = String.init(describing: CompanyCell.self)
    let companiesHeaderViewIdentifier = String.init(describing: CompaniesHeaderView.self)
    let companiesToItemsSegueIdentifier = "companiesToItemsSegueIdentifier"
    //temp
    var category: Category!
    var selectedIntexPath: IndexPath?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Setup
    private func setupTableView() {
        tableView.rowHeight = 130
        tableView.register(UINib.init(nibName: companiesHeaderViewIdentifier, bundle: Bundle.init(for: CompaniesHeaderView.self)), forHeaderFooterViewReuseIdentifier: companiesHeaderViewIdentifier)
    }
    
    //MARK: - Navigation 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == companiesToItemsSegueIdentifier {
            let viewController = segue.destination as! ProductItemsViewController
            if let indexPath = selectedIntexPath {
                let company = category.companies[indexPath.row]
                viewController.company = company
            }
        }
    }
}

extension CompaniesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.companies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: companyCellIdentifier, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var view = tableView.dequeueReusableHeaderFooterView(withIdentifier: companiesHeaderViewIdentifier)
        if view == nil {
            view = CompaniesHeaderView.loadFromNib()
        }
        return view;
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView = view as! CompaniesHeaderView
        headerView.fillWithModel(model: category)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let companyCell = cell as! CompanyCell
        let company = category.companies[indexPath.row]
        companyCell.fillWithModel(model: company)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIntexPath = indexPath
        performSegue(withIdentifier: companiesToItemsSegueIdentifier, sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return view.frame.width / 1.8
    }
}
