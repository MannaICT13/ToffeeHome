//
//  ViewController.swift
//  ToffeeHome
//
//  Created by Khaled on 7/8/23.
//

import UIKit

class ToffeeHomeViewController: UIViewController {
    
    enum Section {
        case pagerView
    }
    
    struct Item: Hashable {
        let title: String?
        private let identifier = UUID()
    }
    
    private var collectionView: UICollectionView! = nil
    
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Item>
    
    private var dataSource: DataSource! = nil
    private var snapshot = Snapshot()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCollectionView()
        configureCompositionalLayout()
        configurediffableDataSource()
    }
}

extension ToffeeHomeViewController {
    private func createCollectionLayoutSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(193.0)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout.init())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        
        let nib = UINib(nibName: PagerCollectionViewCell.reuseIdentifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: PagerCollectionViewCell.reuseIdentifier)
    }
    
    private func configureCompositionalLayout(){
        let layout = UICollectionViewCompositionalLayout {sectionIndex,enviroment in
            switch sectionIndex {
            case  0:
                return self.createCollectionLayoutSection()
            default:
                return self.createCollectionLayoutSection()
            }
        }
        collectionView.setCollectionViewLayout(layout, animated: false)
    }
    
    private func configurediffableDataSource() {
        dataSource = DataSource(collectionView: collectionView, cellProvider: { (collectionView, indexPath, itemIdentifier) in
            guard indexPath.section < self.dataSource.snapshot().numberOfSections else { fatalError("Invalid section index") }
            
            switch self.dataSource.snapshot().sectionIdentifiers[indexPath.section] {
            case .pagerView:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PagerCollectionViewCell.reuseIdentifier, for: indexPath) as! PagerCollectionViewCell
                return cell
            }
        })
        
        var snapShot = Snapshot()
        snapShot.appendSections([.pagerView])
        snapShot.appendItems([Item(title: "")], toSection: .pagerView)
        dataSource.apply(snapShot, animatingDifferences: false)
    }
}
