//
//  BaseViewController.swift
//  uMarket
//
//  Created by Roman Sakhnevych on 4/24/17.
//  Copyright © 2017 Roman Sakhnevych. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - IBActions
    @IBAction func backAction(sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
