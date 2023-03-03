//
//  MapViewRouter.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 02/03/23.
//

import UIKit

class MapViewRouter: PresenterToRouterMapViewProtocol {

    
    static func createModule(withLat: String, long: String) -> UIViewController {
        let viewController = MapViewController()
        let presenter: InteractorToPresenterMapViewProtocol & ViewToPresenterMapViewProtocol = MapViewPresenter()
        viewController.presenter = presenter
        viewController.presenter?.interactor = MapViewInteractor()
        viewController.presenter?.view = viewController
        viewController.presenter?.router = MapViewRouter()
        viewController.presenter?.interactor?.presenter = presenter
        
        viewController.presenter?.lat = withLat
        viewController.presenter?.long = long
        
        return viewController
        
    }
    
    func openInAppleMap(withLat: String, long: String) {
        print("Router ---->>> Uwer wants t open \(withLat)  and \(long)")
        let appUrl = "http://maps.apple.com/?daddr=\(withLat),\(long)"
                let apstoreURl = URL(string: "https://apps.apple.com/us/app/google-maps/id585027354")
        var installedNavigationApps = [("Apple Maps", URL(string:appUrl)!)]
//        for app in installedNavigationApps {
//                           UIApplication.shared.open(app.1, options: [:], completionHandler: nil)
//
//                   }
        if (UIApplication.shared.canOpenURL( URL(string: appUrl)!)) {
            UIApplication.shared.openURL(URL(string: appUrl)!)

                } else {
                    UIApplication.shared.open(apstoreURl!)
                }
    }
    
    
}
