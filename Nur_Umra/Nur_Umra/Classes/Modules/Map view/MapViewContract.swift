//
//  MapViewContract.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 02/03/23.
//

import UIKit

// MARK: View Output (Presenter -> View)
protocol PresenterToViewMapViewProtocol: AnyObject {
    func createUIElements()
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterMapViewProtocol: AnyObject {
    var view: PresenterToViewMapViewProtocol? { get set }
    var interactor: PresenterToInteractorMapViewProtocol? { get set }
    var router: PresenterToRouterMapViewProtocol? { get set }
    var lat: String? { get set }
    var long: String? { get set }
    
    func viewDidLoad()
    func userWantsToOpenInAppleMap()
    func userWantsToOpenInGoogleMap()
    func userWantsToOpenInYandexMap()
    func userWantsToOpenInYandexNavigator()
    
    
}

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorMapViewProtocol: AnyObject {
    var presenter: InteractorToPresenterMapViewProtocol? { get set }
}

// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterMapViewProtocol: AnyObject {
    
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterMapViewProtocol: AnyObject {
    
    static func createModule(withLat: String, long: String) -> UIViewController
    func openInAppleMap(withLat: String, long: String)
    func openInYandexMap(withLat: String, long: String)
    func openInGoogleMap(withLat: String, long: String)
    func openInYandexNAvigator(withLat: String, long: String)

}
