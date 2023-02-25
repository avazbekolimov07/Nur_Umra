//
//  UmraGideInteractor.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 22/02/23
//

import UIKit


class UmraGideInteractor: PresenterToInteractorUmraGideProtocol {

    // MARK: Properties
    weak var presenter: InteractorToPresenterUmraGideProtocol?
    var handbooks: [HandbookDM]?
    
    func loadHandbooks() {
        UmraGideService.shared.getHandbooks(success: { (code, handbooks) in
            self.handbooks = handbooks
            self.presenter?.fetchHandbooksSuccess(handbooks: handbooks)
        }) { (code) in
            self.presenter?.fetchHandbooksFailure(errorCode: code)
        }
    }
    
    func retrieveHandbookDetail(at index: Int) {
        guard let handbooks = self.handbooks, handbooks.indices.contains(index) else {
            self.presenter?.getHandbookDetailFailure()
            return
        }
        self.presenter?.getHandbookDetailSuccess(handbooks[index])
    }
    
}
