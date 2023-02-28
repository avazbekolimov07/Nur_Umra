//
//  UmraGideDetailContract.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 27/02/23.
//

import UIKit


// MARK: View Output (Presenter -> View)
protocol PresenterToViewUmraGideDetailProtocol: AnyObject {
    func onUpdateUIElementsSuccess(with handbook: HandbookDM)
    func onUpdateUIElementsFailure()

//    func showHUD()
//    func hideHUD()

    func createUIElements()
    func handleViewWillAppear()
    func handleViewWillDisappear()
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterUmraGideDetailProtocol: AnyObject {
    
    var view: PresenterToViewUmraGideDetailProtocol? { get set }
    var interactor: PresenterToInteractorUmraGideDetailProtocol? { get set }
    var router: PresenterToRouterUmraGideDetailProtocol? { get set }
    
    var handbook: HandbookDM? { get set }

    func viewDidLoad()
    func viewWillAppear()
    func viewWillDisappear()

}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorUmraGideDetailProtocol: AnyObject {
    
    var presenter: InteractorToPresenterUmraGideDetailProtocol? { get set }
    var handbook: HandbookDM? { get set }
    func retrieveHandbookDetailed()

}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterUmraGideDetailProtocol: AnyObject {
    func getHandbookDetailedSuccess(handbook: HandbookDM)
    func getHandbookDetailedFailure()

}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterUmraGideDetailProtocol: AnyObject {
    
    static func createModule(with handbook: HandbookDM) -> UIViewController

}
