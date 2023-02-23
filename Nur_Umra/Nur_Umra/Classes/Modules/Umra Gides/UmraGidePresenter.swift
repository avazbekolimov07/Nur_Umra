//
//  UmraGidePresenter.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 22/02/23
//

import SwiftyJSON

class UmraGidePresenter: ViewToPresenterUmraGideProtocol {
    
    var handbooks: [HandbookDM]?
    
    // MARK: Properties
    weak var view: PresenterToViewUmraGideProtocol?
    var interactor: PresenterToInteractorUmraGideProtocol?
    var router: PresenterToRouterUmraGideProtocol?
    
    // MARK: Inputs from view
    func viewDidLoad() {
        print("Presenter is being notified that the View was loaded.")
//        view?.showHUD()
        view?.createUIElements()
//        interactor?.loadNews()
    }
}

extension UmraGidePresenter: InteractorToPresenterUmraGideProtocol {
    
}
