//
//  UmraAudioDetailRouter.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 27/02/23.
//

import UIKit

class UmraAudioDetailRouter {
    
    // MARK: Static methods
    static func createModule(with duo: DuoDM) -> UIViewController {
        let viewController = UmraAudioDetailViewController()
        
        let presenter: ViewToPresenterUmraAudioDetailProtocol & InteractorToPresenterUmraAudioDetailProtocol = UmraAudioDetailPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = UmraAudioDetailRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = UmraAudioDetailInteractor()
        viewController.presenter?.interactor?.duo = duo
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}

extension UmraAudioDetailRouter: PresenterToRouterUmraAudioDetailProtocol {
    
    // MARK: - Navigation
    
}
