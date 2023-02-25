//
//  UmraAudiosPresenter.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 25/02/23.
//

import SwiftyJSON

class UmraAudiosPresenter: ViewToPresenterUmraAudiosProtocol {
    
    var duolar: [DuoDM]?
    
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
    
    func viewDidDisappear() {
        view?.handleViewDidDisappear()
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
    
    func didSelectRowAt(indexPath: IndexPath) {
        interactor?.retrieveUmraAudioDetail(at: indexPath.item)
    }
}

extension UmraAudiosPresenter: InteractorToPresenterUmraAudiosProtocol {
    
    func fetchDuolarSuccess(duolar: [DuoDM]) {
        print("Presenter receives the result from Interactor after it's done its job.")
        self.duolar = duolar
//        view?.hideHUD()
        view?.onFetchDuolarSuccess()
    }
    
    func fetchDuolarFailure(errorCode: Int) {
        print("Presenter receives the result from Interactor after it's done its job.")
//        view?.hideHUD()
        view?.onFetchDuolarFailure(error: "Couldn't fetch news: \(errorCode)")
    }
    
    func getDuolarDetailSuccess(_ duo: DuoDM) {
        router?.pushToUmraAudioDetail(on: view!, with: duo)
    }
    
    func getDuolarDetailFailure() {
//        view?.hideHUD()
        print("Couldn't retrieve news by index")
    }
    
    
}
