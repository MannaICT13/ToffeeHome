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
    
    var isLoading: Bool? {
        didSet {
            guard let isLoading = isLoading else { return }
            isLoading ? ToffeeLoader().startSmartShining(contentView): ToffeeLoader().stopSmartShining(contentView)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customMomentView.layer.cornerRadius = 12.0
    }
    
    @IBAction func momentTapped(_ sender: UIButton) {
        callback.didTappedMoment()
    }
}
