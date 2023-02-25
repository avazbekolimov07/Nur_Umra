//
//  NewsDetailedContract.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 24/02/23.
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewNewsDetailedProtocol: AnyObject {

    func createUIElements()
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterNewsDetailedProtocol: AnyObject {
    
    var view: PresenterToViewNewsDetailedProtocol { get set }
    var interactor: PresenterToInteractorNewsDetailedProtocol { get set }
    var router: PresenterToRouterNewsDetailedProtocol { get set }
    
    var news: NewsDM { get set }
    
 
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorNewsDetailedProtocol: AnyObject {
    
    var presenter: InteractorToPresenterNewsDetailedProtocol { get set }
    var detailedNews: NewsDM { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterNewsDetailedProtocol: AnyObject {
    
    func getDetailedNews()

}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterNewsDetailedProtocol: AnyObject {
    

}
