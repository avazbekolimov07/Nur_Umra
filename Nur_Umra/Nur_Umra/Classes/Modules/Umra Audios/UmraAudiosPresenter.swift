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
    }
    
    func viewWillAppear() {
        view?.handleViewWillAppear()
    }
    
    func viewWillDisappear() {
        view?.handleViewWillDisappear()
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
            view?.onFetchAudioFailure(error: "Next Page Shown", indexPath: iPath!)
        }
        router?.pushToUmraAudioDetail(on: view!, with: duo)
    }
    
    func getDuolarDetailFailure() {
//        view?.hideHUD()
        print("Couldn't retrieve duo by index")
    }
    
    
}
