//
//  UmraAudiosInteractor.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 25/02/23.
//

import UIKit
import AVKit

class UmraAudiosInteractor: PresenterToInteractorUmraAudiosProtocol {

    // MARK: Properties
    weak var presenter: InteractorToPresenterUmraAudiosProtocol?
    var duolar: [DuoDM]?
    
    func loadDuolar() {
        print("Interactor receives the request from Presenter to load quotes from the server.")
        UmraAudioService.shared.getDuolar(success: { (code, duolar) in
            self.duolar = duolar
            self.presenter?.fetchDuolarSuccess(duolar: duolar)
        }) { (code) in
            self.presenter?.fetchDuolarFailure(errorCode: code)
        }
    }
    
    func retrieveUmraAudioDetail(at indexPath: IndexPath) {
        let item = indexPath.item
        print("Item:", item)
        guard let duolar = self.duolar, duolar.indices.contains(item) else {
            self.presenter?.getDuolarDetailFailure()
            return
        }
        self.presenter?.getDuolarDetailSuccess(duolar[item])
    }
    
    func retrieveAudioURL(urlString: String, at indexPath: IndexPath) {
        guard let url = URL.init(string: urlString) else {
            presenter?.playAudioFailure(errorString: "error to URL not exist", indexPath: indexPath)
            return
        }
        let asset = AVAsset(url: url)
        guard asset.isPlayable else {
            presenter?.playAudioFailure(errorString: "error to invalid URL", indexPath: indexPath)
            return
        }
        asset.cancelLoading()
        let playerItem = AVPlayerItem(url: url)
        let player = AVPlayer(playerItem: playerItem)
        presenter?.playAudioSuccess(player: player, indexPath: indexPath)
    }
    
    
}
