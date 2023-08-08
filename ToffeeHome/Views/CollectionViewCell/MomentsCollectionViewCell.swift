//
//  MomentsCollectionViewCell.swift
//  ToffeeHome
//
//  Created by Khaled on 8/8/23.
//

import UIKit

extension MomentsCollectionViewCell {
    class Callback {
        var didTappedMoment: () -> Void = { }
    }
}
class MomentsCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var customMomentView: UIView!
    
    static let reuseIdentifier = "MomentsCollectionViewCell"
    let callback = Callback()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customMomentView.layer.cornerRadius = 12.0
    }
    
    @IBAction func momentTapped(_ sender: UIButton) {
        callback.didTappedMoment()
    }
}
