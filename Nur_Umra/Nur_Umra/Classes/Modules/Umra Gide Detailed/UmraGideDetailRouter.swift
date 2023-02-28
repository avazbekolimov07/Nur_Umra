//
//  UmraGideDetailRouter.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 27/02/23.
//

import UIKit

class UmraGideDetailRouter {
    
    // MARK: Static methods
    static func createModule(with handbook: HandbookDM) -> UIViewController {
        let viewController = UmraGideDetailViewController()
        
        let presenter: ViewToPresenterUmraGideDetailProtocol & InteractorToPresenterUmraGideDetailProtocol = UmraGideDetailPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = UmraGideDetailRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = UmraGideDetailInteractor()
        viewController.presenter?.interactor?.handbook = handbook
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}

extension UmraGideDetailRouter: PresenterToRouterUmraGideDetailProtocol {
    
    // MARK: - Navigation
    
}
