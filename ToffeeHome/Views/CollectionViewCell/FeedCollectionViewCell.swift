//
//  FeedCollectionViewCell.swift
//  ToffeeHome
//
//  Created by Khaled on 8/8/23.
//

import UIKit

class FeedCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var bottomView: UIView!
    @IBOutlet private weak var sessionDetailLabel: UILabel!
    @IBOutlet private weak var feedImageView: UIImageView!
    @IBOutlet weak var runtimeLabel: UILabel!
    
    static let reuseIdentifier = "FeedCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bottomView.roundBottomCorners(radius: 12.0)
    }
}
