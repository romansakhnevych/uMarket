//
//  StartViewController.swift
//  uMarket
//
//  Created by Roman Sakhnevych on 6/6/17.
//  Copyright © 2017 Roman Sakhnevych. All rights reserved.
//

import UIKit

class StartViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "login" {
            let vc = segue.destination as! SignInViewController
            vc.userRole = UserRole.company
        }
    }

}
