//
//  Preparation for Umra Contract.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 27/02/23.
//
import UIKit

// MARK: View Output (Presenter -> View)
protocol PresenterToViewPreparationForUmraProtocol: AnyObject {
    
    func onUpdateUIElementsSuccess(with preparation: PreparationDM)
    func onUpdateUIElementsFailure()
    
    func createUIElements()
    
}


// MARK: View Input (View -> Presenter)
protocol ViewtoPresenterPreparationForUmraProtocol: AnyObject {
    
    var view: PresenterToViewPreparationForUmraProtocol? { get set }
    var interactor: PresenterToInteractorPreparationForUmraProtocol? { get set }
    var router: PresenterToRouterPreparationForUmraProtocol? { get set }
    
    var preparationForUmra: PreparationDM? { get set }
    
    func viewDidLoad()
}

// MARK: Interactor Input (Presenter -> Interactor)

protocol PresenterToInteractorPreparationForUmraProtocol: AnyObject {
    
    var presenter: InteractorToPresenterPreparationForUmraProtocol? { get set }
    
    var preparationForUmra: PreparationDM? { get set }
    
    func loadPreparationForUmra()
}

// MARK: Interactor Output (Interactor -> Presenter)

protocol InteractorToPresenterPreparationForUmraProtocol: AnyObject {
    
    func getPreparionForUmraSucces(preparion: PreparationDM)
    func getPreparionForUmraFailure(errorCode: Int)
    
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterPreparationForUmraProtocol: AnyObject {
    static func createModule() -> UIViewController
}
