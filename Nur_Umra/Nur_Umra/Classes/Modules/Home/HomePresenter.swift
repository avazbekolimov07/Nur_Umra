//
//  HomePresenter.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 20/02/23.
//

import UIKit


class HomePresenter: ViewToPresenterHomeProtocol {
    
    // MARK: Properties
    weak var view: PresenterToViewHomeProtocol?
    var interactor: PresenterToInteractorHomeProtocol?
    var router: PresenterToRouterHomeProtocol?

    // MARK: Inputs from view
    func viewDidLoad() {
        print("Presenter is being notified that the View was loaded.")
        
        view?.createUIElements()
//        view?.showHUD()
//        interactor?.loadQuotes()
    }
    
}

// MARK: - Outputs to view
extension HomePresenter: InteractorToPresenterHomeProtocol {
    
//    func fetchQuotesSuccess(quotes: [Quote]) {
//        print("Presenter receives the result from Interactor after it's done its job.")
//        self.quotesStrings = quotes.compactMap { $0.quote }
//        view?.hideHUD()
//        view?.onFetchQuotesSuccess()
//    }
//    
//    func fetchQuotesFailure(errorCode: Int) {
//        print("Presenter receives the result from Interactor after it's done its job.")
//        view?.hideHUD()
//        view?.onFetchQuotesFailure(error: "Couldn't fetch quotes: \(errorCode)")
//    }
//    
//    func getQuoteSuccess(_ quote: Quote) {
//        router?.pushToQuoteDetail(on: view!, with: quote)
//    }
//    
//    func getQuoteFailure() {
//        view?.hideHUD()
//        print("Couldn't retrieve quote by index")
//    }
    
    
}
