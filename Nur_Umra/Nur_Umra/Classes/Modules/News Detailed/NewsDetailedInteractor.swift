//
//  NewsDetailedInteractor.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 24/02/23.
//

import Foundation

class NewsDetailedInteractor: PresenterToInteractorNewsDetailedProtocol {
 
    
    
    var presenter: InteractorToPresentjrNewsDetailedProtocol?
    var newsDetailed: NewsDM?
    
    func retrieveNewsDetailed() {
        if let safeDetailedNews = newsDetailed {
            print("sucess get news detiled should work")
            presenter?.getNewsDetailedSuccess(news: safeDetailedNews)
        } else {
            print("failure get news detiled should  nor work")
            presenter?.getNewsDetailedFailure()
        }
    }
    
    
 
}
