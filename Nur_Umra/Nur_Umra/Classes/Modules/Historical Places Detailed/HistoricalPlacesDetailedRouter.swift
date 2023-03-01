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
    
    func showMaps(inView: PresenterToViewHistoricalPlacesDetailedProtocol) {
        let vc = inView as! HistoricalPlacesDetailedViewController
        vc.modalPresentationStyle = .
        vc.present(<#T##viewControllerToPresent: UIViewController##UIViewController#>, animated: <#T##Bool#>)
    }
    
    
}
