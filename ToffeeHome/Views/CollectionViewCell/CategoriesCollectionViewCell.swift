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
    private let radius = CGFloat(16.0)
    
    var isLoading: Bool? {
        didSet {
            guard let isLoading = isLoading else { return }
            isLoading ? ToffeeLoader().startShining(topImageView): ToffeeLoader().stopShining(topImageView)
            isLoading ? ToffeeLoader().startShining(bottomImageView) : ToffeeLoader().stopShining(bottomImageView)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        topImageView.layer.cornerRadius = radius
        bottomImageView.layer.cornerRadius = radius
    }
    
    @IBAction private func topCategoryTapped(_ sender: UIButton) {
        callback.didTappedTopCategory()
    }
    
    @IBAction private func bottomCategoryTapped(_ sender: UIButton) {
        callback.didTappedBottomCategory()
    }
}
