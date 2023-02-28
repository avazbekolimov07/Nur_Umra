//
//  UmraGideDetailViewController.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 27/02/23.
//

import UIKit

class UmraGideDetailViewController: UIViewController {
    
    // MARK: - Properties
    var presenter: ViewToPresenterUmraGideDetailProtocol?
    
    var scrollView: UIScrollView!
    var descriptionLbl: UILabel!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        presenter?.viewDidDisappear()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .default
    }
    
    // MARK: - Actions
    @objc func backBtnTapped() {

    }
}

extension UmraGideDetailViewController: PresenterToViewUmraGideDetailProtocol {
    
    func handleViewWillAppear() {
        setNeedsStatusBarAppearanceUpdate()
        navigationController?.navigationBar.isHidden = false
    }
    
    func handleViewDidDisappear() {
        UIApplication.shared.statusBarStyle = .default
    }
    
    func onUpdateUIElementsSuccess(with handbook: HandbookDM) {
        self.updateUI(handbook: handbook)
    }
    
    func onUpdateUIElementsFailure() {
        print("Could not get handbook detailed")
    }
    
    func updateUI(handbook: HandbookDM) {
        self.descriptionLbl.text = handbook.description
        self.navigationItem.title = handbook.name
    }
    
}


// MARK: - UI Setup
extension UmraGideDetailViewController {
    
    func createUIElements() {
        overrideUserInterfaceStyle = .light
        self.view.backgroundColor = .white
        self.scrollView = self.createScrollView()
        self.descriptionLbl = self.createDescription()
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.1716529429, green: 0.1766341031, blue: 0.19795838, alpha: 1)
    }

}

extension UmraGideDetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       if scrollView.contentOffset.y < 0 {
            scrollView.contentOffset.y = 0
        }
    }
}
