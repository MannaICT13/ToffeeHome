//
//  MyWatchListModel.swift
//  Subscription
//
//  Created by Fahad on 15/6/23.
//

import SwiftUI

struct WatchListItem : Identifiable{
    let id = UUID()
    let imageName: String
    let MovieName: String
    let duration: String
    let progressvalue: Double
    
}

struct WatchListCell {
    static let WLCellData = [
        WatchListItem(imageName: "MoviePosterOne", MovieName: "maya Shalik", duration: "2h 17m remaining", progressvalue: 0.3),
        WatchListItem(imageName: "MoviePosterOne", MovieName: "maya Shalik", duration: "2h 17m remaining", progressvalue: 0.3),
        WatchListItem(imageName: "MoviePosterOne", MovieName: "maya Shalik", duration: "1h 10m remaining", progressvalue: 0.3),
        WatchListItem(imageName: "MoviePosterOne", MovieName: "maya Shalik", duration: "2h 23m remaining", progressvalue: 0.5),
        WatchListItem(imageName: "MoviePosterOne", MovieName: "maya Shalik", duration: "1h 17m remaining", progressvalue: 0.4),
        WatchListItem(imageName: "MoviePosterOne", MovieName: "maya Shalik", duration: "2h 57m remaining", progressvalue: 0.7),
        WatchListItem(imageName: "MoviePosterOne", MovieName: "maya Shalik", duration: "1h 17m remaining", progressvalue: 0.8),
        WatchListItem(imageName: "MoviePosterOne", MovieName: "maya Shalik", duration: "2h 37m remaining", progressvalue: 0.2),
    ]
}
