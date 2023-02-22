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
    
//    func loadQuotes() {
//        print("Interactor receives the request from Presenter to load quotes from the server.")
//        QuoteService.shared.getQuotes(count: 6, success: { (code, quotes) in
//            self.quotes = quotes
//            self.presenter?.fetchQuotesSuccess(quotes: quotes)
//        }) { (code) in
//            self.presenter?.fetchQuotesFailure(errorCode: code)
//        }
//    }
    
}



