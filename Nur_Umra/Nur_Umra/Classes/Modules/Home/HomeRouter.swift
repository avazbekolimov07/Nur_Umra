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
 
    
    func showShareView(link: String, view: PresenterToViewHomeProtocol) {
        let vc = view as! HomeViewController
        
        let myWebsite = URL(string: link)
        let objectsToShare = [myWebsite]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        
        //Excluded Activities
        activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList]
        activityVC.popoverPresentationController?.sourceView = vc.view
        vc.present(activityVC, animated: true)
    }
    
    // MARK: - Navigation
    func pushToNewDetail(on view: PresenterToViewHomeProtocol, with new: NewsDM) {
        let newsDetailedVC = NewsDetailsRouter.createModule(with: new)

        let viewController = view as! HomeViewController
        viewController.navigationController?
            .pushViewController(newsDetailedVC, animated: true)
    }
    
    func pushToAllNews(on view: PresenterToViewHomeProtocol, with allNews: [NewsDM]) {
        let AllNewsViewController = AllNewsRouter.createModule(with: allNews)
        let viewController = view as! HomeViewController
        viewController.navigationController?
            .pushViewController(AllNewsViewController, animated: true)
    }
    
    func pushToUmraGide(on view: PresenterToViewHomeProtocol) {
        let UmraGideViewController = UmraGideRouter.createModule()
        let viewController = view as! HomeViewController
        viewController.navigationController?
            .pushViewController(UmraGideViewController, animated: true)
    }
    
    func pushToUmraAudios(on view: PresenterToViewHomeProtocol) {
        let UmraAudiosViewController = UmraAudiosRouter.createModule()
        let viewController = view as! HomeViewController
        viewController.navigationController?
            .pushViewController(UmraAudiosViewController, animated: true)
    }
    
    func pushToPreparationForUmra(on view: PresenterToViewHomeProtocol) {
        let PreparationForUmraVC = PreparationForUmraRouter.createModule()
        let viewController = view as! HomeViewController
        viewController.navigationController?.pushViewController(PreparationForUmraVC, animated: true)
    }
    
    func pushToHistoricalPlaces(on view: PresenterToViewHomeProtocol) {
        let historicalPlaces = HistoricalPlacesRouter.createModule()
        let viewController = view as! HomeViewController
        viewController.navigationController?.pushViewController(historicalPlaces, animated: true)
    }
    
    
}

