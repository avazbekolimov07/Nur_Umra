//
//  HomeContact.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 20/02/23.
//

import UIKit


// MARK: View Output (Presenter -> View)
protocol PresenterToViewHomeProtocol: AnyObject {
    func onFetchNewsSuccess()
    func onFetchNewsFailure(error: String)

//    func showHUD()
//    func hideHUD()
//
//    func deselectRowAt(row: Int)
    func  createUIElements()
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterHomeProtocol: AnyObject {
    
    var view: PresenterToViewHomeProtocol? { get set }
    var interactor: PresenterToInteractorHomeProtocol? { get set }
    var router: PresenterToRouterHomeProtocol? { get set }
    
//    var quotesStrings: [String]? { get set }

    func viewDidLoad()

    func refresh()
//
    func numberOfRowsInSection() -> Int
//    func textLabelText(indexPath: IndexPath) -> String?
//
    func didSelectRowAt(index: Int)
//    func deselectRowAt(index: Int)

}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorHomeProtocol: AnyObject {
    
    var presenter: InteractorToPresenterHomeProtocol? { get set }
    
    func loadNews()
//    func retrieveQuote(at index: Int)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterHomeProtocol: AnyObject {
    
    func fetchNewsSuccess(news: [NewsDM])
    func fetchNewsFailure(errorCode: Int)

//    func getNewsSuccess(_ news: NewsDM)
//    func getNewsFailure()
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterHomeProtocol: AnyObject {
    
//    static func createModule() -> UINavigationController
//
//    func pushToAllNews(on view: PresenterToViewHomeProtocol, with news: NewsDM)
}
