//
//  PreparationForUmraRouter.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 27/02/23.
//

import Foundation
import UIKit

class PreparationForUmraRouter: PresenterToRouterPreparationForUmraProtocol {
   static func createModule() -> UIViewController {
        let viewController = PreparationForUmraViewController()
        
        let presenter: ViewtoPresenterPreparationForUmraProtocol & InteractorToPresenterPreparationForUmraProtocol = PreparationForUmraPresenter()
       
        viewController.presenter = presenter
        viewController.presenter?.view = viewController
        viewController.presenter?.router = PreparationForUmraRouter()
        viewController.presenter?.interactor = PreparationForUmraInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        print("Preparation for umra module is working")
       return viewController
    }
    func popVC(inView: PresenterToViewHistoricalPlacesDetailedProtocol) {
        let vc = inView as? HistoricalPlacesDetailedViewController
        vc?.navigationController?.popViewController(animated: true)
    }
    
    
}
