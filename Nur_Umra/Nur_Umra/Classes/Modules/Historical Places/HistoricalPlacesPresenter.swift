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
    var dataFetched: Bool = false
    
    func viewDidLoad() {
        print("Presenter - view did load")
        view?.createUIElements()
        interactor?.loadHistoricalPlaces()
    }
    
    func viewWillAppear() {
           view?.handleViewWillAppear()
    }
       
    func viewWillDisappear() {
           view?.handleViewWillDisappear()
    }
    
    func refresh() {
        interactor?.loadHistoricalPlaces()
    }
    
    func didSelectRawAt(indexPath: IndexPath) {
        guard let safePlace = historicalPlaces?[indexPath.row]
        else {
            print("error in selecting specific place")
            return
        }
        router?.pushTohistoricalPlacesDetailed(on: view!, with: safePlace)
    }
    
    func eachPlacesData(indexPath: IndexPath) -> HistoricalPlacesDM? {
        guard let safePleace = self.historicalPlaces?[indexPath.row]
        else {
            return nil
        }
        return safePleace
    }
    
    func numberOfRowsInSection() -> Int {
        guard let safePlaces = historicalPlaces
        else {
            return dataFetched ? 0 : 4
        }
        return safePlaces.count
    }
    
    
}

extension HistoricalPlacesPresenter: InteractorToPresenterHistoricalPlacesProtocol {
    
    func getHistoricalPlacesSuccess(historicalPlaces: [HistoricalPlacesDM]) {
        self.historicalPlaces = historicalPlaces
        dataFetched = true
        view?.onFetchSuccess()
    }
    
    func getHistoricalPlacesFailure(errorCode: Int) {
        dataFetched = true
        view?.onFetchFailure(errorCode: errorCode)
        print("Presenter -> erorrCode -\(errorCode) , Failure -  Cannot get all historical place")
    }
    
    func getSpecificHistroicalPlaceSucces(specificPlace place: HistoricalPlacesDM) {
        router?.pushTohistoricalPlacesDetailed(on: view!, with: place)
    }
    
    func getSpecificHistroicalPlaceFailure() {
        print("Presenter -> Failure -  Cannot get specific place")
    }
    
 
    
    
}
