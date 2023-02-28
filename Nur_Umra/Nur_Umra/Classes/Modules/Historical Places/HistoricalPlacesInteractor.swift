//
//  HistoricalPlacesInteractor.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 27/02/23.
//

import Foundation

class HistoricalPlacesInteractor: PresenterToInteractorHistoricalPlacesProtocol {
   
    
    var presenter: InteractorToPresenterHistoricalPlacesProtocol?
    
    var historicalPlaces: [HistoricalPlacesDM]?
    
    func loadHistoricalPlaces() {
        HistoricalPlacesService.shared.getHistoricalPlaces { code , places in
            self.presenter?.getHistoricalPlacesSuccess(historicalPlaces: places)
        } failure: { code in
            print("Interactor -> failure in loading historical places")
            self.presenter?.getHistoricalPlacesFailure(errorCode: code)
        }

    }
    
    func retrieveHistoricalPlaces() {
        
    }
    
    func retrieveSpecificHistoricalPlace(with indexPath: IndexPath) {
        if let specificPlace = historicalPlaces?[indexPath.row] {
            presenter?.getSpecificHistroicalPlaceSucces(specificPlace: specificPlace)
        } else {
            presenter?.getSpecificHistroicalPlaceFailure()
        }
    }
   
    
    

    
    
}
