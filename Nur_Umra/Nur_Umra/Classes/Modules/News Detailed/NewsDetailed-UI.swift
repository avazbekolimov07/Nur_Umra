//
//  NewsDetailed-UI.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 24/02/23.
//

import Foundation
import SnapKit

extension NewsDetailedViewController {
    
    func createScrollView() -> UIScrollView {
        let window = UIApplication.shared.windows.first
        let topPadding = window!.safeAreaInsets.top
        
        let scroll = UIScrollView()
        scroll.showsHorizontalScrollIndicator = false
        scroll.showsVerticalScrollIndicator = false
        scroll.contentInset.top = -topPadding
        self.view.addSubviews(scroll)
        
        scroll.snp.makeConstraints { make in
            make.top.equalTo(self.view.snp.top)
            make.left.equalTo(self.view.snp.left)
            make.right.equalTo(self.view.snp.right)
            make.bottom.equalTo(self.view.snp.bottom)
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
            make.height.equalTo(self.view.frame.height * 0.32)
            make.width.equalTo(self.view.snp.width)
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
            make.left.equalTo(self.view.snp.left).offset(16)
            make.right.equalTo(self.view.snp.right).inset(16)
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
            make.left.equalTo(self.view.snp.left).offset(16)
            make.right.equalTo(self.view.snp.right).inset(16)
            make.bottom.equalTo(self.scrollView.snp.bottom).inset(80)
        }
        
        return titleLbl
    }
    
    func createBackBtn() -> UIButton {
        let btn = UIButton()
        btn.addTarget(self, action: #selector(backBtnPressed), for: .touchUpInside)
        
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
        self.view.backgroundColor = .blue
        
        btn.snp.makeConstraints { make in
            make.width.height.equalTo(38)
            make.top.equalTo(self.view.snp.top).offset(54)
            make.left.equalTo(self.view.snp.left).inset(16)
        }
        
        btn.addTarget(self, action: #selector(backBtnTapped), for: .touchUpInside)
        
        return btn
        
    }
    
    func updateUI(newsDetailed: NewsDM) {
        print("🥶 , update ui ----")
            self.imgView.sd_setImage(with: URL(string: newsDetailed.image), placeholderImage: UIImage(named: "umraGide_img"))
        self.titleLbl.text = newsDetailed.title
        self.descriptionLbl.text = newsDetailed.content
        
    }
    
    // NARK: Action with buttons
    @objc func backBtnPressed() {
        print("Bakc.btn pressed -------")
    }
}
