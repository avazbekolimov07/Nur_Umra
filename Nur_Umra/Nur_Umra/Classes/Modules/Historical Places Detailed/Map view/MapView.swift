//
//  MapView.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 01/03/23.
//

import UIKit


class MapView: UIView {
    
    let baseView: UIView = {
        let myView = UIView()
        myView.backgroundColor = .clear
        return myView
    }()
    
    let topContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        return view
    }()
    
    let cancelBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .clear
        return btn
    }()
    
    let openWithLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = NSLocalizedString("openWIth", comment: "")
        return lbl
    }()
    
    let appleMapImg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "appleMaps")
        img.backgroundColor = .clear
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    let appleMapLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Maps"
        lbl.font = UIFont(name: "Inter-Regular", size: 10)
        lbl.numberOfLines = 1
        lbl.textColor = .black
        return lbl
    }()
    
    let appleMapsBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .clear
        
        return btn
    }()
    
    let googleMapImg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "googleMps")
        img.layer.borderWidth = 0
        img.contentMode = .scaleAspectFit
        img.layer.cornerRadius = 12
        
        img.backgroundColor = .clear
        
        
        return img
    }()
    
    let googleMapLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Google Maps"
        lbl.font = UIFont(name: "Inter-Regular", size: 10)
        lbl.numberOfLines = 1
        lbl.textColor = .black
        return lbl
    }()
    
    let googleMapsBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .clear
        
        return btn
    }()
    
    let yandexMapImg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "yandexMap")
        img.contentMode = .scaleAspectFit
        img.layer.borderWidth = 1
        img.layer.borderColor = #colorLiteral(red: 0.8941176471, green: 0.8941176471, blue: 0.8941176471, alpha: 1)
        img.contentMode = .scaleAspectFill
        img.backgroundColor = .clear
        
        
        return img
    }()
    
    let yandexMapLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Yandex Maps"
        lbl.font = UIFont(name: "Inter-Regular", size: 10)
        lbl.numberOfLines = 1
        lbl.textColor = .black
        return lbl
    }()
    
    let yandexMapsBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .clear
        
        return btn
    }()
    
    let yandexNavigatorImg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "yandexNavigator")
        img.layer.borderWidth = 1
        img.layer.borderColor = #colorLiteral(red: 0.8941176471, green: 0.8941176471, blue: 0.8941176471, alpha: 1)
        img.contentMode = .scaleAspectFill
        img.backgroundColor = .clear
        
        
        return img
    }()
    
    let yandexNavigatorLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Navi"
        lbl.font = UIFont(name: "Inter-Regular", size: 10)
        lbl.numberOfLines = 1
        lbl.textColor = .black
        return lbl
    }()
    
    let yandexNavigatorBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .clear
        
        return btn
    }()
    
    
    
    var stackViewOFAppleMaps: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .systemPink
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 12
        return stack
    }()
    var stackViewOFgoogleMap: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 12
        return stack
    }()
    var stackViewOFyandexMap: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 12
        return stack
    }()
    var stackViewOFyandexNavigator: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 12
        return stack
    }()
    
    var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.backgroundColor = .systemTeal
        return stack
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addViews()
        addConstraints()
    }
    
    private func addViews() {
        addSubview(baseView)
        baseView.addSubview(topContainer)
        baseView.addSubview(cancelBtn)
        topContainer.addSubview(stackView)
        stackView.addArrangedSubviews( stackViewOFAppleMaps, stackViewOFyandexMap, stackViewOFgoogleMap, stackViewOFyandexNavigator)
        
        
//        stackViewOFAppleMaps.addArrangedSubview(appleMapImg, appleMapLbl, appleMapsBtn)

        
        
        stackViewOFgoogleMap.addSubview(googleMapImg)
        stackViewOFgoogleMap.addSubview(googleMapLbl)
        stackViewOFgoogleMap.addSubview(googleMapsBtn)
        
        
        stackViewOFyandexMap.addSubview(yandexMapImg)
        stackViewOFyandexMap.addSubview(yandexMapLbl)
        stackViewOFyandexMap.addSubview(yandexMapsBtn)
        
        
        stackViewOFyandexNavigator.addSubview(yandexNavigatorImg)
        stackViewOFyandexNavigator.addSubview(yandexNavigatorLbl)
        stackViewOFyandexNavigator.addSubview(yandexNavigatorBtn)
    }
    
    private func addConstraints() {
        baseView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        topContainer.snp.makeConstraints { make in
            make.left.equalTo(baseView.snp.left).offset(16)
            make.right.equalTo(baseView.snp.right).inset(16)
            make.bottom.equalTo(baseView.snp.bottom).offset(-35)
            make.height.equalTo(200)
            
        }
        
        cancelBtn.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(topContainer.snp.top)
        }
        
        stackView.snp.makeConstraints { make in
            make.centerY.equalTo(topContainer.snp.centerY)
            make.left.equalTo(topContainer.snp.left).offset(16)
            make.right.equalTo(topContainer.snp.right).inset(16)
            make.height.equalTo(100)
        }
        
        appleMapImg.snp.makeConstraints { make in
            make.height.width.equalTo((topContainer.frame.width - 100) / 6 )
//            make.left.equalTo(topContainer.snp.left).offset(20)
//            make.centerY.equalTo(topContainer.snp.centerY)
        }

        appleMapLbl.snp.makeConstraints { make in
            make.top.equalTo(appleMapImg.snp.bottom).offset(2)
            make.centerX.equalTo(appleMapImg.snp.centerX)
        }

        appleMapsBtn.snp.makeConstraints { make in
            make.width.equalTo(appleMapImg.snp.width).offset(6)
            make.height.equalTo(appleMapImg.snp.width).offset(6)
            make.center.equalTo(appleMapImg.snp.center)

        }

        googleMapImg.snp.makeConstraints { make in
            make.height.width.equalTo((topContainer.frame.width - 100) / 6)
//            make.left.equalTo(appleMapImg.snp.right).offset(20)
//            make.centerY.equalTo(topContainer.snp.centerY)
            googleMapImg.layer.cornerRadius = 12
            googleMapImg.clipsToBounds = true

        }
