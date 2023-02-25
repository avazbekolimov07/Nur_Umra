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
        print("Umra Audio Detail Page", duo.name)
    }
    
//    func pushToNewDetail(on view: PresenterToViewHomeProtocol, with new: NewsDM) {
//        print("New Detail Page")
//        let quoteDetailViewController = QuoteDetailRouter.createModule(with: new)

//        let viewController = view as! UmraGideViewController
//        viewController.navigationController?
//            .pushViewController(quoteDetailViewController, animated: true)
//    }
    
//    func pushToAllNews(on view: PresenterToViewHomeProtocol, with allNews: [NewsDM]) {
//        print("All News Page")
//        let allNewsViewController = AllNewsRouter.createModule(with: allNews)
//
//        let viewController = view as! UmraGideViewController
//        viewController.navigationController?
//            .pushViewController(viewController, animated: true)
//    }
    
}
