//
//  UIColor+Extensions.swift
//  VK_app
//
//  Created by Nikolay Trofimov on 16.09.2020.
//  Copyright © 2020 Nikolay.Trofimov. All rights reserved.
//

import UIKit

// Flyweight
extension UIColor {
    public static var random: UIColor {
        let max = CGFloat(UInt32.max)
        let red = CGFloat(arc4random()) / max
        let green = CGFloat(arc4random()) / max
        let blue = CGFloat(arc4random()) / max
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    public static let brandVKColor = UIColor(red: 70.0, green: 128.0, blue: 194.0, alpha: 1.0)
    
}
