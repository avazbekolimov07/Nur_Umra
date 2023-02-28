//
//  NewsDetailedRouter.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 24/02/23.
//

import UIKit

class NewsDetailsRouter: PresenterToRouterNewsDetailedProtocol {
    
    static func createModule(with news: NewsDM) -> UIViewController {
        let viewController = NewsDetailedViewController()
        
        let presenter: ViewToPresenterNewsDetailedProtocol & InteractorToPresenterNewsDetailedProtocol = NewsDetailsPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = NewsDetailsRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = NewsDetailedInteractor()
        viewController.presenter?.interactor?.newsDetailed = news
        viewController.presenter?.interactor?.presenter = presenter
        
        
        return viewController
    }
    
    func popVC(inView: PresenterToViewNewsDetailedProtocol) {
        print("pop vc is working ----->>> Router")
        let vc = inView as! NewsDetailedViewController
        vc.navigationController?.popViewController(animated: true)
    }
    
    
}
