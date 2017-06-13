//
//  SignUpViewController.swift
//  uMarket
//
//  Created by Roman Sakhnevych on 5/30/17.
//  Copyright © 2017 Roman Sakhnevych. All rights reserved.
//

import UIKit

enum UserRole {
    case customer
    case company
}

class SignUpViewController: BaseViewController {
    
    var userRole: UserRole?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
