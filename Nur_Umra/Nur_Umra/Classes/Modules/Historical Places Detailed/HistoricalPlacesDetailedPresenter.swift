//
//  HistoricalPlacesDetailedPresenter.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 28/02/23.
//

import Foundation


class HistoricalPlacesDetailedPresenter: ViewToPresenterHistoricalPlacesDetailedProtocol {
    
    
    
    weak var view: PresenterToViewHistoricalPlacesDetailedProtocol?
    
    var router: PresenterToRouterHistoricalPlacesDetailedProtocol?
    
    var interactor: PresenterToInteractorHistoricalPlacesDetailedProtocol?
    
    var historicalPlace: HistoricalPlacesDM?
    
    var lat: String?
    
    var long: String?
    
    
    func viewDidLoad() {
        view?.createUIElements()
        interactor?.retrieveSpecificPlace()
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
    
    func userWantsToOpenOntheMap() {
        print("presenter is Workingggg")
        router?.showMaps(inView: view!, withLat: self.lat!, long: self.long!)
    }
    
    
}

extension HistoricalPlacesDetailedPresenter: InteractorToPresenterHistoricalPlacesDetailedProtocol {
    func retrieveSpecificPlaceSuccess(place: HistoricalPlacesDM) {
        self.historicalPlace = place
        self.lat = place.latitude
        self.long = place.longitude
        view?.onFetchSuccess(place: place)
    }
    
    func retrieveSpecificPlaceFailure() {
        view?.onFetchFailure()
    }
    
    
}
