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
        let appUrl = "http://maps.apple.com/?daddr=\(withLat),\(long)"
                let apstoreURl = URL(string: "https://apps.apple.com/us/app/google-maps/id585027354")
        var installedNavigationApps = [("Apple Maps", URL(string:appUrl)!)]

        if (UIApplication.shared.canOpenURL( URL(string: appUrl)!)) {
            UIApplication.shared.openURL(URL(string: appUrl)!)

                } else {
                    UIApplication.shared.open(apstoreURl!)
                }
    }
    func openInGoogleMap(withLat: String, long: String) {
                let appUrl = URL(string:"comgooglemaps://")
                let apstoreURl = URL(string: "https://apps.apple.com/us/app/google-maps/id585027354")
                if (UIApplication.shared.canOpenURL( appUrl!)) {
                    UIApplication.shared.openURL(URL(string: "comgooglemaps://?saddr=&daddr=\(withLat),\(long)&directionsmode=driving")!)
        
                } else {
                    UIApplication.shared.open(apstoreURl!)
                }
    }
    
    func openInYandexMap(withLat: String, long: String) {
                let appUrl = URL(string: "yandexmaps://maps.yandex.ru/?pt=\(withLat),\(long)&z=18&l=map")
                let apstoreURl = URL(string: "https://apps.apple.com/us/app/yandex-maps-navigator/id313877526")
                UIApplication.shared.open((appUrl)! , options: [:]) { result in
                    if !result {
                        UIApplication.shared.open(apstoreURl!)
                    }
                }
    }
    func openInYandexNAvigator(withLat: String, long: String) {
                let appUrl = URL(string: "yandexnavi://build_route_on_map?lat_to=" + "\(withLat)" + "&lon_to=" + "\(long)")
                let apstoreURl = URL(string: "https://apps.apple.com/us/app/yandex-navi-navigation-maps/id474500851")
                UIApplication.shared.open((appUrl)! , options: [:]) { result in
                    if !result {
                        var apstoreURl = URL(string: "https://apps.apple.com/us/app/yandex-navi-navigation-maps/id474500851")
                        UIApplication.shared.open(apstoreURl!)
                    }
                }
    }
    
}
