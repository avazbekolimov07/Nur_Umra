//
//  HomePresenter.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 21/02/23.
//

import UIKit
import SwiftyJSON

class HomePresenter: ViewToPresenterHomeProtocol {
    
    // MARK: Properties
    weak var view: PresenterToViewHomeProtocol?
    var interactor: PresenterToInteractorHomeProtocol?
    var router: PresenterToRouterHomeProtocol?

    var news: [NewsDM]?
    
    // MARK: Inputs from view
    func viewDidLoad() {
        print("Presenter is being notified that the View was loaded.")
//        view?.showHUD()
        view?.createUIElements()
        interactor?.loadNews()
    }
    
    func refresh() {
        print("Presenter is being notified that the View was refreshed.")
        interactor?.loadNews()
    }
    
    func numberOfRowsInSection() -> Int {
        guard let news = self.news else {
            return 0
        }
        return news.count
    }
    
    func eachNewsData(indexPath: IndexPath) -> NewsDM? {
        guard let news = self.news else {
            return nil
        }
        
        return news[indexPath.row]
    }
    
    //MARK: - SHARE>>>
    func didShowShareView(link: String) {
        router?.showShareView(link: link, view: view!)
    }
    
    func didSelectRowAt(indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            interactor?.retrieveNewDetail(at: indexPath.item)
        default:
            switch indexPath.item {
            case 0:
                router?.pushToUmraGide(on: view!)
            case 1:
                router?.pushToUmraAudios(on: view!)
            case 2:
                print("3 cell")
            default:
                print("4 cell")
            }
        }
    }
    
    func didSelectMore() {
        interactor?.retrieveAllNews()
    }
    
    
}

// MARK: - Outputs to view
extension HomePresenter: InteractorToPresenterHomeProtocol {
    
    func fetchNewsSuccess(news: [NewsDM]) {
        print("Presenter receives the result from Interactor after it's done its job.")
        self.news = news
//        view?.hideHUD()
        view?.onFetchNewsSuccess()
    }
    func fetchNewsFailure(errorCode: Int) {
        print("Presenter receives the result from Interactor after it's done its job.")
//        view?.hideHUD()
        view?.onFetchNewsFailure(error: "Couldn't fetch news: \(errorCode)")
    }
  
    func getNewsDetailSuccess(_ news: NewsDM) {
        router?.pushToNewDetail(on: view!, with: news)
    }
    func getNewsDetailFailure() {
//        view?.hideHUD()
        print("Couldn't retrieve news by index")
    }
    
    func getAllNewsSuccess(_ allNews: [NewsDM]) {
        router?.pushToAllNews(on: view!, with: allNews)
    }
    func getAllNewsFailure() {
//        view?.hideHUD()
        print("Couldn't retrieve all news")
    }
    
    
}
