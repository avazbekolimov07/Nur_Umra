//
//  UmraAudiosContact.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 25/02/23.
//

import UIKit
import AVFoundation

// MARK: View Output (Presenter -> View)
protocol PresenterToViewUmraAudiosProtocol: AnyObject {
    func onFetchDuolarSuccess()
    func onFetchDuolarFailure(error: String)

    func onFetchAudioSuccess(player: AVPlayer, indexPath: IndexPath)
    func onFetchAudioFailure(error: String, indexPath: IndexPath)
    
    func onViewPlay(indexPath: IndexPath)
    func onViewStop(indexPath: IndexPath)
//    func showHUD()
//    func hideHUD()

    func  createUIElements()
    func handleViewWillAppear()
    func handleViewWillDisappear()
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterUmraAudiosProtocol: AnyObject {
    
    var view: PresenterToViewUmraAudiosProtocol? { get set }
    var interactor: PresenterToInteractorUmraAudiosProtocol? { get set }
    var router: PresenterToRouterUmraAudiosProtocol? { get set }
    
    var duolar: [DuoDM]? { get set }
    var iPath: IndexPath? { get set }
    var dataFetched: Bool { get set }
    
    func viewDidLoad()
    func viewWillAppear()
    func viewWillDisappear()
    func viewDeinit()

    func numberOfRowsInSection() -> Int
    func eachUmraAudioData(indexPath: IndexPath) -> DuoDM?

    func didPlayAndStop(audioUrlSting: String, indexPath: IndexPath, currentPlayer: AVPlayer?)
    func didSelectRowAt(indexPath: IndexPath)

}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorUmraAudiosProtocol: AnyObject {
    
    var presenter: InteractorToPresenterUmraAudiosProtocol? { get set }
    
    func loadDuolar()
    func retrieveUmraAudioDetail(at indexPath: IndexPath)
    func retrieveAudioURL(urlString: String, at indexPath: IndexPath)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterUmraAudiosProtocol: AnyObject {
    
    func fetchDuolarSuccess(duolar: [DuoDM])
    func fetchDuolarFailure(errorCode: Int)

    func getDuolarDetailSuccess(_ duo: DuoDM)
    func getDuolarDetailFailure()
    
    func playAudioSuccess(player: AVPlayer, indexPath: IndexPath)
    func playAudioFailure(errorString: String, indexPath: IndexPath)

}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterUmraAudiosProtocol: AnyObject {
    
    static func createModule() -> UIViewController
    
    func pushToUmraAudioDetail(on view: PresenterToViewUmraAudiosProtocol, with duo: DuoDM)
    
}
