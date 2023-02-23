//
//  UmraGideContract.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 22/02/23
//

import UIKit


// MARK: View Output (Presenter -> View)
protocol PresenterToViewUmraGideProtocol: AnyObject {
//    func onFetchNewsSuccess()
//    func onFetchNewsFailure(error: String)

//    func showHUD()
//    func hideHUD()

    func  createUIElements()
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterUmraGideProtocol: AnyObject {
    
    var view: PresenterToViewUmraGideProtocol? { get set }
    var interactor: PresenterToInteractorUmraGideProtocol? { get set }
    var router: PresenterToRouterUmraGideProtocol? { get set }
    
    var handbooks: [HandbookDM]? { get set }

    func viewDidLoad()

//    func refresh()
//
//    func numberOfRowsInSection() -> Int
//    func eachNewsData(indexPath: IndexPath) -> NewsDM?
//
//    func didSelectMore()
//    func didSelectRowAt(indexPath: IndexPath)
//
//    func didShowShareView(link: String)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorUmraGideProtocol: AnyObject {
    
    var presenter: InteractorToPresenterUmraGideProtocol? { get set }

//    func loadNews()
//    func retrieveNewDetail(at index: Int)
//    func retrieveAllNews()
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterUmraGideProtocol: AnyObject {
    
//    func fetchNewsSuccess(news: [NewsDM])
//    func fetchNewsFailure(errorCode: Int)
//
//    func getNewsDetailSuccess(_ news: NewsDM)
//    func getNewsDetailFailure()
//
//    func getAllNewsSuccess(_ allNews: [NewsDM])
//    func getAllNewsFailure()
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterUmraGideProtocol: AnyObject {
    
    static func createModule() -> UIViewController

//    func pushToNewDetail(on view: PresenterToViewHomeProtocol, with new: NewsDM)
//    func pushToAllNews(on view: PresenterToViewHomeProtocol, with allNews: [NewsDM])
}
