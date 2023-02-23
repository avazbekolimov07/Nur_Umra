//
//  HomeRouter.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 21/02/23.
//

import UIKit


class HomeRouter {
    
    // MARK: Static methods
    static func createModule() -> UINavigationController {
        let viewController = HomeViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        let presenter: ViewToPresenterHomeProtocol & InteractorToPresenterHomeProtocol = HomePresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = HomeRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = HomeInteractor()
        viewController.presenter?.interactor?.presenter = presenter

        return navigationController
    }
}

extension HomeRouter: PresenterToRouterHomeProtocol {
    
    // MARK: - Navigation
    func pushToNewDetail(on view: PresenterToViewHomeProtocol, with new: NewsDM) {
        print("New Detail")
//        let quoteDetailViewController = QuoteDetailRouter.createModule(with: new)

//        let viewController = view as! AllNewsViewController
//        viewController.navigationController?
//            .pushViewController(quoteDetailViewController, animated: true)
    }
    
    func pushToAllNews(on view: PresenterToViewHomeProtocol, with allNews: [NewsDM]) {
        let AllNewsViewController = AllNewsRouter.createModule(with: allNews)
        let viewController = view as! HomeViewController
        viewController.navigationController?
            .pushViewController(AllNewsViewController, animated: true)
    }
    
}

