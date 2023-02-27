//
//  PreparationForUmraIntertactor.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 27/02/23.
//

import Foundation

class PreparationForUmraInteractor: PresenterToInteractorPreparationForUmraProtocol {
    
    var preparationForUmra: PreparationDm?
    
    var presenter: InteractorToPresenterPreparationForUmraProtocol?
    
    func loadPreparationForUmra() {
        PreparationForUmraService.shared.getPreparation { code, preparations in
            self.preparationForUmra = preparations[0]
            self.presenter?.getPreparionForUmraSucces(preparion: self.preparationForUmra!)
            
        } failure: { code in
            self.presenter?.getPreparionForUmraFailure(errorCode: code)
        }

    }
}
