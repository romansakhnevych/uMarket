//
//  CompanyProfileViewController.swift
//  uMarket
//
//  Created by Roman Sakhnevych on 5/25/17.
//  Copyright © 2017 Roman Sakhnevych. All rights reserved.
//

import UIKit

class CompanyProfileViewController: BaseViewController {

    var company: Company?
    
    @IBOutlet weak var companyCoverImageView: UIImageView!
    @IBOutlet weak var companyNameTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getCompany()
        setupUI()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "COMPANY"
        self.tabBarController?.navigationItem.rightBarButtonItem = nil
    }
    
    func setupUI() {
        companyCoverImageView.image = UIImage.init(named: company!.name!)
        companyNameTextField.text = company!.name!
        descriptionTextView.text = company!.companyDescriptions!
    }
    
    func getCompany() {
        let categoryServices = CategoryServices()
        let array = categoryServices.getCategoriesFromPlist()
        company = array[0].companies[0]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
