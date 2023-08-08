//
//  AppLayouts.swift
//  ToffeeHome
//
//  Created by Khaled on 8/8/23.
//

import Foundation
import UIKit

class AppLayouts {
    static let shared = AppLayouts()
    
    private init() { }
    func createCollectionLayoutSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(193.0)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    func createChaneelLayoutSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(80), heightDimension: .absolute(80)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 8.0, leading: 8.0, bottom: 8.0, trailing: 8.0)
        section.interGroupSpacing = 8.0
        section.orthogonalScrollingBehavior = .continuous
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44)), elementKind: SupplementraryHeader.headerElementKind, alignment: .top)
        
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    func createCagegoriesLayoutSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4), heightDimension: .fractionalWidth(0.4)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 8.0, leading: 8.0, bottom: 8.0, trailing: 8.0)
        section.interGroupSpacing = 8.0
        section.orthogonalScrollingBehavior = .continuous
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44)), elementKind: SupplementraryHeader.headerElementKindOfCategory, alignment: .top)
        
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    func createMomentsLayoutSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25), heightDimension: .fractionalWidth(0.44)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 8.0, leading: 8.0, bottom: 8.0, trailing: 8.0)
        section.interGroupSpacing = 8.0
        section.orthogonalScrollingBehavior = .continuous
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44)), elementKind: SupplementraryHeader.headerElementKindOfMoments, alignment: .top)
        
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    func createTrandingChannelsLayoutSection() -> NSCollectionLayoutSection {
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .absolute(140)), subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: .zero, leading: 8.0, bottom: .zero, trailing: .zero)
            section.interGroupSpacing = 8.0
            section.orthogonalScrollingBehavior = .continuous
            let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44)), elementKind: SupplementraryHeader.headerElementKindOfTranding, alignment: .top)
            
            section.boundarySupplementaryItems = [header]
            
            return section
    }
    
    func createFeedLayoutSection() -> NSCollectionLayoutSection {
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5)), subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 8.0
            let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44)), elementKind: SupplementraryHeader.headerElementKindOfFeed, alignment: .top)
        header.pinToVisibleBounds = true
            section.boundarySupplementaryItems = [header]
            
            return section
    }

}
