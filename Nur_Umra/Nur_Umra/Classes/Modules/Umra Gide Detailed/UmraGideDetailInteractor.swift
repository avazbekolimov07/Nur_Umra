//
//  UmraGideDetailInteractor.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 27/02/23.
//

import Foundation

class UmraGideDetailInteractor: PresenterToInteractorUmraGideDetailProtocol {
 
    // MARK: Properties
    var presenter: InteractorToPresenterUmraGideDetailProtocol?
    var handbook: HandbookDM?
    
    func retrieveHandbookDetailed() {
        if let safeDetail = handbook {
            presenter?.getHandbookDetailedSuccess(handbook: safeDetail)
        } else {
            presenter?.getHandbookDetailedFailure()
        }
    }
    
}
