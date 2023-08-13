//
//  ToffeeHomeViewModel.swift
//  ToffeeHome
//
//  Created by Khaled on 8/8/23.
//

import Foundation
import Combine

class ToffeeHomeViewModel {
    var didSuccess: ([Episode]) -> Void = { _ in }
    var didFailure: (String) -> Void  = { _ in }
    
    private var cancellables = Set<AnyCancellable>()
    private var episodes = [Episode]()
    
    func getEpisodesData() {
        NetworkManager.shared.getData(endpoint: .episodes, type: Episode.self)
                .sink { completion in
                    switch completion {
                    case .failure(let error):
                        self.didFailure(error.localizedDescription)
                    case .finished:
                        print("Finished")
                    }
                } receiveValue: { [weak self] episodes in
                    self?.episodes = episodes
                    self?.didSuccess(self?.episodes ?? [])
                }
                .store(in: &cancellables)
    }
    
    var feedItems: [DisplayableWrapper] {
        var feedDisplaywWrapper = [DisplayableWrapper]()
        
        for index in 0..<episodes.count {
            if index >= 0 && index < episodes.count {
                let episode = episodes[index]
                feedDisplaywWrapper.append(.feed(episode))
            } else {
                print("Index out of range: \(index)")
            }
        }
        return feedDisplaywWrapper
    }
    
    func setFeedData(for index: Int)-> FeedCollectionViewCellViewModel? {
        let episode = episodes[index]
        
        return  FeedCollectionViewCellViewModel(feedImage: episode.image?.original ?? "",
                                                runtime: episode.runtime ?? .zero,
                                                episodeName: episode.name ?? "",
                                                sesson: episode.season ?? .zero)
    }
    
    var channelItems: [DisplayableWrapper] {
        return [
            .channel(ChannelItem(identifier: UUID(), title: "")),
            .channel(ChannelItem(identifier: UUID(), title: "")),
            .channel(ChannelItem(identifier: UUID(), title: "")),
            .channel(ChannelItem(identifier: UUID(), title: "")),
            .channel(ChannelItem(identifier: UUID(), title: "")),
            .channel(ChannelItem(identifier: UUID(), title: "")),
            .channel(ChannelItem(identifier: UUID(), title: "")),
            .channel(ChannelItem(identifier: UUID(), title: "")),
            .channel(ChannelItem(identifier: UUID(), title: "")),
            .channel(ChannelItem(identifier: UUID(), title: "")),
        ]
    }
    
    var categoryItems: [DisplayableWrapper] {
        return [
            .gategory(CategoriesItem(identifier: UUID(), title: "")),
            .gategory(CategoriesItem(identifier: UUID(), title: "")),
            .gategory(CategoriesItem(identifier: UUID(), title: "")),
            .gategory(CategoriesItem(identifier: UUID(), title: "")),
            .gategory(CategoriesItem(identifier: UUID(), title: "")),
            .gategory(CategoriesItem(identifier: UUID(), title: "")),
            .gategory(CategoriesItem(identifier: UUID(), title: "")),
            .gategory(CategoriesItem(identifier: UUID(), title: "")),
            .gategory(CategoriesItem(identifier: UUID(), title: "")),
            .gategory(CategoriesItem(identifier: UUID(), title: "")),
        ]
    }
    
    var momemtsItems: [DisplayableWrapper] {
        return [
            .moments(MomentsItem(identifier: UUID(), title: "")),
            .moments(MomentsItem(identifier: UUID(), title: "")),
            .moments(MomentsItem(identifier: UUID(), title: "")),
            .moments(MomentsItem(identifier: UUID(), title: "")),
            .moments(MomentsItem(identifier: UUID(), title: "")),
            .moments(MomentsItem(identifier: UUID(), title: "")),
            .moments(MomentsItem(identifier: UUID(), title: "")),
            .moments(MomentsItem(identifier: UUID(), title: "")),
            .moments(MomentsItem(identifier: UUID(), title: "")),
            .moments(MomentsItem(identifier: UUID(), title: "")),
        ]
    }
    
    var trendingItems: [DisplayableWrapper] {
        return [
            .trendeing(TrandingItem(identifier: UUID(), title: "")),
            .trendeing(TrandingItem(identifier: UUID(), title: "")),
            .trendeing(TrandingItem(identifier: UUID(), title: "")),
            .trendeing(TrandingItem(identifier: UUID(), title: "")),
            .trendeing(TrandingItem(identifier: UUID(), title: "")),
            .trendeing(TrandingItem(identifier: UUID(), title: "")),
            .trendeing(TrandingItem(identifier: UUID(), title: "")),
            .trendeing(TrandingItem(identifier: UUID(), title: "")),
            .trendeing(TrandingItem(identifier: UUID(), title: "")),
            .trendeing(TrandingItem(identifier: UUID(), title: "")),
        ]
    }
}
