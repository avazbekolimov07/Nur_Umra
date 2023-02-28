//
//  HistoricalPlacesRouter.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 27/02/23.
//


import UIKit

class HistoricalPlacesRouter: PresenterToRouterHistoricalPlacesProtocol {
    static func createModule() -> UIViewController {
        let viewController = HistoricalPlacesViewController()
        
        let presenter: ViewToPresenterHistoricalPlacesProtocol & InteractorToPresenterHistoricalPlacesProtocol = HistoricalPlacesPresenter()
        viewController.presenter = presenter
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = HistoricalPlacesInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
    func pushTohistoricalPlacesDetailed(on view: PresenterToViewHistoricalPlacesProtocol , with specificPlace: HistoricalPlacesDM) {
    }
    
    
    
    
}
