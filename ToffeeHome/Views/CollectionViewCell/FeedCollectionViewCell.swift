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
    @IBOutlet private weak var runtimeLabel: UILabel!
    
    static let reuseIdentifier = "FeedCollectionViewCell"
    
    var viewModel: FeedCollectionViewCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            sessionDetailLabel.text = viewModel.sessionDetail
            runtimeLabel.text = "Toffee \(viewModel.runtime) m"
            
            if let imageURL = URL(string: viewModel.feedImage ?? "") {
                let imageLoader = ImageLoader()
                imageLoader.loadImage(from: imageURL) { image in
                    DispatchQueue.main.async {
                        if let image = image {
                            self.feedImageView.image = image
                        } else {
                            self.feedImageView.image = UIImage(named: "placeholder")
                        }
                    }
                }
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        bottomView.roundBottomCorners(radius: 12.0)
    }
}

struct FeedCollectionViewCellViewModel {
    let feedImage: String?
    let runtime: Double
    let episodeName: String
    let sesson: Int
    
    fileprivate var sessionDetail: String? {
        return "Episode 1 | \(episodeName) | Session \(sesson)"
    }
}
