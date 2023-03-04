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
    
  
    func showShareView(link: String, view: PresenterToViewAllNewsProtocol) {
        let vc = view as! AllNewsViewController
        
        let myWebsite = URL(string: link)
        let objectsToShare = [myWebsite]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        
        //Excluded Activities
        activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList]
        vc.present(activityVC, animated: true)
       
    
    }
   
//     MARK: - Push to view
    
    func pushtoNewsDetailed(on view: PresenterToViewAllNewsProtocol, with news: NewsDM) {
        let newsDetailedVC = NewsDetailsRouter.createModule(with: news)
        let viewController = view as! AllNewsViewController
        
        viewController.navigationController?.pushViewController(newsDetailedVC, animated: true)
    }
    
    func openInWeb(link: String) {
        if let url = URL(string: link) {
            UIApplication.shared.open(url)
        }
    }
   
    
}

