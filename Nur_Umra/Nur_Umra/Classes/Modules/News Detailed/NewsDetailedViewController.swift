//
//  NewsDetailedViewController.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 24/02/23.
//

import Foundation
import UIKit

class NewsDetailedViewController: UIViewController {
    
    var presenter: ViewToPresenterAllNewsProtocol?
    
    var scrollView: UIScrollView!
    var imgView: UIImageView!
    var titleLbl: UILabel!
    var descriptionLbl: UILabel!

    
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        createUIElements()
//        presenter?.viewDidLoad()
    }
//    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
}
extension NewsDetailedViewController: PresenterToViewNewsDetailedProtocol {
    func createUIElements() {
        self.scrollView = self.createScrollView()
        self.imgView = self.createImgView()
        self.titleLbl = self.createTitleLbl()
        self.descriptionLbl = self.createDescription()
        self.scrollView.delegate = self
        
        
    }
    
    
}

extension NewsDetailedViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       if scrollView.contentOffset.y < 0 {
            scrollView.contentOffset.y = 0
        }
    }
}
