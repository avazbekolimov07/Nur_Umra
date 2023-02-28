//
//  Home-UI.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 21/02/23.
//

import UIKit
import SnapKit

extension HomeViewController {
    
    
     func create_collectionView() -> UICollectionView {
         let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.backgroundColor = .clear
        collectionView.register(cellType: HomeIconCVC.self)
        collectionView.register(cellType: HomeNewsCVC.self)
        collectionView.register(cellType: HomeGuideCVC.self)
        
        collectionView.registerView(ofKind: .header, viewType: HomeReusableHeaderView.self)
        
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInset.bottom = UIWindow.safeAreaInsets.bottom
        
        collectionView.delegate = self
        collectionView.dataSource = self
       
        self.view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(self.view.snp.left)
            make.right.equalTo(self.view.snp.right)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
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
