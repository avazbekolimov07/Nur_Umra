//
//  NewsDetailedPresenter.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 24/02/23.
//

import Foundation

class NewsDetailsPresenter: ViewToPresenterNewsDetailedProtocol {
    
    // MARK: Properties
    weak var view: PresenterToViewNewsDetailedProtocol?
    var interactor: PresenterToInteractorNewsDetailedProtocol?
    var router: PresenterToRouterNewsDetailedProtocol?
    
    var newsDetailed: NewsDM?
    
    // MARK: Inputs from view
    func viewDidLoad() {
        print("Did load of news detailed")
        view?.createUIElements()
        interactor?.retrieveNewsDetailed()
    }
    
    func viewWillAppear() {
           view?.handleViewWillAppear()
    }
       
    func viewWillDisappear() {
           view?.handleViewWillDisappear()
    }
    
    func userWantsToPopVC() {
        router?.popVC(inView: view!)
    }
    
}

// MARK: - Outputs to view
extension NewsDetailsPresenter: InteractorToPresenterNewsDetailedProtocol {
    
    func getNewsDetailedSuccess(news: NewsDM) {
        self.newsDetailed = news
        view?.onUpdateUIElementsSuccess(with: news)
    }
    
    func getNewsDetailedFailure() {
        view?.onUpdateUIElementsFailure()
    }
    
    
}
