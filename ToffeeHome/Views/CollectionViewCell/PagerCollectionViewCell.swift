//
//  PagerCollectionViewCell.swift
//  ToffeeHome
//
//  Created by Khaled on 7/8/23.
//

import UIKit

class PagerCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "PagerCollectionViewCell"
    fileprivate var numberOfItems = 5
    fileprivate let imageNames = ["one.jpg","two.jpg","three.jpg","four.jpg","five.jpg"]
    
    @IBOutlet private weak var pagerView: FSPagerView! {
        didSet {
            self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
            self.pagerView.itemSize = FSPagerView.automaticSize
            self.pagerView.automaticSlidingInterval = 3.0 - self.pagerView.automaticSlidingInterval
        }
    }
    
    @IBOutlet weak var pageControl: FSPageControl!{
        didSet {
            self.pageControl.numberOfPages = self.imageNames.count
            self.pageControl.contentHorizontalAlignment = .right
            self.pageControl.contentInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        }
    }
    
    var isLoading: Bool? {
        didSet {
            guard let isLoading = isLoading else { return }
            isLoading ? ToffeeLoader().startSmartShining(contentView): ToffeeLoader().stopSmartShining(contentView)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pagerView.delegate = self
        pagerView.dataSource = self
    }
}

extension PagerCollectionViewCell: FSPagerViewDataSource,FSPagerViewDelegate  {
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        return self.numberOfItems
    }
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.image = UIImage(named: self.imageNames[index])
        cell.imageView?.contentMode = .scaleAspectFill
        cell.imageView?.clipsToBounds = true
        return cell
    }
    
    // MARK:- FSPagerView Delegate
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
    }
    
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        self.pageControl.currentPage = targetIndex
    }
    
    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
        self.pageControl.currentPage = pagerView.currentIndex
    }

}
