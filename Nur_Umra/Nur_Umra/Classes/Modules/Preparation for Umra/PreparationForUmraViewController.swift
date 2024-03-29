//
//  PreparationForUmraViewController.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 27/02/23.
//

import UIKit
import SkeletonView

class PreparationForUmraViewController: UIViewController {
    
    // MARK: - Properties
    var presenter: ViewtoPresenterPreparationForUmraProtocol?
    
    var scrollView: UIScrollView!
    var imgView: UIImageView!
    var titleLbl: UILabel!
    var descriptionLbl: UILabel!
    var backBtn: UIButton!
    var baseView: UIView!
    
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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    override func viewDidLayoutSubviews() {
        view.layoutSkeletonIfNeeded()
    }
    
    // MARK: - Actions
    @objc func backBtnTapped() {
        presenter?.userWantsToPopVC()
    }
    
}

extension PreparationForUmraViewController: PresenterToViewPreparationForUmraProtocol  {
    
    func createUIElements() {
        self.view.backgroundColor = .white
        
        self.baseView = self.create_baseView()
        self.scrollView = self.createScrollView()
        self.imgView = self.createImgView()
        self.titleLbl = self.createTitleLbl()
        self.descriptionLbl = self.createDescription()
        self.backBtn = self.createBackBtn()
        
        self.configureSkeleton()
    }
    
    func onUpdateUIElementsSuccess(with preparation: PreparationDM) {
        self.removeSkeleton()
        self.updateUI(preparationInformation: preparation)
    }
    
    func onUpdateUIElementsFailure() {
        print("failure in updating ui elements")
        self.removeSkeleton()
    }
    
    
    func updateUI(preparationInformation: PreparationDM) {
        self.imgView.image = UIImage(named: "umraGide_img")
        self.titleLbl.text = "ҚУЙИДАГИЛАРГА АҲАМИЯТ БЕРИНГ"
        self.descriptionLbl.text = preparationInformation.text.deleteHTMLTag()
    }
    
    func handleViewWillAppear() {
        setNeedsStatusBarAppearanceUpdate()
        UIApplication.shared.statusBarStyle = .lightContent
        navigationController?.navigationBar.isHidden = true
        self.navigationItem.title = "Safarga tayyorgarlik"
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.1716529429, green: 0.1766341031, blue: 0.19795838, alpha: 1)
    }
    
    func handleViewWillDisappear() {
        UIApplication.shared.statusBarStyle = .default
    }
    
    
}

extension PreparationForUmraViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       if scrollView.contentOffset.y < 0 {
            scrollView.contentOffset.y = 0
        }
    }
}
