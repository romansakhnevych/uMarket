//
//  SignInViewController.swift
//  uMarket
//
//  Created by Roman Sakhnevych on 5/30/17.
//  Copyright © 2017 Roman Sakhnevych. All rights reserved.
//

import UIKit

class SignInViewController: BaseViewController {

    var userRole: UserRole?
    
    @IBAction func login(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
