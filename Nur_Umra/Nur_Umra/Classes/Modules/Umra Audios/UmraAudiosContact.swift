//
//  UmraAudiosContact.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 25/02/23.
//

import UIKit


// MARK: View Output (Presenter -> View)
protocol PresenterToViewUmraAudiosProtocol: AnyObject {
    func onFetchDuolarSuccess()
    func onFetchDuolarFailure(error: String)

//    func showHUD()
//    func hideHUD()

    func  createUIElements()
    func handleViewWillAppear()
    func handleViewDidDisappear()
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterUmraAudiosProtocol: AnyObject {
    
    var view: PresenterToViewUmraAudiosProtocol? { get set }
    var interactor: PresenterToInteractorUmraAudiosProtocol? { get set }
    var router: PresenterToRouterUmraAudiosProtocol? { get set }
    
    var duolar: [DuoDM]? { get set }
    
    func viewDidLoad()
    func viewWillAppear()
    func viewDidDisappear()

    func numberOfRowsInSection() -> Int
    func eachUmraAudioData(indexPath: IndexPath) -> DuoDM?

    func didSelectRowAt(indexPath: IndexPath)

}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorUmraAudiosProtocol: AnyObject {
    
    var presenter: InteractorToPresenterUmraAudiosProtocol? { get set }
    
    func loadDuolar()
    func retrieveUmraAudioDetail(at index: Int)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterUmraAudiosProtocol: AnyObject {
    
    func fetchDuolarSuccess(duolar: [DuoDM])
    func fetchDuolarFailure(errorCode: Int)

    func getDuolarDetailSuccess(_ duo: DuoDM)
    func getDuolarDetailFailure()

}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterUmraAudiosProtocol: AnyObject {
    
    static func createModule() -> UIViewController
    
    func pushToUmraAudioDetail(on view: PresenterToViewUmraAudiosProtocol, with duo: DuoDM)
    
}
