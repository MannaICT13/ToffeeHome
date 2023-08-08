//
//  ToffeeHomeViewModel.swift
//  ToffeeHome
//
//  Created by Khaled on 8/8/23.
//

import Foundation

class ToffeeHomeViewModel {
    
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
    
    var feedItems: [DisplayableWrapper] {
        return [
            .feed(FeedItem(identifier: UUID(), title: "")),
            .feed(FeedItem(identifier: UUID(), title: "")),
            .feed(FeedItem(identifier: UUID(), title: "")),
            .feed(FeedItem(identifier: UUID(), title: "")),
            .feed(FeedItem(identifier: UUID(), title: "")),
            .feed(FeedItem(identifier: UUID(), title: "")),
            .feed(FeedItem(identifier: UUID(), title: "")),
            .feed(FeedItem(identifier: UUID(), title: "")),
            .feed(FeedItem(identifier: UUID(), title: "")),
            .feed(FeedItem(identifier: UUID(), title: "")),
        ]
    }
}
