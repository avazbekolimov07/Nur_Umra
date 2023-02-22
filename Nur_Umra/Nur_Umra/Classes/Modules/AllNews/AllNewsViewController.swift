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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        setupViews()
    }
    override func viewWillAppear(_ animated: Bool) {
        print("will appear ")
    }
    
//    private func setupViews() {
//        print("didLayout sub views")
//        baseView.frame = self.view.frame
//        self.view.addSubview(baseView)
//    }
    
    private func setupCollectionDelegates() {
        
    }
    
    
    
}
