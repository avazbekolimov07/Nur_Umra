//
//  UmraAudioDetailPresenter.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 27/02/23.
//

import Foundation
import AVFoundation

class UmraAudioDetailPresenter: ViewToPresenterUmraAudioDetailProtocol {
    
    // MARK: Properties
    weak var view: PresenterToViewUmraAudioDetailProtocol?
    var interactor: PresenterToInteractorUmraAudioDetailProtocol?
    var router: PresenterToRouterUmraAudioDetailProtocol?
    
    var duo: DuoDM?
    
    // MARK: Inputs from view
    func viewDidLoad() {
        view?.createUIElements()
        interactor?.retrieveUmraAudioDetail()
        loadNotification()
    }
    
    func viewWillAppear() {
        view?.handleViewWillAppear()
    }
    
    func viewWillDisappear() {
        view?.handleViewWillDisappear()
    }
    
    func viewDeinit() {
        removeNotification()
    }
    
    func userWantsToPopVC() {
        router?.popVC(inView: view!)
    }
    
    func didPlayAndStop(audioUrlSting: String, currentPlayer: AVPlayer?) {
        if currentPlayer != nil {
            if currentPlayer?.rate == 1.0 {
                view?.onViewStop()
            } else {
                view?.onViewPlay()
            }
        } else {
            interactor?.retrieveAudioURL(urlString: audioUrlSting)
        }
    }
    
    @objc func musicStopBackground(notification: NSNotification){
        print("UmraAudioDetailPresenter --->>> music stop is working")
        view?.onViewStop()
    }
    
    func loadNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(musicStopBackground(notification: )),
                                               name: Notification.Name("musicStopBackground"),
                                               object: nil)
    }
    
    func removeNotification() {
        print("Audio Detail View <<<---- remove observer")
        NotificationCenter.default.removeObserver(self,
                                                  name: Notification.Name("musicStopBackground"),
                                                  object: nil)
    }
    
}

// MARK: - Outputs to view
extension UmraAudioDetailPresenter: InteractorToPresenterUmraAudioDetailProtocol {
    
    func getDuoDetailSuccess(_ duo: DuoDM) {
//        view?.hideHUD()
        self.duo = duo
        view?.onUpdateUIElementsSuccess(with: duo)
    }
    
    func getDuoDetailFailure(error: String?) {
//        view?.hideHUD()
        view?.onUpdateUIElementsFailure(error: error)
    }
    
    func playAudioSuccess(player: AVPlayer) {
//        view?.hideHUD()
        view?.onFetchAudioSuccess(player: player)
    }
    
    func playAudioFailure(errorString: String) {
//        view?.hideHUD()
        view?.onFetchAudioFailure(error: "Couldn't fetch audio: \(errorString)")
    }
    
}
