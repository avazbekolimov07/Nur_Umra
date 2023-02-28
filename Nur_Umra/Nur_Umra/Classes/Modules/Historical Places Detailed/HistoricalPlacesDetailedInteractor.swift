//
//  HistoricalPlacesDetailedInteractor.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 28/02/23.
//

import Foundation

class HistoricalPlacesDetailedInteractor : PresenterToInteractorHistoricalPlacesDetailedProtocol {
    
    var presenter: InteractorToPresenterHistoricalPlacesDetailedProtocol?
    
    var historicalPlace: HistoricalPlacesDM?
    
    func retrieveSpecificPlace() {
        if let safePlace = historicalPlace {
            presenter?.retrieveSpecificPlaceSuccess(place: safePlace)
        } else {
            presenter?.retrieveSpecificPlaceFailure()
        }
    }
    
    
}
