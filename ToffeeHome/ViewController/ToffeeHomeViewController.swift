//
//  ViewController.swift
//  ToffeeHome
//
//  Created by Khaled on 7/8/23.
//

import UIKit
import SwiftUI

class ToffeeHomeViewController: UIViewController {
    enum Section {
        case pagerView
        case channels
        case categories
        case moments
        case trendingChannels
        case feed
    }
        
    private lazy var collectionView: UICollectionView = {
        return UICollectionView(frame: self.view.bounds, collectionViewLayout: UICollectionViewFlowLayout.init())
    }()
    
    typealias DataSource = UICollectionViewDiffableDataSource<Section, DisplayableWrapper>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, DisplayableWrapper>
    
    private var dataSource: DataSource! = nil
    private var snapshot = Snapshot()
    private var isLoading: Bool = true {
        didSet {
            collectionView.isUserInteractionEnabled = !isLoading
            collectionView.reloadData()
        }
    }
    private let refreshControl = UIRefreshControl()
    private let viewModel = ToffeeHomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkMonitoring()
        setupViews()
        fetchFeedItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func setupViews() {
        isLoading = true
        view.backgroundColor = .white
        setupCollectionView()
        configureCompositionalLayout()
        configurediffableDataSource()
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        collectionView.addSubview(refreshControl)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(profileTapped))
    }
    
    @objc private func profileTapped() {
        let contentVC = UIHostingController(rootView: ContentView())
        navigationController?.pushViewController(contentVC, animated: true)
    }
    
    private func networkMonitoring() {
        NotificationCenter.default.addObserver(self, selector: #selector(internetConnectionEstablished), name: .internetConnectionEstablished, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(internetConnectionLost), name: .internetConnectionLost, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func internetConnectionEstablished() {
        print("Connection Establish!")
    }
    
    @objc private func internetConnectionLost() {
        DispatchQueue.main.async {
            self.showAlert(title: "Connection Error", message: "You're offline please check your connection.")
        }
    }
    
    @objc private func refreshData(_ sender: UIRefreshControl) {
        isLoading = true
        fetchFeedItems()
        sender.endRefreshing()
     }
    
    private func fetchFeedItems() {
        viewModel.getEpisodesData()
        
        viewModel.callback.didFailure = {error in
            self.isLoading = false
            print(error)
        }
        
        viewModel.callback.didSuccess = {[weak self] episodes in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self?.isLoading = false
                self?.updateFeedSection()
            }
        }
    }
    
    private func updateFeedSection() {
        snapshot.deleteItems(snapshot.itemIdentifiers(inSection: .feed))
        snapshot.appendItems(viewModel.feedItems, toSection: .feed)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    func showAlert(title: String, message: String) {
         let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
         let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
         alertController.addAction(okAction)

         DispatchQueue.main.async {
             self.present(alertController, animated: true, completion: nil)
         }
     }
}

extension ToffeeHomeViewController {
    
    private func setupCollectionView() {
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        
        let pagerViewNib = UINib(nibName: PagerCollectionViewCell.reuseIdentifier, bundle: nil)
        let channelNib = UINib(nibName: PopularTVChannelsCollectionViewCell.reuseIdentifier, bundle: nil)
        let cateGoriesNib = UINib(nibName: CategoriesCollectionViewCell.reuseIdentifier, bundle: nil)
        let momentsNib = UINib(nibName: MomentsCollectionViewCell.reuseIdentifier, bundle: nil)
        let trandinNib = UINib(nibName: TrendingChannelCollectionViewCell.reuseIdentifier, bundle: nil)
        let feedNib = UINib(nibName: FeedCollectionViewCell.reuseIdentifier, bundle: nil)
        
        collectionView.register(pagerViewNib, forCellWithReuseIdentifier: PagerCollectionViewCell.reuseIdentifier)
        collectionView.register(channelNib, forCellWithReuseIdentifier: PopularTVChannelsCollectionViewCell.reuseIdentifier)
        collectionView.register(cateGoriesNib, forCellWithReuseIdentifier: CategoriesCollectionViewCell.reuseIdentifier)
        collectionView.register(momentsNib, forCellWithReuseIdentifier: MomentsCollectionViewCell.reuseIdentifier)
        collectionView.register(trandinNib, forCellWithReuseIdentifier: TrendingChannelCollectionViewCell.reuseIdentifier)
        collectionView.register(feedNib, forCellWithReuseIdentifier: FeedCollectionViewCell.reuseIdentifier)
    }
    
