//
//  NewsDetailedInteractor.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 24/02/23.
//

import Foundation

class NewsDetailedInteractor: PresenterToInteractorNewsDetailedProtocol {
    
    var presenter: InteractorToPresenterNewsDetailedProtocol?
    
    var detailedNews: NewsDM?
    
    
    func retrievDetailedNews() {
        guard let safeDetailedNews = detailedNews
        else {
        print("no data")
            return
        }
        
        presenter?.getDetailedNews(news: safeDetailedNews)
    }
    
    
    
}
