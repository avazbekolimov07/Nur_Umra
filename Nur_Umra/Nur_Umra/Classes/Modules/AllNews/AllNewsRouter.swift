//
//  AllNewsRouter.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 21/02/23.
//

import UIKit
class AllNewsRouter: PresenterToRouterAllNewsProtocol {
    static func createModule(with allNews: [NewsDM]?) -> UIViewController {
        let viewController = AllNewsViewController()

        let presenter: ViewToPresenterAllNewsProtocol & InteractorToPresenterAllNewsProtocol = AllNewsPresenter()

        viewController.presenter = presenter
        viewController.presenter?.router = AllNewsRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = AllNewsInteractor()
        if let safeNews = allNews {
            print(" \(allNews?.count) Retrieved news !")
            viewController.presenter?.interactor?.news = safeNews
        } else {
            print(" \(allNews?.count) Retrieved news !  Trying  loadNews is ")
            viewController.presenter?.interactor?.loadNews()
        }
        viewController.presenter?.interactor?.presenter = presenter

        return viewController
    }
    
  
    
    // MARK: - Navigation
//    func pushToQuoteDetail(on view: PresenterToViewQuotesProtocol, with quote: Quote) {
//        print("QuotesRouter is instructed to push QuoteDetailViewController onto the navigation stack.")
//        let quoteDetailViewController = QuoteDetailRouter.createModule(with: quote)
//
//        let viewController = view as! QuotesViewController
//        viewController.navigationController?
//            .pushViewController(quoteDetailViewController, animated: true)
//    }
    
}

