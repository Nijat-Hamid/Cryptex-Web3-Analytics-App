//
//  UICollectionViewLayout+Extensions.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/25/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//
import UIKit
extension UICollectionViewCompositionalLayout{
    static func createVerticalListLayout(sectionSpacing:CGFloat = 0,height:CGFloat = 10) ->UICollectionViewCompositionalLayout{
        let sectionProvider:UICollectionViewCompositionalLayoutSectionProvider = { section,enviroment in
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(height))
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(height))
            
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupLayoutSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            
            section.interGroupSpacing = sectionSpacing
            
            return section
        }
        
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        
        let compositionalLayout = UICollectionViewCompositionalLayout(sectionProvider: sectionProvider, configuration: configuration)
        
        return compositionalLayout
    }
}
