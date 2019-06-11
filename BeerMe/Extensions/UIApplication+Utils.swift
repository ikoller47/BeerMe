//
//  UIApplication+Utils.swift
//  BeerMe
//
//  Created by Ian Koller on 6/6/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import UIKit

extension UIApplication {
    func tryURL(urls: [URL]) {
        for url in urls {
            if self.canOpenURL(url) {
                self.open(url, options: [:], completionHandler: nil)
                return
            }
        }
    }
}
