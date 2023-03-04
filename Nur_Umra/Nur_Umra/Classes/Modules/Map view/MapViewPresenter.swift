//
//  MapViewPresenter.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 02/03/23.
//

import Foundation

class MapViewPresenter: ViewToPresenterMapViewProtocol {

    

    
    
    
    var view: PresenterToViewMapViewProtocol?
    
    var interactor: PresenterToInteractorMapViewProtocol?
    
    var router: PresenterToRouterMapViewProtocol?
    
    var lat: String?
    
    var long: String?
    
    func viewDidLoad() {
        view?.createUIElements()
    }
   
    func userWantsToOpenInAppleMap() {

        if let latSafe = lat {
            if let longSafe = long {
                router?.openInAppleMap(withLat: latSafe, long: longSafe)
            }
        }
        
    }
    
    func userWantsToOpenInGoogleMap() {
        
        if let latSafe = lat {
            if let longSafe = long {
                router?.openInGoogleMap(withLat: latSafe, long: longSafe)
            }
        }
    }
    
    func userWantsToOpenInYandexMap() {
        if let latSafe = lat {
            if let longSafe = long {
                router?.openInYandexMap(withLat: latSafe, long: longSafe)
            }
        }
    }
    
    func userWantsToOpenInYandexNavigator() {
        if let latSafe = lat {
            if let longSafe = long {
                router?.openInYandexNAvigator(withLat: latSafe, long: longSafe)
            }
        }
    }
    
    
}

extension MapViewPresenter: InteractorToPresenterMapViewProtocol {
    
}
