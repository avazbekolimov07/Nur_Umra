//
//  NewsDetailedContract.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 24/02/23.
//

import Foundation

import UIKit

// MARK: View Output (Presenter -> View)

protocol PresenterToViewNewsDetailedProtocol {
    
    func onFetchError()
    
    func createUIElements()
    
    func updateUIElements(with news: NewsDM)
}


// MARK: View Input (View -> Presenter)

protocol ViewToPresenterNewsDetailedProtocol {
    
    var view: PresenterToViewNewsDetailedProtocol? { get set }
    var interactor: PresenterToInteractorNewsDetailedProtocol? { get set }
    var router: PresenterToRouterNewsDetailedProtocol? { get set }
    
    var newsDetailed: NewsDM? { get set }
    
    func viewDidLoad()
    
}

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorNewsDetailedProtocol {
    
    var presenter: InteractorToPresentjrNewsDetailedProtocol? { get set }
    var newsDetailed: NewsDM? { get set }
    func retrieveNewsDetailed()
}

// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresentjrNewsDetailedProtocol {
    func getNewsDetailedSuccess(news: NewsDM)
    func getNewsDetailedFailure()
}


// MARK: Router Input (Presenter -> Router)

protocol PresenterToRouterNewsDetailedProtocol {
    static func createModule(with news: NewsDM) -> UIViewController
}
