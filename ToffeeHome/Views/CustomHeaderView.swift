//
//  CustomHeaderView.swift
//  ToffeeHome
//
//  Created by Khaled on 7/8/23.
//

import UIKit

class CustomHeaderView: UICollectionReusableView {
    static let reuseableIdentifier = "CustomHeaderView"
    @IBOutlet private weak var headerTitle: UILabel!
    
    var title: String? {
        didSet {
            guard let title = title else { return }
            headerTitle.text = title
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func tappedSeeAll(_ sender: UIButton) {
        
    }
}
