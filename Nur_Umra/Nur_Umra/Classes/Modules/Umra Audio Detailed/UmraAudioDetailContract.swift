//
//  UmraAudioDetailContract.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 27/02/23.
//

import UIKit
import AVFoundation

// MARK: View Output (Presenter -> View)
protocol PresenterToViewUmraAudioDetailProtocol: AnyObject {
    func onUpdateUIElementsSuccess(with duo: DuoDM)
    func onUpdateUIElementsFailure(error: String?)

    func onFetchAudioSuccess(player: AVPlayer)
    func onFetchAudioFailure(error: String)
    
    func onViewPlay()
    func onViewStop()
//    func showHUD()
//    func hideHUD()

    func  createUIElements()
    func handleViewWillAppear()
    func handleViewWillDisappear()
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterUmraAudioDetailProtocol: AnyObject {
    
    var view: PresenterToViewUmraAudioDetailProtocol? { get set }
    var interactor: PresenterToInteractorUmraAudioDetailProtocol? { get set }
    var router: PresenterToRouterUmraAudioDetailProtocol? { get set }
    
    var duo: DuoDM? { get set }
    
    func viewDidLoad()
    func viewWillAppear()
    func viewWillDisappear()

    func didPlayAndStop(audioUrlSting: String, currentPlayer: AVPlayer?)

}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorUmraAudioDetailProtocol: AnyObject {
    
    var presenter: InteractorToPresenterUmraAudioDetailProtocol? { get set }
    
    var duo: DuoDM? { get set }
    func retrieveUmraAudioDetail()
    func retrieveAudioURL(urlString: String)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterUmraAudioDetailProtocol: AnyObject {

    func getDuoDetailSuccess(_ duo: DuoDM)
    func getDuoDetailFailure(error: String?)
    
    func playAudioSuccess(player: AVPlayer)
    func playAudioFailure(errorString: String)

}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterUmraAudioDetailProtocol: AnyObject {
    
    static func createModule(with duo: DuoDM) -> UIViewController
    
}
