//
//  MapViewRouter.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 02/03/23.
//

import UIKit
import MapKit
import CoreLocation

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
                let apstoreURl = URL(string: "https://apps.apple.com/us/app/apple-maps/id915056765")
        var installedNavigationApps = [("Apple Maps", URL(string:appUrl)!)]

        if (UIApplication.shared.canOpenURL( URL(string: appUrl)!)) {
            let latitude: CLLocationDegrees = Double(withLat)!
            let longitude: CLLocationDegrees = Double(long)!
            let regionDistance:CLLocationDistance = 100
            let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
            let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
            let options = [
                MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
                MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
            ]
            let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
            let mapItem = MKMapItem(placemark: placemark)
            mapItem.openInMaps(launchOptions: options)

                } else {
                    UIApplication.shared.open(apstoreURl!)
                }
    }
    func openInGoogleMap(withLat: String, long: String) {
                let appUrl = URL(string:"http://www.google.com/maps/place/\(withLat),\(long)")
                let apstoreURl = URL(string: "https://apps.apple.com/us/app/google-maps/id585027354")
                if (UIApplication.shared.canOpenURL( appUrl!)) {
                    UIApplication.shared.openURL(URL(string: "http://www.google.com/maps/place/\(withLat),\(long)")!)
        
                } else {
                    UIApplication.shared.open(apstoreURl!)
                }
    }
    
    func openInYandexMap(withLat: String, long: String) {
        "yandexmaps://maps.yandex.ru/?ll=\(withLat),\(long)&z=12&l=map"
                let appUrl = URL(string: "yandexmaps://maps.yandex.ru/?pt=\(long),\(withLat)&z=18&l=map")
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
