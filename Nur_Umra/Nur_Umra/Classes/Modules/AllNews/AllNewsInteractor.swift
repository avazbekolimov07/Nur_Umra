//
//  AllNewsInteractor.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 21/02/23.
//

import Foundation
class AllNewsInteractor: PresenterToInteractorAllNewsProtocol {
    
   
    

    // MARK: Properties
    weak var presenter: InteractorToPresenterAllNewsProtocol?
    var news: [NewsDM]?
    
    func loadNews() {
        print("Interactor receives the request from Presenter to load quotes from the server.")
        HomeService.shared.getNews(success: { (code, news) in
            self.news = news
            self.presenter?.fetchNewsSuccess(news: news)
        }) { (code) in
            self.presenter?.fetchNewsFailure(errorCode: code)
        }
    }
    
}
