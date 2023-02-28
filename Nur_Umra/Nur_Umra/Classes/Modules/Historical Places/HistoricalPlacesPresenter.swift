//
//  HistoricalPlacesPresenter.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 27/02/23.
//

import Foundation

class HistoricalPlacesPresenter: ViewToPresenterHistoricalPlacesProtocol {
   
    var view: PresenterToViewHistoricalPlacesProtocol?
    
    var router: PresenterToRouterHistoricalPlacesProtocol?
    
    var interactor: PresenterToInteractorHistoricalPlacesProtocol?
    
    var historicalPlaces: [HistoricalPlacesDM]?
    
    func viewDidLoad() {
        print("Presenter - view did load")
        view?.createUIElements()
        interactor?.loadHistoricalPlaces()
    }
    
    func refresh() {
        
    }
    
    func didSelectRawAt(indexPath: IndexPath) {
        
    }
    
    func eachPlacesData(indexPath: IndexPath) -> HistoricalPlacesDM? {
        guard let safePleace = self.historicalPlaces?[indexPath.row]
        else {
            return nil
        }
        return safePleace
    }
    func numberOfRowsInSection() -> Int {
        guard let safePlacesCount = historicalPlaces?.count
        else {
            return 0
        }
        return safePlacesCount
    }
    
    
}

extension HistoricalPlacesPresenter: InteractorToPresenterHistoricalPlacesProtocol {
    
    func getHistoricalPlacesSuccess(historicalPlaces: [HistoricalPlacesDM]) {
        self.historicalPlaces = historicalPlaces
        view?.onFetchSuccess()
    }
    
    func getHistoricalPlacesFailure(errorCode: Int) {
        view?.onFetchFailure(errorCode: errorCode)
        print("Presenter -> erorrCode -\(errorCode) , Failure -  Cannot get all historical place")
    }
    
    func getSpecificHistroicalPlaceSucces(specificPlace place: HistoricalPlacesDM) {
        router?.pushTohistoricalPlacesDetailed(with: place)
    }
    
    func getSpecificHistroicalPlaceFailure() {
        print("Presenter -> Failure -  Cannot get specific place")
    }
    
 
    
    
}
