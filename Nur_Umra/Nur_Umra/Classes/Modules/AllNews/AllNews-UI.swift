//
//  AllNews-UI.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 21/02/23.
//


import UIKit
import SnapKit

extension AllNewsViewController {
    
     func create_collectionView() -> UICollectionView {
         let flow = UICollectionViewFlowLayout()
         flow.scrollDirection = .vertical
         
         let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flow )
        collectionView.backgroundColor = .clear
        collectionView.register(cellType: HomeNewsCVC.self)
     
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInset.bottom = UIWindow.safeAreaInsets.bottom
        collectionView.delegate = self
        collectionView.dataSource = self
       
        self.view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.center.equalTo(self.view.snp.center)
            make.edges.equalTo(self.view.snp.edges)
        }
        return collectionView
    }
    
}
