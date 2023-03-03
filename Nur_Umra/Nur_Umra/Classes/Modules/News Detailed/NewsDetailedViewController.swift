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
    var baseView: UIView!

    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter?.viewWillDisappear()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    
    // MARK: - Actions
    @objc func backBtnTapped() {
        presenter?.userWantsToPopVC()
    }
    
}


// MARK: - Update views
extension NewsDetailedViewController: PresenterToViewNewsDetailedProtocol {
    
    func createUIElements() {
        self.view.backgroundColor = .white
        self.baseView = self.create_baseView()
        self.scrollView = self.createScrollView()
        self.imgView = self.createImgView()
        self.titleLbl = self.createTitleLbl()
        self.descriptionLbl = self.createDescription()
        self.backBtn = self.createBackBtn()
    }
    
   
    func onUpdateUIElementsSuccess(with news: NewsDM) {
        self.updateUI(newsDetailed: news)
    }
    
    func updateUI(newsDetailed: NewsDM) {
        self.imgView.sd_setImage(with: URL(string: newsDetailed.image), placeholderImage: UIImage(named: "umraGide_img"))
        self.titleLbl.text = newsDetailed.title
        self.descriptionLbl.text = newsDetailed.content
    }
    
    func onUpdateUIElementsFailure() {
        print("Could not get news detailed")
    }
    
    func handleViewWillAppear() {
        setNeedsStatusBarAppearanceUpdate()
        UIApplication.shared.statusBarStyle = .lightContent
        navigationController?.navigationBar.isHidden = true
        self.navigationItem.title = ""
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.1716529429, green: 0.1766341031, blue: 0.19795838, alpha: 1)
    }
    
    func handleViewWillDisappear() {
        UIApplication.shared.statusBarStyle = .default
    }
    
    
}

extension NewsDetailedViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       if scrollView.contentOffset.y < 0 {
            scrollView.contentOffset.y = 0
        }
    }
}


