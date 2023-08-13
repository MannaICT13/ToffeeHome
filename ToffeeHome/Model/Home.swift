//
//  Home.swift
//  ToffeeHome
//
//  Created by Khaled on 8/8/23.
//

import Foundation

protocol DisplayableItem: Hashable {
    var identifier: UUID { get }
}

struct PagerItem: DisplayableItem {
   var identifier: UUID
    var title: String?
}

struct ChannelItem: DisplayableItem {
    var identifier: UUID
    var title: String?
}

struct CategoriesItem: DisplayableItem {
    var identifier: UUID
    var title: String?
}

struct MomentsItem: DisplayableItem {
    var identifier: UUID
    var title: String?
}

struct TrandingItem: DisplayableItem {
    var identifier: UUID
    var title: String?
}

struct FeedItem: DisplayableItem {
    var identifier: UUID
    var title: String?
}

enum DisplayableWrapper: Hashable {
    case pager(PagerItem)
    case channel(ChannelItem)
    case gategory(CategoriesItem)
    case moments(MomentsItem)
    case trendeing(TrandingItem)
    case feed(Episode)
    
    func hash(into hasher: inout Hasher) {
        switch self {
        case .pager(let pager):
            hasher.combine(pager)
            
        case .channel(let channel):
            hasher.combine(channel)
            
        case .gategory(let category):
            hasher.combine(category)
            
        case .moments(let moment):
            hasher.combine(moment)
            
        case .trendeing(let tranding):
            hasher.combine(tranding)
            
        case .feed(let feed):
            hasher.combine(feed)
        }
    }
    
    static func ==(lhs: DisplayableWrapper, rhs: DisplayableWrapper) -> Bool {
           switch (lhs, rhs) {
           case (.pager(let pager1), .pager(let pager2)):
               return pager1 == pager2
               
           case (.channel(let channel1), .channel(let channel2)):
               return channel1 == channel2
               
           case (.gategory(let category1), .gategory(let category2)):
               return category1 == category2
               
           case (.moments(let moment1), .moments(let moment2)):
               return moment1 == moment2
               
           case (.trendeing(let tranding1), .trendeing(let tranding2)):
               return tranding1 == tranding2
               
           case (.feed(let feed1), .feed(let feed2)):
               return feed1 == feed2
               
           default:
               return false
           }
       }
}
