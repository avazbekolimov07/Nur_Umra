//
//  AllNewsViewController.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 21/02/23.
//

import UIKit


class AllNewsViewController: UIViewController {
//    var baseView: AllNewsView = AllNewsView()
    
    override func viewDidLoad() {
       print("didLoad")
    }
    

    override func viewWillAppear(_ animated: Bool) {
        print("will appear ")
    }
    

    
    private func setupCollectionDelegates() {
        
    }
}

extension AllNewsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}

