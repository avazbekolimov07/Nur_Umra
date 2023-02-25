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
        print("Umra Detail Page", handbook.name)
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
