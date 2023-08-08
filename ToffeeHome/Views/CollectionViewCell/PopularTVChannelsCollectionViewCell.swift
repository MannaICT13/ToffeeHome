//
//  PopularTVChannelsCollectionViewCell.swift
//  ToffeeHome
//
//  Created by Khaled on 7/8/23.
//

import UIKit
extension PopularTVChannelsCollectionViewCell {
    class Callback {
        var didTappedChannel: () -> Void = { }
    }
}

class PopularTVChannelsCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var channelImageView: UIImageView!
    
    static let reuseIdentifier = "PopularTVChannelsCollectionViewCell"
    let callback = Callback()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        channelImageView.layer.cornerRadius = 40.0
    }
    
    @IBAction private func channelTapped(_ sender: UIButton) {
        callback.didTappedChannel()
    }
}
