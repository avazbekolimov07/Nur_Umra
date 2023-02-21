//
//  Home-UI.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 21/02/23.
//

import UIKit

extension HomeViewController {
    
    private func create_collectionView() -> UICollectionView {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .clear
        collectionView.register(cellType: HomeNewsCVC.self)
        collectionView.register(cellType: HomeGuideCVC.self)
        
        collectionView.registerView(ofKind: .header, viewType: HomeReusableHeaderView.self)
        
        collectionView.contentInset.bottom = UIWindow.safeAreaInsets.bottom
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }
    
}
