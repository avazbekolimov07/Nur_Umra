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
        viewController.presenter?.router = HistoricalPlacesRouter()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
    func pushTohistoricalPlacesDetailed(on view: PresenterToViewHistoricalPlacesProtocol , with specificPlace: HistoricalPlacesDM) {
        print("router is want to open Detailded historical places")
        let histroiclPlaceDetailed = HistoricalPlacesDetailedRouter.createModule(withPlace: specificPlace)
        let viewController = view as! HistoricalPlacesViewController
        
        viewController.navigationController?.pushViewController(histroiclPlaceDetailed, animated: true)
    }
    
    
    
    
}
