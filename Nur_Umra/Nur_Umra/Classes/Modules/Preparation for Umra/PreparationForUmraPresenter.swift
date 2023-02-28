//
//  PreparationForUmraPresenter.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 27/02/23.
//

import Foundation

class PreparationForUmraPresenter: ViewtoPresenterPreparationForUmraProtocol {
    
   
    
    
    weak var view: PresenterToViewPreparationForUmraProtocol?
    
    var interactor: PresenterToInteractorPreparationForUmraProtocol?
    
    var router: PresenterToRouterPreparationForUmraProtocol?
    
    var preparationForUmra: PreparationDM?
    
    func viewDidLoad() {
        print("Didload preparaion in presenter is working ")
        view?.createUIElements()
        interactor?.loadPreparationForUmra()
    }
    
    func viewWillAppear() {
           view?.handleViewWillAppear()
    }
       
    func viewWillDisappear() {
           view?.handleViewWillDisappear()
    }
    
    
}


extension PreparationForUmraPresenter: InteractorToPresenterPreparationForUmraProtocol {
    func getPreparionForUmraFailure(errorCode: Int) {
        print("Error in geting preparation for umra error code - ", errorCode)
        view?.onUpdateUIElementsFailure()
    }

    
    func getPreparionForUmraSucces(preparion: PreparationDM) {
        print("Should work get preparation for umra successs ")
        view?.onUpdateUIElementsSuccess(with: preparion)
    }
    
    
    
    
}
