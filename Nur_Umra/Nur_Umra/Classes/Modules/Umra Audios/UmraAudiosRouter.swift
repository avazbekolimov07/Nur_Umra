//
//  UmraAudiosRouter.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 25/02/23.
//

import UIKit

class UmraAudiosRouter {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        let viewController = UmraAudiosViewController()
        
        let presenter: ViewToPresenterUmraAudiosProtocol & InteractorToPresenterUmraAudiosProtocol = UmraAudiosPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = UmraAudiosRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = UmraAudiosInteractor()
        viewController.presenter?.interactor?.presenter = presenter

        return viewController
    }
}

extension UmraAudiosRouter: PresenterToRouterUmraAudiosProtocol {
    
    
    // MARK: - Navigation
    
    func pushToUmraAudioDetail(on view: PresenterToViewUmraAudiosProtocol, with duo: DuoDM) {
        let UmraAudioDetailViewController = UmraAudioDetailRouter.createModule(with: duo)

        let viewController = view as! UmraAudiosViewController
        viewController.navigationController?
            .pushViewController(UmraAudioDetailViewController, animated: true)
    }
    
}
