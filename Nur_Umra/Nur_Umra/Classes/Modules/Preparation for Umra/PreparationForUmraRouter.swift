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
       return viewController
    }
    
    func popVC(inView: PresenterToViewPreparationForUmraProtocol) {
        let vc = inView as? PreparationForUmraViewController
        vc?.navigationController?.popViewController(animated: true)
    }
}
