//
//  FeedCollectionViewCell.swift
//  ToffeeHome
//
//  Created by Khaled on 8/8/23.
//

import UIKit

class FeedCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var bottomView: UIView!
    
    static let reuseIdentifier = "FeedCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bottomView.roundBottomCorners(radius: 12.0)
    }
}
