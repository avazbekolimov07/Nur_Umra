//
//  NewsDetailedViewController.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 24/02/23.
//

import Foundation
import UIKit

class NewsDetailedViewController: UIViewController {
    
    // MARK: - Properties
    var presenter: ViewToPresenterNewsDetailedProtocol?
    
    var scrollView: UIScrollView!
    var imgView: UIImageView!
    var titleLbl: UILabel!
    var descriptionLbl: UILabel!
    var backBtn: UIButton!

    
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()

    }
    
    // MARK: - Actions
    @objc func backBtnTapped() {
        print("back btn pressed")
    }
    
}


// MARK: - Update views
extension NewsDetailedViewController: PresenterToViewNewsDetailedProtocol {
    func createUIElements() {
                self.view.backgroundColor = .red
                self.scrollView = self.createScrollView()
                self.imgView = self.createImgView()
                self.titleLbl = self.createTitleLbl()
                self.descriptionLbl = self.createTitleLbl()
                self.backBtn = self.createBackBtn()
                print("🥶 create ur elements ui elents is working")
    }
    
   
    func updateUIElements(with news: NewsDM) {
        print("🥶 Update ui elents is working")
        self.updateUI(newsDetailed: news)
    }
    
    func onFetchError() {
        print("error in fetching data")
    }
    
    
}


