//
//  ViewController.swift
//  ToffeeHome
//
//  Created by Khaled on 7/8/23.
//

import UIKit

class ToffeeHomeViewController: UIViewController {
    static let headerElementKind = "header-element-kind"
    static let headerElementKindOfCategory = "header-element-kind-of-category"
    
    enum Section {
        case pagerView
        case channels
        case categories
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
    
    private func createChaneelLayoutSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(80), heightDimension: .absolute(80)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 8.0, leading: 8.0, bottom: 8.0, trailing: 8.0)
        section.interGroupSpacing = 8.0
        section.orthogonalScrollingBehavior = .continuous
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44)), elementKind: ToffeeHomeViewController.headerElementKind, alignment: .top)
        
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    private func createCagegoriesLayoutSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4), heightDimension: .fractionalWidth(0.4)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 8.0, leading: 8.0, bottom: 8.0, trailing: 8.0)
        section.interGroupSpacing = 8.0
        section.orthogonalScrollingBehavior = .continuous
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44)), elementKind: ToffeeHomeViewController.headerElementKindOfCategory, alignment: .top)
        
        section.boundarySupplementaryItems = [header]
        
        return section
    }

    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout.init())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        
        let pagerViewNib = UINib(nibName: PagerCollectionViewCell.reuseIdentifier, bundle: nil)
        let channelNib = UINib(nibName: PopularTVChannelsCollectionViewCell.reuseIdentifier, bundle: nil)
        let cateGoriesNib  = UINib(nibName: CategoriesCollectionViewCell.reuseIdentifier, bundle: nil)
        
        collectionView.register(pagerViewNib, forCellWithReuseIdentifier: PagerCollectionViewCell.reuseIdentifier)
        collectionView.register(channelNib, forCellWithReuseIdentifier: PopularTVChannelsCollectionViewCell.reuseIdentifier)
        collectionView.register(cateGoriesNib, forCellWithReuseIdentifier: CategoriesCollectionViewCell.reuseIdentifier)
    }
    
    private func configureCompositionalLayout(){
        let layout = UICollectionViewCompositionalLayout {sectionIndex,enviroment in
            switch sectionIndex {
            case 0:
                return self.createCollectionLayoutSection()
            case 1:
                return self.createChaneelLayoutSection()
            case 2:
                return self.createCagegoriesLayoutSection()
            default:
                return nil
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
                
            case .channels:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularTVChannelsCollectionViewCell.reuseIdentifier, for: indexPath) as! PopularTVChannelsCollectionViewCell
                cell.callback.didTappedChannel = {[weak self] in
                    guard self == self else { return }
                    print("Channel Tapped.... section:\(indexPath.section) and row: \(indexPath.row)")
                }
                return cell
                
            case .categories:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.reuseIdentifier, for: indexPath) as! CategoriesCollectionViewCell
                cell.callback.didTappedTopCategory = { [weak self] in
                    guard self == self else { return }
                    print("Top Category Tapped.... section:\(indexPath.section) and row: \(indexPath.row)")

                }
                cell.callback.didTappedBottomCategory = {[weak self] in
                    guard self == self else { return }
                    print("Bottom Category Tapped.... section:\(indexPath.section) and row: \(indexPath.row)")
                }
                return cell
            }
        })
        
        let supplementaryRegistration = UICollectionView.SupplementaryRegistration<CustomHeaderView>(supplementaryNib: UINib(nibName: CustomHeaderView.reuseableIdentifier, bundle: nil), elementKind: ToffeeHomeViewController.headerElementKind) { supplementaryView, elementKind, indexPath in
            supplementaryView.title = "Popular TV Channels"
            supplementaryView.callback.didTappedSeeAll = {[weak self] in
                guard self == self else { return }
                print("did Tapped See All....Channels")
            }
        }
        
        let categorySupplementaryRegistration = UICollectionView.SupplementaryRegistration<CustomHeaderView>(supplementaryNib: UINib(nibName: CustomHeaderView.reuseableIdentifier, bundle: nil), elementKind: ToffeeHomeViewController.headerElementKindOfCategory) { supplementaryView, elementKind, indexPath in
            supplementaryView.title = "Categories"
            supplementaryView.callback.didTappedSeeAll = {[weak self] in
                guard self == self else { return }
                print("did Tapped See All....Category")
            }
        }
        
        dataSource.supplementaryViewProvider = {(view, kind, index) in
            switch kind {
            case ToffeeHomeViewController.headerElementKind:
                return self.collectionView.dequeueConfiguredReusableSupplementary(using: supplementaryRegistration, for: index)
            case ToffeeHomeViewController.headerElementKindOfCategory:
                return self.collectionView.dequeueConfiguredReusableSupplementary(using: categorySupplementaryRegistration, for: index)
            default:
                return nil
            }
        }
        
        var snapShot = Snapshot()
        snapShot.appendSections([.pagerView, .channels, .categories])
        snapShot.appendItems([Item(title: "")], toSection: .pagerView)
        snapShot.appendItems(channelsItems, toSection: .channels)
        snapShot.appendItems(channelsItems, toSection: .categories)
        dataSource.apply(snapShot, animatingDifferences: false)
    }
    
    var channelsItems: [Item] {
        var channelItem = [Item]()
        for _ in 0..<30 {
            channelItem.append(Item(title: ""))
        }
        return channelItem
    }
}
