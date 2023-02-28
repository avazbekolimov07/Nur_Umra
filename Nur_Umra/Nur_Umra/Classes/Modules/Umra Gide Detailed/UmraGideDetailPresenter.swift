//
//  UmraGideDetailPresenter.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 27/02/23.
//

import Foundation

class UmraGideDetailPresenter: ViewToPresenterUmraGideDetailProtocol {
    
    // MARK: Properties
    weak var view: PresenterToViewUmraGideDetailProtocol?
    var interactor: PresenterToInteractorUmraGideDetailProtocol?
    var router: PresenterToRouterUmraGideDetailProtocol?
    
    var handbook: HandbookDM?
    
    // MARK: Inputs from view
    func viewDidLoad() {
        view?.createUIElements()
        interactor?.retrieveHandbookDetailed()
    }
    
    func viewWillAppear() {
        view?.handleViewWillAppear()
    }
    
    func viewWillDisappear() {
        view?.handleViewWillDisappear()
    }
    
}

// MARK: - Outputs to view
extension UmraGideDetailPresenter: InteractorToPresenterUmraGideDetailProtocol {
    
    func getHandbookDetailedSuccess(handbook: HandbookDM) {
        self.handbook = handbook
        view?.onUpdateUIElementsSuccess(with: handbook)
    }
    
    func getHandbookDetailedFailure() {
        view?.onUpdateUIElementsFailure()
    }
    
}
