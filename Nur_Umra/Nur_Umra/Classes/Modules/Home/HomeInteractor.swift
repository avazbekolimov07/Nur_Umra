//
//  HomeInteractor.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 20/02/23.
//

import UIKit


class HomeInteractor: PresenterToInteractorHomeProtocol {

    // MARK: Properties
    weak var presenter: InteractorToPresenterHomeProtocol?
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



