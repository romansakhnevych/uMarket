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

//MARK: - Alert view
extension UIViewController {
    func showAlertController(withTitle title: String, message: String, completionHandler: (() -> ())?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
            if completionHandler != nil {
                completionHandler?()
            }
        }
        
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func showAlertController(withTitle title: String, message: String, okHandler: (() -> ())?, cancelHandler: (() -> ())?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            if okHandler != nil {
                okHandler?()
            }
        }
        
        let cancelAction = UIAlertAction(title:"Cancel", style: .cancel) { (action) in
            if cancelHandler != nil {
                cancelHandler?()
            }
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func showAlertControllerCart(withTitle title: String, message: String, okHandler: (() -> ())?, addToCartHandler: (() -> ())?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            if okHandler != nil {
                okHandler?()
            }
        }
        
        let cancelAction = UIAlertAction(title:"GO TO CART", style: .default) { (action) in
            if addToCartHandler != nil {
                addToCartHandler?()
            }
        }
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
}
