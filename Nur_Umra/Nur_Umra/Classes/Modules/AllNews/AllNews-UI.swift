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
         flow.minimumLineSpacing = 16
         
         let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: flow )
        collectionView.backgroundColor = .clear
        collectionView.register(cellType: HomeNewsCVC.self)
     
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInset.bottom = UIWindow.safeAreaInsets.bottom
        collectionView.delegate = self
        collectionView.dataSource = self
       
         self.view.addSubview(self.baseView)
        self.baseView.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        return collectionView
    }
    
    func create_refreshController() -> UIRefreshControl {
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing")
        
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return refreshControl
    }
    
}
