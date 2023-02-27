//
//  Preparation for Umra Contract.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 27/02/23.
//
import UIKit

// MARK: View Output (Presenter -> View)
protocol PresenterToViewPreparationForUmraProtocol: AnyObject {
    
    
}


// MARK: View Input (View -> Presenter)
protocol ViewtoPresenterPreparationForUmraProtocol: AnyObject {
    var view: PresenterToViewPreparationForUmraProtocol? { get set }
    var interactor: PresenterToInteractorPreparationForUmraProtocol? { get set }
    var router: PresenterToRouterPreparationForUmraProtocol? { get set }
    
    func didLoad()
}

// MARK: Interactor Input (Presenter -> Interactor)

protocol PresenterToInteractorPreparationForUmraProtocol: AnyObject {
    
}

// MARK: Interactor Output (Interactor -> Presenter)

protocol InteractorToPresenterPreparationForUmraProtocol: AnyObject {
    
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterPreparationForUmraProtocol: AnyObject {
    func createModule(with: [PreparationDm]) -> UIViewController
}
