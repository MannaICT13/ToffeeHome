//
//  TrendingChannelCollectionViewCell.swift
//  ToffeeHome
//
//  Created by Khaled on 8/8/23.
//

import UIKit

extension TrendingChannelCollectionViewCell {
    class Callback {
        var didTappedFollow: () -> Void = { }
    }
}

class TrendingChannelCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var imageContainerView: UIView!
    @IBOutlet private weak var profileImageView: UIImageView!
    @IBOutlet private weak var followButtonOutlet: UIButton!
    
    static let reuseIdentifier = "TrendingChannelCollectionViewCell"
    let callback = Callback()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageView.layer.cornerRadius = 40.0
        followButtonOutlet.setBorder(cornerRadius: 12.0)
    }
    
    @IBAction private func followButtonAction(_ sender: UIButton) {
        callback.didTappedFollow()
    }
    
}
