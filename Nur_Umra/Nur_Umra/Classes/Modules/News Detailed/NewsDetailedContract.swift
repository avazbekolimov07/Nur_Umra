//
//  NewsDetailedContract.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 24/02/23.
//

import Foundation

import UIKit

// MARK: View Output (Presenter -> View)

protocol PresenterToViewNewsDetailedProtocol: AnyObject {
    
    func onUpdateUIElementsFailure()
    func onUpdateUIElementsSuccess(with news: NewsDM)
    
    func createUIElements()
    
    func handleViewWillAppear()
    func handleViewWillDisappear()
}


// MARK: View Input (View -> Presenter)

protocol ViewToPresenterNewsDetailedProtocol: AnyObject {
    
    var view: PresenterToViewNewsDetailedProtocol? { get set }
    var interactor: PresenterToInteractorNewsDetailedProtocol? { get set }
    var router: PresenterToRouterNewsDetailedProtocol? { get set }
    
    var newsDetailed: NewsDM? { get set }
    
    func viewDidLoad()
    func viewWillAppear()
    func viewWillDisappear()
}

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorNewsDetailedProtocol: AnyObject {
    
    var presenter: InteractorToPresenterNewsDetailedProtocol? { get set }
    var newsDetailed: NewsDM? { get set }
    func retrieveNewsDetailed()
}

// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterNewsDetailedProtocol {
    func getNewsDetailedSuccess(news: NewsDM)
    func getNewsDetailedFailure()
}


// MARK: Router Input (Presenter -> Router)

protocol PresenterToRouterNewsDetailedProtocol: AnyObject {
    static func createModule(with news: NewsDM) -> UIViewController
}
