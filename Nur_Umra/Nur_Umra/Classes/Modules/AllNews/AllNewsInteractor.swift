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
//            self.presenter?.getAllNewsSuccess(news)
        }) { (code) in
            self.presenter?.fetchNewsFailure(errorCode: code)
        }
    }
    
    func retrieveAllNews() {
        guard let safeAllNews = news
        else {
            print("Failure is going on, - news",news)
            presenter?.getAllNewsFailure()
            return
        }
        print("Is good", safeAllNews)
        presenter?.getAllNewsSuccess(safeAllNews)
        
    }
    
    
    
    func getSpecificNews(indexPAth: IndexPath) -> NewsDM? {
        guard let specificNews = news?[indexPAth.row]
        else {
            return nil
        }
        return specificNews
    }
    
    
    
}
