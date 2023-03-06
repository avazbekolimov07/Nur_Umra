//
//  UmraAudiosPresenter.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 25/02/23.
//

import SwiftyJSON
import AVFoundation

class UmraAudiosPresenter: ViewToPresenterUmraAudiosProtocol {
    
    var duolar: [DuoDM]?
    // iPath -> item which is selected before the current indexPath
    var iPath: IndexPath?
    
    // MARK: Properties
    weak var view: PresenterToViewUmraAudiosProtocol?
    var interactor: PresenterToInteractorUmraAudiosProtocol?
    var router: PresenterToRouterUmraAudiosProtocol?
    
    // MARK: Inputs from view
    func viewDidLoad() {
        print("Presenter is being notified that the View was loaded.")
//        view?.showHUD()
        view?.createUIElements()
        interactor?.loadDuolar()
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
    
    func numberOfRowsInSection() -> Int {
        guard let duolar = self.duolar else {
            return 0
        }
        return duolar.count
    }
    
    func eachUmraAudioData(indexPath: IndexPath) -> DuoDM? {
        guard let duolar = self.duolar else {
            return nil
        }
        return duolar[indexPath.row]
    }
    
    func didPlayAndStop(audioUrlSting: String, indexPath: IndexPath, currentPlayer: AVPlayer?) {
        if currentPlayer != nil && iPath == indexPath {
            if currentPlayer?.rate == 1.0 {
                view?.onViewStop(indexPath: indexPath)
            } else {
                view?.onViewPlay(indexPath: indexPath)
            }
        } else {
            if let iPath = iPath, currentPlayer?.rate == 1.0 {
                view?.onViewStop(indexPath: iPath)
            }
            iPath = indexPath
            interactor?.retrieveAudioURL(urlString: audioUrlSting, at: indexPath)
        }
    }
    
    func didSelectRowAt(indexPath: IndexPath) {
        interactor?.retrieveUmraAudioDetail(at: indexPath)
    }
    
    @objc func musicStopBackground(notification: NSNotification){
        print("UmraAudiosPresenter --->>> music stop is working")
        if iPath != IndexPath() {
            view?.onViewStop(indexPath: iPath!)
            view?.onFetchAudioFailure(error: "View enter background", indexPath: iPath!)
        }
    }
    
    func loadNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(musicStopBackground(notification: )),
                                               name: Notification.Name("musicStopBackground"),
                                               object: nil)
    }
    
    func removeNotification() {
        print("Umra Audios View <<<---- remove observer")
        NotificationCenter.default.removeObserver(self,
                                                  name: Notification.Name("musicStopBackground"),
                                                  object: nil)
    }
    
}

extension UmraAudiosPresenter: InteractorToPresenterUmraAudiosProtocol {
    
    func fetchDuolarSuccess(duolar: [DuoDM]) {
        print("Presenter receives the result from Interactor after it's done its job.")
        self.duolar = duolar
        self.iPath = IndexPath()
//        view?.hideHUD()
        view?.onFetchDuolarSuccess()
    }
    
    func fetchDuolarFailure(errorCode: Int) {
        print("Presenter receives the result from Interactor after it's done its job.")
//        view?.hideHUD()
        view?.onFetchDuolarFailure(error: "Couldn't fetch news: \(errorCode)")
    }
    
    func playAudioSuccess(player: AVPlayer, indexPath: IndexPath) {
//        view?.hideHUD()
        view?.onFetchAudioSuccess(player: player, indexPath: indexPath)
    }
    
    func playAudioFailure(errorString: String, indexPath: IndexPath) {
//        view?.hideHUD()
        view?.onFetchAudioFailure(error: "Couldn't fetch audio: \(errorString)", indexPath: indexPath)
    }
    
    func getDuolarDetailSuccess(_ duo: DuoDM) {
//        view?.hideHUD()
        if iPath != IndexPath() {
            view?.onViewStop(indexPath: iPath!)
            view?.onFetchAudioFailure(error: "View shows next page", indexPath: iPath!)
        }
        router?.pushToUmraAudioDetail(on: view!, with: duo)
    }
    
    func getDuolarDetailFailure() {
//        view?.hideHUD()
        print("Couldn't retrieve duo by index")
    }
    
    
}
