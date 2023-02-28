//
//  UmraAudioDetailInteractor.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 27/02/23.
//

import UIKit
import AVKit

class UmraAudioDetailInteractor: PresenterToInteractorUmraAudioDetailProtocol {
 
    // MARK: Properties
    var presenter: InteractorToPresenterUmraAudioDetailProtocol?
    var duo: DuoDM?
    
    func retrieveUmraAudioDetail() {
        if let safeDetail = duo {
            presenter?.getDuoDetailSuccess(safeDetail)
        } else {
            presenter?.getDuoDetailFailure(error: "Error in retrieving detail")
        }
    }
    
    func retrieveAudioURL(urlString: String) {
        guard let url = URL.init(string: urlString) else {
            presenter?.playAudioFailure(errorString: "error to URL not exist")
            return
        }
        let asset = AVAsset(url: url)
        guard asset.isPlayable else {
            presenter?.playAudioFailure(errorString: "error to invalid URL")
            return
        }
        asset.cancelLoading()
        let playerItem = AVPlayerItem(url: url)
        let player = AVPlayer(playerItem: playerItem)
        presenter?.playAudioSuccess(player: player)
    }
    
}
