//
//  HomeViewController+Layout.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 21/02/23.
//

import UIKit

extension HomeViewController {
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] section, _ -> NSCollectionLayoutSection? in
            switch section {
            case 0:
                return self?.createHomeIconLayout()
            case 1:
                return self?.createHomeNewsLayout()
            default:
                return self?.createHomeGuideLayout()
            }
        }
        return layout
    }
    
    private func createHomeIconLayout() -> NSCollectionLayoutSection {
        let heightCell: CGFloat = 65
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: .zero, leading: .zero, bottom: .zero, trailing: .zero)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .absolute(heightCell))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 16, leading: .zero, bottom: 35 - 8, trailing: .zero)
        
        return section
    }
    
    
    private func createHomeNewsLayout() -> NSCollectionLayoutSection {
        let heightCell: CGFloat = 324
        let widthCell: CGFloat = 224
        let heightHeaderView: CGFloat = 30
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 8, leading: 8, bottom: .zero, trailing: 8)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(widthCell),
                                               heightDimension: .absolute(heightCell))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = .init(top: 0, leading: 8, bottom: 35 - 8, trailing: 8)
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(heightHeaderView)
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.SupplymentaryViewKind.header.identifier,
            alignment: .topLeading
        )

        section.boundarySupplementaryItems = [header]
        section.supplementariesFollowContentInsets = false
        
        return section
    }
 
    
    private func createHomeGuideLayout() -> NSCollectionLayoutSection {
        let heightCell: CGFloat = 210
        let heightHeaderView: CGFloat = 30
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .absolute(heightCell))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 8, leading: 16, bottom: 8, trailing: 16)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .absolute(heightCell))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: .zero, leading: .zero, bottom: 4, trailing: .zero)
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(heightHeaderView)
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.SupplymentaryViewKind.header.identifier,
            alignment: .topLeading
        )
        section.boundarySupplementaryItems = [header]
        section.supplementariesFollowContentInsets = false
        return section
    }
}
