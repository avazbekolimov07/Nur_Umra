//
//  HistoricalPlacesDetailedRouter.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 28/02/23.
//

import UIKit

class HistoricalPlacesDetailedRouter: PresenterToRouterHistoricalPlacesDetailedProtocol {
  
    
   
   static func createModule(withPlace: HistoricalPlacesDM) -> UIViewController {
        let viewController = HistoricalPlacesDetailedViewController()
        let presenter: ViewToPresenterHistoricalPlacesDetailedProtocol & InteractorToPresenterHistoricalPlacesDetailedProtocol = HistoricalPlacesDetailedPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = HistoricalPlacesDetailedInteractor()
        viewController.presenter?.router = HistoricalPlacesDetailedRouter()
        viewController.presenter?.interactor?.presenter = presenter
        viewController.presenter?.interactor?.historicalPlace = withPlace
        
        return viewController
    }
    
   
        func popVC(inView: PresenterToViewHistoricalPlacesDetailedProtocol) {
            print("pop vc is working ----->>> Router")
            let vc = inView as! HistoricalPlacesDetailedViewController
            vc.navigationController?.popViewController(animated: true)
        }
    
    func showMaps(inView: PresenterToViewHistoricalPlacesDetailedProtocol, withLat: String, long: String) {
        print("router  -> should show map view ")
        let vc = inView as! HistoricalPlacesDetailedViewController
        let presentedVC = MapViewRouter.createModule(withLat: withLat, long: long)
        presentedVC.modalPresentationStyle = .formSheet
        vc.present(presentedVC, animated: true)
    }
    
    
}
