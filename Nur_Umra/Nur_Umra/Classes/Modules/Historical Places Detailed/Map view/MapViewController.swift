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
    
    let baseView = MapView()
    var latFrom: Double?
    var langFrom: Double?
    var latTO: Double?
    var langTO: Double?
    var destinationName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        someAnimation()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        callBaseView()
        setupBaseViewTargets()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        callBaseView()
        setupBaseViewTargets()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scroll", scrollView.contentOffset.y)
    }
    
    private func callBaseView() {
        self.baseView.frame = view.bounds
        view.addSubview(baseView)
        
    }
    
    private func someAnimation() {
        UIView.animate(withDuration: 0.1, delay: 0) {
            self.view.transform = CGAffineTransform(translationX: 0, y: 20)
        } completion: { _ in
            self.view.transform = .identity
        }
    }
    
    private func setupBaseViewTargets() {
        self.baseView.appleMapsAddTarget(target: self, action: #selector(appleMapsTapped))
        self.baseView.googleMapsAddTarget(target: self, action: #selector(googleMapsTapped))
        self.baseView.yandexMapsAddTarget(target: self, action: #selector(yandexMapsTapeed))
        self.baseView.yandexNAvigatorAddTarget(target: self, action: #selector(yandexNAvigatorTapeed))
        self.baseView.cancelBtnAddTarget(target: self, action: #selector(cancelBtnTapped))
    }
    @objc func cancelBtnTapped() {
        self.dismiss(animated: true)
    }
    
    @objc func appleMapsTapped() {
        if let latFrom = self.latFrom {
            if let langFrom = self.langFrom{
                if let latTO = self.latTO{
                    if let langTO = self.langTO{
                        let source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: latFrom, longitude: langFrom)))
                        source.name = "Me"
                        
                        let destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: latTO, longitude: langTO)))
                        destination.name = destinationName
                        MKMapItem.openMaps(
                            with: [source, destination],
                            launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
                        )
                    }
                }
            }
        }
        
    }
    
    @objc func googleMapsTapped() {
        let appUrl = URL(string:"comgooglemaps://")
        let apstoreURl = URL(string: "https://apps.apple.com/us/app/google-maps/id585027354")
        if (UIApplication.shared.canOpenURL( appUrl!)) {
            UIApplication.shared.openURL(URL(string: "comgooglemaps://?saddr=&daddr=\(self.latTO!),\(self.langTO!)&directionsmode=driving")!)
            
        } else {
            UIApplication.shared.open(apstoreURl!)
        }
        
    }
    
    @objc func yandexMapsTapeed() {
        let appUrl = URL(string: "yandexmaps://build_route_on_map/?lat_from=\(self.latFrom!)&lon_from=\(self.langFrom!)&lat_to=\(self.latTO!)&lon_to=\(self.langTO!)")
        let apstoreURl = URL(string: "https://apps.apple.com/us/app/yandex-maps-navigator/id313877526")
        UIApplication.shared.open((appUrl)! , options: [:]) { result in
            if !result {
                UIApplication.shared.open(apstoreURl!)
            }
        }
        
    }
    
    @objc func yandexNAvigatorTapeed() {
        let appUrl = URL(string: "yandexnavi://build_route_on_map?lat_to=" + "\(self.latTO!)" + "&lon_to=" + "\(self.langTO!)")
        let apstoreURl = URL(string: "https://apps.apple.com/us/app/yandex-navi-navigation-maps/id474500851")
        UIApplication.shared.open((appUrl)! , options: [:]) { result in
            if !result {
                var apstoreURl = URL(string: "https://apps.apple.com/us/app/yandex-navi-navigation-maps/id474500851")
                UIApplication.shared.open(apstoreURl!)
            }
        }
        
    }
    
}