    private func configureCompositionalLayout(){
        let layout = UICollectionViewCompositionalLayout {sectionIndex,enviroment in
            switch sectionIndex {
            case 0:
                return AppLayouts.shared.createCollectionLayoutSection()
            case 1:
                return AppLayouts.shared.createChaneelLayoutSection()
            case 2:
                return AppLayouts.shared.createCagegoriesLayoutSection()
            case 3:
                return AppLayouts.shared.createMomentsLayoutSection()
            case 4:
                return AppLayouts.shared.createTrandingChannelsLayoutSection()
            case 5:
                return AppLayouts.shared.createFeedLayoutSection()
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
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PagerCollectionViewCell.reuseIdentifier, for: indexPath) as? PagerCollectionViewCell
                cell?.isLoading = self.isLoading
                return cell
                
            case .channels:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularTVChannelsCollectionViewCell.reuseIdentifier, for: indexPath) as? PopularTVChannelsCollectionViewCell
                cell?.isLoading = self.isLoading
                cell?.callback.didTappedChannel = {[weak self] in
                    guard self == self else { return }
                    print("Channel Tapped.... section:\(indexPath.section) and row: \(indexPath.row)")
                }
                return cell
                
            case .categories:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.reuseIdentifier, for: indexPath) as? CategoriesCollectionViewCell
                cell?.isLoading = self.isLoading
                cell?.callback.didTappedTopCategory = { [weak self] in
                    guard self == self else { return }
                    print("Top Category Tapped.... section:\(indexPath.section) and row: \(indexPath.row)")
                    
                }
                cell?.callback.didTappedBottomCategory = {[weak self] in
                    guard self == self else { return }
                    print("Bottom Category Tapped.... section:\(indexPath.section) and row: \(indexPath.row)")
                }
                return cell
                
