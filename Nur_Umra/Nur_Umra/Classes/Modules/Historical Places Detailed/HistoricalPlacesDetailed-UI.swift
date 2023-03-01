//
//  HistoricalPlacesDetailed-UI.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 28/02/23.
//

import UIKit

extension HistoricalPlacesDetailedViewController {
    func createScrollView() -> UIScrollView {
        let window = UIApplication.shared.windows.first
        let topPadding = window!.safeAreaInsets.top
        
        let scroll = UIScrollView()
        scroll.showsHorizontalScrollIndicator = false
        scroll.showsVerticalScrollIndicator = false
        scroll.contentInset.top = -topPadding
        
        self.view.addSubviews(self.baseView)
        self.baseView.addSubviews(scroll)
        
        scroll.snp.makeConstraints { make in
            make.top.equalTo(self.baseView.snp.top)
            make.left.equalTo(self.baseView.snp.left)
            make.right.equalTo(self.baseView.snp.right)
            make.bottom.equalTo(self.baseView.snp.bottom)
        }
        return scroll
        
    }
    
    func createImgView() -> UIImageView {
        let imgView = UIImageView()
        
        self.scrollView.addSubviews(imgView)
        
        imgView.snp.makeConstraints { make in
            make.top.equalTo(self.scrollView.snp.top)
            make.left.equalTo(self.scrollView.snp.left)
            make.right.equalTo(self.scrollView.snp.right)
            make.height.equalTo(self.baseView.frame.height * 0.32)
            make.width.equalTo(self.baseView.snp.width)
        }
        
        return imgView
    }

    
    func createTitleLbl() -> UILabel {
        let titleLbl = UILabel()
        
        titleLbl.font = UIFont(name: "Poppins-SemiBold", size: 18)
        titleLbl.numberOfLines = 0
        titleLbl.textAlignment = .center
        
        self.scrollView.addSubviews(titleLbl)
        
        titleLbl.snp.makeConstraints { make in
            make.top.equalTo(self.imgView.snp.bottom).offset(24)
            make.left.equalTo(self.baseView.snp.left).offset(16)
            make.right.equalTo(self.baseView.snp.right).inset(16)
        }
        
        return titleLbl
    }
    
    func createDescription() -> UILabel {
        let titleLbl = UILabel()
        
        titleLbl.font = UIFont(name: "Poppins-Regular", size: 14)
        titleLbl.numberOfLines = 0
        titleLbl.textAlignment = .left
        
        self.scrollView.addSubviews(titleLbl)
        
        titleLbl.snp.makeConstraints { make in
            make.top.equalTo(self.titleLbl.snp.bottom).offset(16)
            make.left.equalTo(self.baseView.snp.left).offset(16)
            make.right.equalTo(self.baseView.snp.right).inset(16)
        }
        
        return titleLbl
    }
    
    
    func createOpenOnTheMapBtn() -> UIButton {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "map.fill")?.applyingSymbolConfiguration(.init(pointSize: 20)) , for: .normal)
        btn.setTitle("Kartadan ko`rish", for: .normal)
        btn.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 16)
        btn.imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 24)
        btn.backgroundColor = #colorLiteral(red: 0, green: 0.5478978157, blue: 0.478407383, alpha: 1)
        btn.layer.cornerRadius = 8
        
        btn.tintColor = .white
        
        self.scrollView.addSubview(btn)
        btn.addTarget(self, action: #selector(mapBtnPressed), for: .touchUpInside)
        
        btn.snp.makeConstraints { make in
            make.top.equalTo(self.descriptionLbl.snp.bottom).offset(80)
            make.left.equalTo(self.baseView.snp.left).offset(16)
            make.right.equalTo(self.baseView.snp.right).inset(16)
            make.bottom.equalTo(self.scrollView.snp.bottom).inset(80)
            make.height.equalTo(50)
        }
        return btn
    }
    
    func createBackBtn() -> UIButton {
        let btn = UIButton()
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = btn.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.alpha = 0.8
        blurEffectView.isUserInteractionEnabled = false
        
        btn.insertSubview(blurEffectView, at: 0)
        
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 8
        btn.isUserInteractionEnabled = true
        
        btn.setImage(UIImage(systemName: "chevron.left")?.applyingSymbolConfiguration(.init(weight: .semibold) ) , for: .normal)
        btn.tintColor = .white
        btn.bringSubviewToFront(btn.imageView!)
        
        self.view.addSubviews(btn)
        
        btn.snp.makeConstraints { make in
            make.width.height.equalTo(38)
            make.top.equalTo(self.baseView.snp.top).offset(54)
            make.left.equalTo(self.baseView.snp.left).inset(16)
        }
        
        btn.addTarget(self, action: #selector(backBtnTapped), for: .touchUpInside)
        
        return btn
        
    }
    
 
}
