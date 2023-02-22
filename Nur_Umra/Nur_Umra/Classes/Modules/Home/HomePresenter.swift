//
//  HomePresenter.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 20/02/23.
//

import UIKit
import SwiftyJSON

class HomePresenter: ViewToPresenterHomeProtocol {
    
    // MARK: Properties
    weak var view: PresenterToViewHomeProtocol?
    var interactor: PresenterToInteractorHomeProtocol?
    var router: PresenterToRouterHomeProtocol?

    var news: [NewsDM]?
    
    // MARK: Inputs from view
    func viewDidLoad() {
        print("Presenter is being notified that the View was loaded.")
        
        view?.createUIElements()
//        view?.showHUD()
        interactor?.loadNews()
    }
    
    func refresh() {
        print("Presenter is being notified that the View was refreshed.")
        interactor?.loadNews()
    }
    
    func numberOfRowsInSection() -> Int {
        guard let news = self.news else {
            return 0
        }
        return news.count
    }
    
    func didSelectRowAt(index: Int) {
//        interactor?.retrieveQuote(at: index)
    }
    
}

// MARK: - Outputs to view
extension HomePresenter: InteractorToPresenterHomeProtocol {
    
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
  
//    func getQuoteSuccess(_ quote: Quote) {
//        router?.pushToQuoteDetail(on: view!, with: quote)
//    }
//    
//    func getQuoteFailure() {
//        view?.hideHUD()
//        print("Couldn't retrieve quote by index")
//    }
    
    
}
