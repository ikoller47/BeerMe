//
//  UIColor+Utils.swift
//  BeerMe
//
//  Created by Ian Koller on 5/30/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    static var navigationBar: UIColor {
        return UIColor.white
    }
    
    static var navigationBarText: UIColor {
        return UIColor(red: 255.0/255.0, green: 69.0/255.0, blue: 90.0/255.0, alpha: 1.0)
    }
    
    static var selectedCellColor: UIColor {
        return UIColor(red: 240/255.0, green: 240/255.0, blue:240/255.0, alpha: 1.0)
    }
    
    static var cellDividerColor: UIColor {
        return UIColor(red: 228/255.0, green: 228/255.0, blue:228/255.0, alpha: 1.0)
    }
    
    static var placeholderGray: UIColor {
        return UIColor(red: 0, green: 0, blue: 0.0980392, alpha: 0.22)
    }
}
