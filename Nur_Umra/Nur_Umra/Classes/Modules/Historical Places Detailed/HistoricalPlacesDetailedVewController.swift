//
//  HistoricalPlacesDetailedVewController.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 28/02/23.
//

import Foundation
import UIKit

class HistoricalPlacesDetailedViewController: UIViewController {
    
    // MARK: - Properties
    var presenter: ViewToPresenterHistoricalPlacesDetailedProtocol?
    
    var scrollView: UIScrollView!
    var imgView: UIImageView!
    var titleLbl: UILabel!
    var descriptionLbl: UILabel!
    var backBtn: UIButton!
    var baseView: UIView!
    var openOnTheMapBtn: UIButton!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View did load")
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
    
    // MARK: - Actions
    @objc func backBtnTapped() {
        presenter?.userWantsToPopVC()
    }
    @objc func mapBtnPressed() {
        print("map presed")
    }
    
}

extension HistoricalPlacesDetailedViewController: PresenterToViewHistoricalPlacesDetailedProtocol {
    func onFetchSuccess(place: HistoricalPlacesDM) {
        updateUI(placeDetailed: place)
    }
    
    func onFetchFailure() {
        print("Failure in getching place")
    }
    
    func handleViewWillAppear() {
        setNeedsStatusBarAppearanceUpdate()
        UIApplication.shared.statusBarStyle = .lightContent
        navigationController?.navigationBar.isHidden = true
    
    }
    
    func handleViewWillDisappear() {
        UIApplication.shared.statusBarStyle = .default
    }
    
    func createUIElements() {
        self.view.backgroundColor = .white
        self.baseView = self.create_baseView()
        self.scrollView = self.createScrollView()
        self.imgView = self.createImgView()
        self.titleLbl = self.createTitleLbl()
        self.descriptionLbl = self.createDescription()
        self.backBtn = self.createBackBtn()
        self.openOnTheMapBtn = self.createOpenOnTheMapBtn()
       
    }
    
    func updateUI(placeDetailed: HistoricalPlacesDM) {
        self.imgView.sd_setImage(with: URL(string: placeDetailed.img), placeholderImage: UIImage(named: "umraGide_img"))
        self.titleLbl.text = placeDetailed.name
        self.descriptionLbl.text = placeDetailed.description
    }
    
    
    
}
