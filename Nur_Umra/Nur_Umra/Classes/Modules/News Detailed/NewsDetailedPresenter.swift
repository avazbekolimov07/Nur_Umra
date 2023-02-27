//
//  NewsDetailedPresenter.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 24/02/23.
//

import Foundation

class NewsDetailsPresenter: ViewToPresenterNewsDetailedProtocol {
    
    
    var view: PresenterToViewNewsDetailedProtocol?
    
    var interactor: PresenterToInteractorNewsDetailedProtocol?
    
    var router: PresenterToRouterNewsDetailedProtocol?
    
    var newsDetailed: NewsDM?
    
    func viewDidLoad() {
        print("Did load of news detailed")
        view?.createUIElements()
        interactor?.retrieveNewsDetailed()
    }
    
    
    
}

extension NewsDetailsPresenter: InteractorToPresentjrNewsDetailedProtocol {
    
    func getNewsDetailedSuccess(news: NewsDM) {
        self.newsDetailed = news
        view?.updateUIElements(with: news)
    }
    
    func getNewsDetailedFailure() {
        print("Could not get news detailed")
    }
    
    
}
