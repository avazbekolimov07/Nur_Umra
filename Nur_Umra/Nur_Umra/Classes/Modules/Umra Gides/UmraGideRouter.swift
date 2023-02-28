//
//  UmraGideRouter.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 22/02/23
//

import UIKit

class UmraGideRouter {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        let viewController = UmraGideViewController()
        
        let presenter: ViewToPresenterUmraGideProtocol & InteractorToPresenterUmraGideProtocol = UmraGidePresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = UmraGideRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = UmraGideInteractor()
        viewController.presenter?.interactor?.presenter = presenter

        return viewController
    }
}

extension UmraGideRouter: PresenterToRouterUmraGideProtocol {
    
    // MARK: - Navigation
    
    func pushToHandbookDetail(on view: PresenterToViewUmraGideProtocol, with handbook: HandbookDM) {
        let handbookDetailedVC = UmraGideDetailRouter.createModule(with: handbook)
        let viewController = view as! UmraGideViewController
        
        viewController.navigationController?.pushViewController(handbookDetailedVC, animated: true)
    }
    
}
