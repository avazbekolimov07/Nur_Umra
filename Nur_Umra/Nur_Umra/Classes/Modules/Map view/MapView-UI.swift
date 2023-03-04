//
//  MapView.swift
//  WhereToEat
//
//  Created by Azizbek Salimov on 02/12/22.
//

import UIKit
import SnapKit

extension MapViewController {
    
    func createBackgroundView() -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        
        self.view.addSubview(view)
        view.frame = self.view.frame
        
        
        return view
    }
    
    func createFormSheetView() -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 24
        view.layer.borderWidth = 1
        view.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        // shadow...
        view.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowRadius = 8
        view.layer.shadowOffset = CGSize(width: 0, height: -2)
        
        self.view.addSubview(view)
        view.snp.makeConstraints { make in
            make.left.equalTo(self.backgroundView.snp.left)
            make.right.equalTo(self.backgroundView.snp.right)
            make.bottom.equalTo(self.backgroundView.snp.bottom).offset(20)
            make.height.equalTo(300)
        }
        
        return view
    }
    
    func createAppleMapsImg() -> UIImageView {
        let img = UIImageView()
        
        img.image = UIImage(named: "appleMaps")
        img.contentMode = .scaleAspectFit
        img.snp.makeConstraints { make in
            make.width.height.equalTo(self.view.frame.width / 6)
        }
        return img
    }
    
    func createGoogleMapsImg() -> UIImageView {
        let img = UIImageView()
        img.image = UIImage(named: "googleMaps")
        img.contentMode = .scaleAspectFill
        img.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        img.layer.borderWidth = 0.5
        img.layer.cornerRadius = 12
        img.snp.makeConstraints { make in
            make.width.height.equalTo(self.view.frame.width / 6)
        }

        return img
    }
    
    func createYandexMapsImg() -> UIImageView {
        let img = UIImageView()
        img.image = UIImage(named: "yandexMap")
        img.contentMode = .scaleAspectFill
        img.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        img.layer.borderWidth = 0.5
        img.layer.cornerRadius = 12
        img.snp.makeConstraints { make in
            make.width.height.equalTo(self.view.frame.width / 6)
        }
        return img
    }
    
    func createNavigatorImg() -> UIImageView {
        let img = UIImageView()
        img.image = UIImage(named: "yandexNavigator")
        img.contentMode = .scaleAspectFit
        img.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        img.layer.borderWidth = 0.5
        img.layer.cornerRadius = 12
        img.snp.makeConstraints { make in
            make.width.height.equalTo(self.view.frame.width / 6)
        }
        return img
    }
    
    func createAppleMapsLbl() -> UILabel {
        let lbl = UILabel()
        lbl.text = "Apple Maps"
        lbl.font = .poppins_Regular(size: 12)
        return lbl
    }
    func createGoogleMapsLbl() -> UILabel {
        let lbl = UILabel()
        lbl.text = "Google Maps"
        lbl.font = .poppins_Regular(size: 12)
        return lbl
    }
    func createYandexMapsLbl() -> UILabel {
        let lbl = UILabel()
        lbl.text = "Yandex Maps"
        lbl.font = .poppins_Regular(size: 12)
        return lbl
    }
    func createYandexNavigatorMapsLbl() -> UILabel {
        let lbl = UILabel()
        lbl.text = "Navigator"
        lbl.font = .poppins_Regular(size: 12)
        return lbl
    }
    
    func createVerticalViewAppleMap() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 2
        
        stack.addArrangedSubview(self.appleMapImg)
        stack.addArrangedSubview(self.appleMapLbl)
        return stack
    }

    
    func createVerticalViewYandexMap() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 2
        
        stack.addArrangedSubview(self.yandexMapImg)
        stack.addArrangedSubview(self.yandexMapLbl)
        return stack
    }
    
    func createVerticalViewGoogleMap() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 2
        
        stack.addArrangedSubview(self.googleMapImg)
        stack.addArrangedSubview(self.googleMapLbl)
        return stack
    }
    
    func createVerticalViewyandexNavigator() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 2
        stack.addArrangedSubview(self.yandexNavigatorImg)
        stack.addArrangedSubview(self.yandexNavigatorLbl)

        return stack
    }
    
    func createStackView() -> UIStackView {
        let stack = UIStackView()
        stack.distribution = .equalSpacing
        stack.alignment = .top
        stack.axis = .horizontal
        stack.spacing = 16
        
        stack.addArrangedSubview(self.verticalStackViewAppleMaps)
        stack.addArrangedSubview(self.verticalStackViewGoogleMaps)
        stack.addArrangedSubview(self.verticalStackViewYandexMaps)
        stack.addArrangedSubview(self.verticalStackViewYandexNavigator)
        
        self.view.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.left.equalTo(self.formSheetView.snp.left).offset(16)
            make.right.equalTo(self.formSheetView.snp.right).inset(16)
            make.top.equalTo(self.formSheetView.snp.top).offset(42)
//            make.height.equalTo(120)
//            make.height.equalTo(self.formSheetView.snp.height).inset(0)
//            make.centerY.equalTo(self.formSheetView.snp.centerY)
        }
        return stack
    }
    
    func createAppleMapsBtn() -> UIButton {
        let btn = UIButton()
        self.view.addSubview(btn)
        btn.backgroundColor = .clear
        btn.addTarget(self, action: #selector(appleMapsTapped), for: .touchUpInside)
        btn.snp.makeConstraints { make in
            make.edges.equalTo(verticalStackViewAppleMaps.snp.edges).offset(4)
            make.center.equalTo(verticalStackViewAppleMaps.snp.center)
        }
        return btn
    }
    
    func createGoogleMapsBtn() -> UIButton {
        let btn = UIButton()
        self.view.addSubview(btn)
        btn.backgroundColor = .clear
        btn.addTarget(self, action: #selector(googleMapsTapped), for: .touchUpInside)
        btn.snp.makeConstraints { make in
            make.edges.equalTo(verticalStackViewGoogleMaps.snp.edges).offset(4)
            make.center.equalTo(verticalStackViewGoogleMaps.snp.center)
        }
        return btn
    }
    
    func createYandexMapsBtn() -> UIButton {
        let btn = UIButton()
        self.view.addSubview(btn)
        btn.backgroundColor = .clear
        btn.addTarget(self, action: #selector(yandexMapsTapeed), for: .touchUpInside)
        btn.snp.makeConstraints { make in
            make.edges.equalTo(verticalStackViewYandexMaps.snp.edges).offset(4)
            make.center.equalTo(verticalStackViewYandexMaps.snp.center)
        }
        return btn
    }
    
    func createYandexNavigatorMapsBtn() -> UIButton {
        let btn = UIButton()
        self.view.addSubview(btn)
        btn.backgroundColor = .clear
        btn.addTarget(self, action: #selector(yandexNAvigatorTapeed), for: .touchUpInside)
        btn.snp.makeConstraints { make in
            make.edges.equalTo(verticalStackViewYandexNavigator.snp.edges).offset(4)
            make.center.equalTo(verticalStackViewYandexNavigator.snp.center)
        }
        return btn
    }
    
    func createCancelBtn() -> UIButton {
        let btn = UIButton()
        self.view.addSubview(btn)
        btn.backgroundColor = .clear
        btn.addTarget(self, action: #selector(cancelBtnTapped), for: .touchUpInside)
        
        btn.snp.makeConstraints { make in
            make.top.equalTo(backgroundView.snp.top)
            make.left.equalTo(backgroundView.snp.left)
            make.right.equalTo(backgroundView.snp.right)
            make.bottom.equalTo(formSheetView.snp.top)
        }
        
        return btn
    }
    
    
    
    
    
}
