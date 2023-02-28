//
//  HomeContact.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 21/02/23.
//

import UIKit


// MARK: View Output (Presenter -> View)
protocol PresenterToViewHomeProtocol: AnyObject {
    func onFetchNewsSuccess()
    func onFetchNewsFailure(error: String)

//    func showHUD()
//    func hideHUD()

    func  createUIElements()
    func handleViewWillAppear()
    func handleViewWillDisappear()
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterHomeProtocol: AnyObject {
    
    var view: PresenterToViewHomeProtocol? { get set }
    var interactor: PresenterToInteractorHomeProtocol? { get set }
    var router: PresenterToRouterHomeProtocol? { get set }
    
    var news: [NewsDM]? { get set }
    
    func viewDidLoad()
    func viewWillAppear()
    func viewWillDisappear()

    func refresh()

    func numberOfRowsInSection() -> Int
    func eachNewsData(indexPath: IndexPath) -> NewsDM?

    func didSelectMore()
    func didSelectRowAt(indexPath: IndexPath)

    func didShowShareView(link: String)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorHomeProtocol: AnyObject {
    
    var presenter: InteractorToPresenterHomeProtocol? { get set }
    
    func loadNews()
    func retrieveNewDetail(at index: Int)
    func retrieveAllNews()
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterHomeProtocol: AnyObject {
    
    func fetchNewsSuccess(news: [NewsDM])
    func fetchNewsFailure(errorCode: Int)

    func getNewsDetailSuccess(_ news: NewsDM)
    func getNewsDetailFailure()
    
    func getAllNewsSuccess(_ allNews: [NewsDM])
    func getAllNewsFailure()
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterHomeProtocol: AnyObject {
    
    static func createModule() -> UINavigationController
    
    func showShareView(link: String, view: PresenterToViewHomeProtocol)
    
    func pushToNewDetail(on view: PresenterToViewHomeProtocol, with new: NewsDM)
    func pushToAllNews(on view: PresenterToViewHomeProtocol, with allNews: [NewsDM])
    
    func pushToUmraGide(on view: PresenterToViewHomeProtocol)
    func pushToUmraAudios(on view: PresenterToViewHomeProtocol)
    
    func pushToPreparationForUmra(on view: PresenterToViewHomeProtocol)
    func pushToHistoricalPlaces(on view: PresenterToViewHomeProtocol)
}
