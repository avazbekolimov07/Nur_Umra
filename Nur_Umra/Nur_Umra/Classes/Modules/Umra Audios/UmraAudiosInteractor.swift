//
//  UmraAudiosInteractor.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 25/02/23.
//

import UIKit

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
    
    func retrieveUmraAudioDetail(at index: Int) {
        guard let duolar = self.duolar, duolar.indices.contains(index) else {
            self.presenter?.getDuolarDetailFailure()
            return
        }
        self.presenter?.getDuolarDetailSuccess(duolar[index])
    }
    
    
}
