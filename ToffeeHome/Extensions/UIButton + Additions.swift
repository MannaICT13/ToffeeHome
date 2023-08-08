//
//  UIButton + Additions.swift
//  ToffeeHome
//
//  Created by Khaled on 8/8/23.
//

import UIKit

extension UIButton {
    func setBorder(cornerRadius: CGFloat, borderWidth: CGFloat = 1.0) {
        layer.borderWidth = borderWidth
        layer.cornerRadius = cornerRadius
        layer.borderColor = tintColor.cgColor
        clipsToBounds = true
    }
    
}