//
//        googleMapLbl.snp.makeConstraints { make in
//            make.centerY.equalTo(appleMapLbl.snp.centerY)
//            make.centerX.equalTo(googleMapImg.snp.centerX)
//        }
//
//        googleMapsBtn.snp.makeConstraints { make in
//            make.center.equalTo(googleMapImg.snp.center)
//            make.width.equalTo(appleMapImg.snp.width).offset(6)
//            make.height.equalTo(appleMapImg.snp.width).offset(6)
//        }
//
//        yandexMapImg.snp.makeConstraints { make in
//            make.height.width.equalTo((topContainer.frame.width - 100) / 6 )
//            make.right.equalTo(topContainer.snp.right).offset(-20)
//            make.centerY.equalTo(topContainer.snp.centerY)
//            yandexMapImg.layer.cornerRadius = 12
//            yandexMapImg.clipsToBounds = true
//
//        }
//
//        yandexMapLbl.snp.makeConstraints { make in
//            make.centerY.equalTo(appleMapLbl.snp.centerY)
//            make.centerX.equalTo(yandexMapImg.snp.centerX)
//        }
//
//        yandexMapsBtn.snp.makeConstraints { make in
//            make.center.equalTo(yandexMapImg.snp.center)
//            make.width.equalTo(appleMapImg.snp.width).offset(6)
//            make.height.equalTo(appleMapImg.snp.width).offset(6)
//        }
//
//        yandexNavigatorImg.snp.makeConstraints { make in
//            make.height.width.equalTo((topContainer.frame.width - 100) / 6 )
//            make.right.equalTo(yandexMapImg.snp.left).offset(-20)
//            make.centerY.equalTo(topContainer.snp.centerY)
//            yandexNavigatorImg.layer.cornerRadius = 12
//            yandexNavigatorImg.clipsToBounds = true
//
//        }
//
//        yandexNavigatorLbl.snp.makeConstraints { make in
//            make.centerY.equalTo(appleMapLbl.snp.centerY)
//            make.centerX.equalTo(yandexNavigatorImg.snp.centerX)
//        }
//
//        yandexNavigatorBtn.snp.makeConstraints { make in
//            make.center.equalTo(yandexNavigatorImg.snp.center)
//            make.width.equalTo(appleMapImg.snp.width).offset(6)
//            make.height.equalTo(appleMapImg.snp.width).offset(6)
//        }
        
        
        
        
    }
    
    func appleMapsAddTarget(target: Any, action: Selector) {
        appleMapsBtn.addTarget(target, action: action, for: .touchUpInside)
    }
    func googleMapsAddTarget(target: Any, action: Selector) {
        googleMapsBtn.addTarget(target, action: action, for: .touchUpInside)
    }
    func yandexMapsAddTarget(target: Any, action: Selector) {
        yandexMapsBtn.addTarget(target, action: action, for: .touchUpInside)
    }
    func yandexNAvigatorAddTarget(target: Any, action: Selector) {
        yandexNavigatorBtn.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func cancelBtnAddTarget(target: Any, action: Selector) {
        cancelBtn.addTarget(target, action: action, for: .touchUpInside)
    }
}
