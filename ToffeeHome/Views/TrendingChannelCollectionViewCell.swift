//
//  TrendingChannelCollectionViewCell.swift
//  ToffeeHome
//
//  Created by Khaled on 8/8/23.
//

import UIKit

class TrendingChannelCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var imageContainerView: UIView!
    @IBOutlet private weak var profileImageView: UIImageView!
    @IBOutlet private weak var followButtonOutlet: UIButton!
    
    static let reuseIdentifier = "TrendingChannelCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageView.layer.cornerRadius = 40.0
        followButtonOutlet.setBorder(cornerRadius: 12.0)
    }
    
    @IBAction private func followButtonAction(_ sender: UIButton) {
        
    }
    
}
