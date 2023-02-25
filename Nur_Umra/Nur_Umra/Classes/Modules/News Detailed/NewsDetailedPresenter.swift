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
    
    var news: NewsDM?
    
     
}

extension NewsDetailsPresenter: InteractorToPresenterNewsDetailedProtocol {
    func getDetailedNews(news: NewsDM) {
        print("get Detail")
    }
    
    
    
    
}
