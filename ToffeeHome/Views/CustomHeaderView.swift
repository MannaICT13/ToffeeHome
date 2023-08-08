//
//  CustomHeaderView.swift
//  ToffeeHome
//
//  Created by Khaled on 7/8/23.
//

import UIKit

extension CustomHeaderView {
    class Callback {
        var didTappedSeeAll: () -> Void = { }
    }
}

class CustomHeaderView: UICollectionReusableView {
    @IBOutlet private weak var headerTitle: UILabel!
    @IBOutlet private weak var rightButtonOutlet: UIButton!
    
    static let reuseableIdentifier = "CustomHeaderView"
    let callback = Callback()
    
    var title: String? {
        didSet {
            guard let title = title else { return }
            headerTitle.text = title
        }
    }
    
    var isRightbuttonHidden: Bool? {
        didSet {
            guard let  isRightbuttonHidden = isRightbuttonHidden else { return }
            rightButtonOutlet.isHidden = isRightbuttonHidden
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func tappedSeeAll(_ sender: UIButton) {
        callback.didTappedSeeAll()
    }
}