            case .moments:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MomentsCollectionViewCell.reuseIdentifier, for: indexPath) as? MomentsCollectionViewCell
                cell?.isLoading = self.isLoading
                cell?.callback.didTappedMoment = {[weak self] in
                    guard self == self else { return }
                    print("Moments Tapped.... section:\(indexPath.section) and row: \(indexPath.row)")
                    
                }
                return cell
                
            case .trendingChannels:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrendingChannelCollectionViewCell.reuseIdentifier, for: indexPath) as? TrendingChannelCollectionViewCell
                cell?.isLoading = self.isLoading
                cell?.callback.didTappedFollow = {[weak self] in
                    guard self == self else { return }
                    print("Trending Tapped.... section:\(indexPath.section) and row: \(indexPath.row)")
                }
                return cell
                
            case .feed:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCollectionViewCell.reuseIdentifier, for: indexPath) as? FeedCollectionViewCell
                cell?.isLoading = self.isLoading
                cell?.viewModel = self.viewModel.setFeedData(for: indexPath.row)
                return cell
            }
        })
        
        let supplementaryRegistration = UICollectionView.SupplementaryRegistration<CustomHeaderView>(supplementaryNib: UINib(nibName: CustomHeaderView.reuseableIdentifier, bundle: nil), elementKind: SupplementraryHeader.headerElementKind) { supplementaryView, elementKind, indexPath in
            supplementaryView.title = "Popular TV Channels"
            supplementaryView.isLoading = self.isLoading
            supplementaryView.callback.didTappedSeeAll = {[weak self] in
                guard self == self else { return }
                print("did Tapped See All....Channels")
            }
        }
        
        let categorySupplementaryRegistration = UICollectionView.SupplementaryRegistration<CustomHeaderView>(supplementaryNib: UINib(nibName: CustomHeaderView.reuseableIdentifier, bundle: nil), elementKind: SupplementraryHeader.headerElementKindOfCategory) { supplementaryView, elementKind, indexPath in
            supplementaryView.title = "Categories"
            supplementaryView.isLoading = self.isLoading
            supplementaryView.callback.didTappedSeeAll = {[weak self] in
                guard self == self else { return }
                print("did Tapped See All....Category")
            }
        }
        let momentsSupplementaryRegistration = UICollectionView.SupplementaryRegistration<CustomHeaderView>(supplementaryNib: UINib(nibName: CustomHeaderView.reuseableIdentifier, bundle: nil), elementKind: SupplementraryHeader.headerElementKindOfMoments) { supplementaryView, elementKind, indexPath in
            supplementaryView.title = "Moments"
            supplementaryView.isLoading = self.isLoading
            supplementaryView.isRightButtonHidden = true
            supplementaryView.callback.didTappedSeeAll = {[weak self] in
                guard self == self else { return }
                print("did Tapped See All....Category")
            }
        }
        
        let trendingSupplementaryRegistration = UICollectionView.SupplementaryRegistration<CustomHeaderView>(supplementaryNib: UINib(nibName: CustomHeaderView.reuseableIdentifier, bundle: nil), elementKind: SupplementraryHeader.headerElementKindOfTranding) { supplementaryView, elementKind, indexPath in
            supplementaryView.title = "Trending Channels"
            supplementaryView.isLoading = self.isLoading
            supplementaryView.callback.didTappedSeeAll = {[weak self] in
                guard self == self else { return }
                print("did Tapped See All....Trending")
            }
        }
        
        let feedSupplementaryRegistration = UICollectionView.SupplementaryRegistration<CustomHeaderView>(supplementaryNib: UINib(nibName: CustomHeaderView.reuseableIdentifier, bundle: nil), elementKind: SupplementraryHeader.headerElementKindOfFeed) { supplementaryView, elementKind, indexPath in
            supplementaryView.title = "Feed"
            supplementaryView.isRightButtonHidden = true
            supplementaryView.backgroundColor = .white
            supplementaryView.isLoading = self.isLoading
            supplementaryView.callback.didTappedSeeAll = {[weak self] in
                guard self == self else { return }
                print("did Tapped See All....Feed")
            }
        }
        
        dataSource.supplementaryViewProvider = {(view, kind, index) in
            switch kind {
            case SupplementraryHeader.headerElementKind:
                return self.collectionView.dequeueConfiguredReusableSupplementary(using: supplementaryRegistration, for: index)
            case SupplementraryHeader.headerElementKindOfCategory:
                return self.collectionView.dequeueConfiguredReusableSupplementary(using: categorySupplementaryRegistration, for: index)
            case SupplementraryHeader.headerElementKindOfMoments:
                return self.collectionView.dequeueConfiguredReusableSupplementary(using: momentsSupplementaryRegistration, for: index)
            case SupplementraryHeader.headerElementKindOfTranding:
                return self.collectionView.dequeueConfiguredReusableSupplementary(using: trendingSupplementaryRegistration, for: index)
            case SupplementraryHeader.headerElementKindOfFeed:
                return self.collectionView.dequeueConfiguredReusableSupplementary(using: feedSupplementaryRegistration, for: index)
            default:
                return nil
            }
        }
        snapshot.appendSections([.pagerView, .channels, .categories, .moments, .trendingChannels, .feed])
        snapshot.appendItems([.pager(PagerItem(identifier: UUID()))], toSection: .pagerView)
        snapshot.appendItems(viewModel.channelItems, toSection: .channels)
        snapshot.appendItems(viewModel.categoryItems, toSection: .categories)
        snapshot.appendItems(viewModel.momemtsItems, toSection: .moments)
        snapshot.appendItems(viewModel.trendingItems, toSection: .trendingChannels)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}
