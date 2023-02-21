//
//  HomeViewController.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 20/02/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}


// MARK: - Data Source Configuration

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withCellType: HomeNewsCVC.self, for: indexPath)
            
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withCellType: HomeGuideCVC.self, for: indexPath)
            
            return cell
        }
    }
}

