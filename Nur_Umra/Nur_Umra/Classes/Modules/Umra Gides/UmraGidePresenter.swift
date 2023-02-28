//
//  UmraGidePresenter.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 22/02/23
//

import SwiftyJSON

class UmraGidePresenter: ViewToPresenterUmraGideProtocol {
    
    var handbooks: [HandbookDM]?
    
    // MARK: Properties
    weak var view: PresenterToViewUmraGideProtocol?
    var interactor: PresenterToInteractorUmraGideProtocol?
    var router: PresenterToRouterUmraGideProtocol?
    
    // MARK: Inputs from view
    func viewDidLoad() {
        print("Presenter is being notified that the View was loaded.")
//        view?.showHUD()
        view?.createUIElements()
        interactor?.loadHandbooks()
    }
    
    func viewWillAppear() {
        view?.handleViewWillAppear()
    }
    
    func viewWillDisappear() {
        view?.handleViewWillDisappear()
    }
    
    func userWantsToPopVC() {
        router?.popVC(inView: view!)
    }
    
    func numberOfRowsInSection() -> Int {
        guard let handbooks = self.handbooks else {
            return 0
        }
        return handbooks.count
    }
    
    func eachHanbookData(indexPath: IndexPath) -> HandbookDM? {
        guard let handbooks = self.handbooks else {
            return nil
        }
        
        return handbooks[indexPath.row]
    }
    
    func didSelectRowAt(indexPath: IndexPath) {
        if indexPath.section == 1{
            interactor?.retrieveHandbookDetail(at: indexPath.item)
        }
    }
}

extension UmraGidePresenter: InteractorToPresenterUmraGideProtocol {
    
    func fetchHandbooksSuccess(handbooks: [HandbookDM]) {
        print("Presenter receives the result from Interactor after it's done its job.")
        self.handbooks = handbooks
//        view?.hideHUD()
        view?.onFetchHandbooksSuccess()
    }
    
    func fetchHandbooksFailure(errorCode: Int) {
        print("Presenter receives the result from Interactor after it's done its job.")
//        view?.hideHUD()
        view?.onFetchHandbooksFailure(error: "Couldn't fetch news: \(errorCode)")
    }
    
    func getHandbookDetailSuccess(_ handbook: HandbookDM) {
        router?.pushToHandbookDetail(on: view!, with: handbook)
    }
    
    func getHandbookDetailFailure() {
//        view?.hideHUD()
        print("Couldn't retrieve news by index")
    }
    
    
}
