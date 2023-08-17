//
//  CategoriesCollectionViewCell.swift
//  ToffeeHome
//
//  Created by Khaled on 8/8/23.
//

import UIKit

extension CategoriesCollectionViewCell {
    class Callback {
        var didTappedTopCategory: () -> Void = { }
        var didTappedBottomCategory: () -> Void = { }
    }
}

class CategoriesCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var topImageView: UIView!
    @IBOutlet private weak var bottomImageView: UIView!
    
    static let reuseIdentifier = "CategoriesCollectionViewCell"
    let callback = Callback()
    
    var isLoading: Bool? {
        didSet {
            guard let isLoading = isLoading else { return }
            isLoading ? ToffeeLoader().startSmartShining(contentView): ToffeeLoader().stopSmartShining(contentView)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        topImageView.layer.cornerRadius = 16.0
        bottomImageView.layer.cornerRadius = 16.0
    }
    
    @IBAction private func topCategoryTapped(_ sender: UIButton) {
        callback.didTappedTopCategory()
    }
    
    @IBAction private func bottomCategoryTapped(_ sender: UIButton) {
        callback.didTappedBottomCategory()
    }
}
