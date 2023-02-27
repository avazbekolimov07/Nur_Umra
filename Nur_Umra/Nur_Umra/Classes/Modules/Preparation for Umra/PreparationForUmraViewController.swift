//
//  PreparationForUmraViewController.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 27/02/23.
//

import UIKit

class PreparationForUmraViewController: UIViewController {
    
    
    // MARK: - Properties
    var presenter: ViewtoPresenterPreparationForUmraProtocol?
    
    var scrollView: UIScrollView!
    var imgView: UIImageView!
    var titleLbl: UILabel!
    var descriptionLbl: UILabel!
    var backBtn: UIButton!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View did load")
        presenter?.viewDidLoad()

    }
    
    // MARK: - Actions
    @objc func backBtnTapped() {
        //
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension PreparationForUmraViewController: PresenterToViewPreparationForUmraProtocol  {
    
    
    func createUIElements() {
        navigationController?.navigationBar.isHidden = true
             self.view.backgroundColor = .white
             self.scrollView = self.createScrollView()
             self.imgView = self.createImgView()
             self.titleLbl = self.createTitleLbl()
             self.descriptionLbl = self.createDescription()
             self.backBtn = self.createBackBtn()
    }
    
    func onUpdateUIElementsSuccess(with preparation: PreparationDM) {
        updateUI(preparationInformation: preparation)
    }
    
    func onUpdateUIElementsFailure() {
        print("failure in updating ui elements")
    }
    
    
    
    func updateUI(preparationInformation: PreparationDM) {
        self.imgView.image = UIImage(named: "umraGide_img")
        self.titleLbl.text = "ҚУЙИДАГИЛАРГА АҲАМИЯТ БЕРИНГ"
        self.descriptionLbl.text = preparationInformation.text
    }
    
    
}
