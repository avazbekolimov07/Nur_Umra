//
//  AllNewsContract.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 21/02/23.
//

import Foundation
import UIKit

// MARK: View Output (Presenter -> View)
protocol PresenterToViewAllNewsProtocol: AnyObject {
    func onFetchNewsSuccess()
    func onFetchNewsFailure(error: String)
    
 
    func  createUIElements()
    
    func showShareView(shareView: UIActivityViewController)
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

    func didShowShareView(link: String)
    
    func didSelectRowAt(index: Int)
    
   

}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorAllNewsProtocol: AnyObject {
    
    var presenter: InteractorToPresenterAllNewsProtocol? { get set }
    
    var news: [NewsDM]? { get set}
    
    func loadNews()
    
    func retrieveAllNews()
    
    func getSpecificNews(indexPAth: IndexPath) -> NewsDM?

}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterAllNewsProtocol: AnyObject {
    
    func fetchNewsSuccess(news: [NewsDM])
    func fetchNewsFailure(errorCode: Int)
    
    func getAllNewsSuccess(_ allNews: [NewsDM])
    func getAllNewsFailure()

    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterAllNewsProtocol: AnyObject {
    static func createModule(with allNews: [NewsDM]?) -> UIViewController

}
