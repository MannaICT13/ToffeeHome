//
//  UIView + Additions.swift
//  ToffeeHome
//
//  Created by Khaled on 8/8/23.
//

import UIKit

extension UIView {
    func roundBottomCorners(radius: CGFloat, frame: CGRect? = nil) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
        self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
}

