//
//  AllNewsPresenter.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 21/02/23.
//

import UIKit
import SwiftyJSON

class AllNewsPresenter: ViewToPresenterAllNewsProtocol {

    
    
    // MARK: Properties
    weak var view: PresenterToViewAllNewsProtocol?
    var interactor: PresenterToInteractorAllNewsProtocol?
    var router: PresenterToRouterAllNewsProtocol?
    
    var news: [NewsDM]?
    
    // MARK: Inputs from view
    func viewDidLoad() {
        print("Presenter is being notified that the View was loaded.")
        
        view?.createUIElements()
        interactor?.retrieveAllNews()

    }
    
    func refresh() {
        print("Presenter is being notified that the View was refreshed.")
        interactor?.loadNews()
    }
    
    //MARK: SHARE>>>
    func didShowShareView(link: String) {
      let myWebsite = URL(string: link)
         let objectsToShare = [myWebsite]
         let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)

         //Excluded Activities
         activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList]

        view?.showShareView(shareView: activityVC)

    }
    
    
    
    func numberOfRowsInSection() -> Int {
        guard let news = news else {
            return 0
        }
        return news.count
    }
    
    func didSelectRowAt(index: Int) {
//        interactor?.retrieveQuote(at: index)
    }
    
}

// MARK: - Outputs to view
extension AllNewsPresenter: InteractorToPresenterAllNewsProtocol {
    
    func getAllNewsSuccess(_ allNews: [NewsDM]) {
        self.news = allNews
        view?.onFetchNewsSuccess()
    }
    
    func getAllNewsFailure() {
//        view?.hideHUD()
        print("Couldn't retrieve all news")
    }
    
    
    func fetchNewsSuccess(news: [NewsDM]) {
        print("Presenter receives the result from Interactor after it's done its job.")
        self.news = news
//        view?.hideHUD()
        view?.onFetchNewsSuccess()
        
    }
    
    func fetchNewsFailure(errorCode: Int) {
        print("Presenter receives the result from Interactor after it's done its job.")
//        view?.hideHUD()
        view?.onFetchNewsFailure(error: "Couldn't fetch news: \(errorCode)")
    }
  

    
    
}
