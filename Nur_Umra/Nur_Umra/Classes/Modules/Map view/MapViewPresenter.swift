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
        print("Presenter ---->>> Uwer wants t open \(self.lat)  and \(self.long)")
        router?.openInAppleMap(withLat: self.lat!, long: self.long!)
    }
    
    func userWantsToOpenInGoogleMap() {
        
    }
    
    func userWantsToOpenInYandexMap() {
        
    }
    
    func userWantsToOpenInYandexNavigator() {
        
    }
    
    
}

extension MapViewPresenter: InteractorToPresenterMapViewProtocol {
    
}
