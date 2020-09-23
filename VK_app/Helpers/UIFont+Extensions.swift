//
//  UIFont+Extensions.swift
//  VK_app
//
//  Created by Nikolay Trofimov on 16.09.2020.
//  Copyright © 2020 Nikolay.Trofimov. All rights reserved.
//

import UIKit

// Flyweight
extension UIFont {
    public static var regular: UIFont {
        return systemFont(ofSize: 17, weight: .regular)
    }
    
    public static var medium: UIFont {
        return UIFont.systemFont(ofSize: 17, weight: .medium)
    }

}
