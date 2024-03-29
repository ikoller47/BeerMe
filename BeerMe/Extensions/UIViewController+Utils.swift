//
//  UIViewController+Utils.swift
//  BeerMe
//
//  Created by Ian Koller on 5/29/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func addChildToView(_ viewController: UIViewController) {
        viewController.view.frame = view.frame
        view.addSubview(viewController.view)
        viewController.didMove(toParent: self)
        addChild(viewController)
    }
    
    func hideKeyboardOnTap() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
