//
//  AllNewsContract.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 21/02/23.
//

import Foundation

// MARK: View Output (Presenter -> View)
protocol PresenterToViewAllNewsProtocol: AnyObject {
    func onFetchNewsSuccess()
    func onFetchNewsFailure(error: String)

    func  createUIElements()
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterAllNewsProtocol: AnyObject {
    
    var view: PresenterToViewAllNewsProtocol? { get set }
    var interactor: PresenterToInteractorAllNewsProtocol? { get set }
    var router: PresenterToRouterAllNewsProtocol? { get set }
    
//    var quotesStrings: [String]? { get set }

    func viewDidLoad()

    func refresh()
//
    func numberOfRowsInSection() -> Int

//
    func didSelectRowAt(index: Int)
//    func deselectRowAt(index: Int)

}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorAllNewsProtocol: AnyObject {
    
    var presenter: InteractorToPresenterAllNewsProtocol? { get set }
    
    func loadNews()
//    func retrieveQuote(at index: Int)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterAllNewsProtocol: AnyObject {
    
    func fetchNewsSuccess(news: [NewsDM])
    func fetchNewsFailure(errorCode: Int)

//    func getNewsSuccess(_ news: NewsDM)
//    func getNewsFailure()
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterAllNewsProtocol: AnyObject {
    
//    static func createModule() -> UINavigationController
//
//    func pushToAllNews(on view: PresenterToViewHomeProtocol, with news: NewsDM)
}
