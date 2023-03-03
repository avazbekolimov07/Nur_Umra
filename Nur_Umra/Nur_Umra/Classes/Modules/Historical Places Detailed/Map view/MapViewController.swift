//
//  MapViewController.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 01/03/23.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController {
    
    var presenter: ViewToPresenterMapViewProtocol?
    var formSheetView: UIView!
    var backgroundView: UIView!
    var stackView: UIStackView!
    var verticalStackViewAppleMaps: UIStackView!
    var verticalStackViewYandexMaps: UIStackView!
    var verticalStackViewGoogleMaps: UIStackView!
    var verticalStackViewYandexNavigator: UIStackView!
    
    var appleMapImg: UIImageView!
    var appleMapLbl: UILabel!
    var appleMapBtn: UIButton!
    
    var googleMapImg: UIImageView!
    var googleMapLbl: UILabel!
    var googleMapBtn: UIButton!
    
    var yandexMapImg: UIImageView!
    var yandexMapLbl: UILabel!
    var yandexMapBtn: UIButton!
    
    var yandexNavigatorImg: UIImageView!
    var yandexNavigatorLbl: UILabel!
    var yandexNavigatorBtn: UIButton!
    var cancelBtn: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        presenter?.viewDidLoad()
    }
    @objc func cancelBtnTapped() {
        self.dismiss(animated: true)
    }

    @objc func appleMapsTapped() {
        print("aple map pressed")
        presenter?.userWantsToOpenInAppleMap()


    }

    @objc func googleMapsTapped() {
        print("google pressed")
//        let appUrl = URL(string:"comgooglemaps://")
//        let apstoreURl = URL(string: "https://apps.apple.com/us/app/google-maps/id585027354")
//        if (UIApplication.shared.canOpenURL( appUrl!)) {
//            UIApplication.shared.openURL(URL(string: "comgooglemaps://?saddr=&daddr=\(self.latTO!),\(self.langTO!)&directionsmode=driving")!)
//
//        } else {
//            UIApplication.shared.open(apstoreURl!)
//        }

    }

    @objc func yandexMapsTapeed() {
        print("yandex map pressed")
//        let appUrl = URL(string: "yandexmaps://build_route_on_map/?lat_from=\(self.latFrom!)&lon_from=\(self.langFrom!)&lat_to=\(self.latTO!)&lon_to=\(self.langTO!)")
//        let apstoreURl = URL(string: "https://apps.apple.com/us/app/yandex-maps-navigator/id313877526")
//        UIApplication.shared.open((appUrl)! , options: [:]) { result in
//            if !result {
//                UIApplication.shared.open(apstoreURl!)
//            }
//        }

    }

    @objc func yandexNAvigatorTapeed() {
        print("yandexNavpressed")
//        let appUrl = URL(string: "yandexnavi://build_route_on_map?lat_to=" + "\(self.latTO!)" + "&lon_to=" + "\(self.langTO!)")
//        let apstoreURl = URL(string: "https://apps.apple.com/us/app/yandex-navi-navigation-maps/id474500851")
//        UIApplication.shared.open((appUrl)! , options: [:]) { result in
//            if !result {
//                var apstoreURl = URL(string: "https://apps.apple.com/us/app/yandex-navi-navigation-maps/id474500851")
//                UIApplication.shared.open(apstoreURl!)
//            }
//        }

    }
    
}

extension MapViewController: PresenterToViewMapViewProtocol {
    func createUIElements() {
        self.backgroundView = self.createBackgroundView()
        self.formSheetView = self.createFormSheetView()
       
        self.appleMapImg = self.createAppleMapsImg()
        self.appleMapLbl = self.createAppleMapsLbl()
        
        self.googleMapImg = self.createGoogleMapsImg()
        self.googleMapLbl = self.createGoogleMapsLbl()
        
        self.yandexMapImg = self.createYandexMapsImg()
        self.yandexMapLbl = self.createYandexMapsLbl()
        
        self.yandexNavigatorImg = self.createNavigatorImg()
        self.yandexNavigatorLbl = self.createYandexNavigatorMapsLbl()
        
        self.verticalStackViewAppleMaps = self.createVerticalViewAppleMap()
        self.verticalStackViewGoogleMaps = self.createVerticalViewGoogleMap()
        self.verticalStackViewYandexMaps = self.createVerticalViewYandexMap()
        self.verticalStackViewYandexNavigator = self.createVerticalViewyandexNavigator()
        self.stackView = self.createStackView()
        
        self.appleMapBtn = self.createAppleMapsBtn()
        self.googleMapBtn = self.createGoogleMapsBtn()
        self.yandexMapBtn = self.createYandexMapsBtn()
        self.yandexNavigatorBtn = self.createYandexNavigatorMapsBtn()
        self.cancelBtn = self.createCancelBtn()
    }
    
 
    
}
