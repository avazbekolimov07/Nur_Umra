//
//  UmraGideContract.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 22/02/23
//

import UIKit


// MARK: View Output (Presenter -> View)
protocol PresenterToViewUmraGideProtocol: AnyObject {
    func onFetchHandbooksSuccess()
    func onFetchHandbooksFailure(error: String)

//    func showHUD()
//    func hideHUD()

    func createUIElements()
    func handleViewWillAppear()
    func handleViewDidDisappear()
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterUmraGideProtocol: AnyObject {
    
    var view: PresenterToViewUmraGideProtocol? { get set }
    var interactor: PresenterToInteractorUmraGideProtocol? { get set }
    var router: PresenterToRouterUmraGideProtocol? { get set }
    
    var handbooks: [HandbookDM]? { get set }

    func viewDidLoad()
    func viewWillAppear()
    func viewDidDisappear()

    func userWantsToPopVC()
    
    func numberOfRowsInSection() -> Int
    func eachHanbookData(indexPath: IndexPath) -> HandbookDM?

    func didSelectRowAt(indexPath: IndexPath)

}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorUmraGideProtocol: AnyObject {
    
    var presenter: InteractorToPresenterUmraGideProtocol? { get set }

    func loadHandbooks()
    
    func retrieveHandbookDetail(at index: Int)

}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterUmraGideProtocol: AnyObject {
    
    func fetchHandbooksSuccess(handbooks: [HandbookDM])
    func fetchHandbooksFailure(errorCode: Int)

    func getHandbookDetailSuccess(_ handbook: HandbookDM)
    func getHandbookDetailFailure()

}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterUmraGideProtocol: AnyObject {
    
    static func createModule() -> UIViewController

    func pushToHandbookDetail(on view: PresenterToViewUmraGideProtocol, with handbook: HandbookDM)
    func popVC(inView: PresenterToViewUmraGideProtocol)

}
