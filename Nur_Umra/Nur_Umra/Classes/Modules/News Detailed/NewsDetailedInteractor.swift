//
//  NewsDetailedInteractor.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 24/02/23.
//

import Foundation

class NewsDetailedInteractor: PresenterToInteractorNewsDetailedProtocol {
 
    // MARK: Properties
    var presenter: InteractorToPresenterNewsDetailedProtocol?
    var newsDetailed: NewsDM?
    
    func retrieveNewsDetailed() {
        if let safeDetailedNews = newsDetailed {
            print("success get news detiled should work")
            presenter?.getNewsDetailedSuccess(news: safeDetailedNews)
        } else {
            print("failure get news detiled should  not work")
            presenter?.getNewsDetailedFailure()
        }
    }
    
    
 
}
