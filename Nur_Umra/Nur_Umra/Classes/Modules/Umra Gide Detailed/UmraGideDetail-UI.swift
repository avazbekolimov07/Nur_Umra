//
//  UmraGideDetail-UI.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 27/02/23.
//

import Foundation
import SnapKit

extension UmraGideDetailViewController {
    
    func createScrollView() -> UIScrollView {
        let window = UIApplication.shared.windows.first
        let bottomPadding = window!.safeAreaInsets.bottom
        
        let scroll = UIScrollView()
        scroll.delegate = self
        scroll.showsHorizontalScrollIndicator = false
        scroll.showsVerticalScrollIndicator = false
        scroll.contentInset.bottom = bottomPadding
        self.view.addSubviews(scroll)
        
        scroll.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(self.view.snp.left)
            make.right.equalTo(self.view.snp.right)
            make.bottom.equalTo(self.view.snp.bottom)
        }
        return scroll
        
    }
    
    func createDescription() -> UILabel {
        let titleLbl = UILabel()
        
        titleLbl.font = UIFont(name: "Poppins-Regular", size: 14)
        titleLbl.numberOfLines = 0
        titleLbl.textAlignment = .left
        
        self.scrollView.addSubviews(titleLbl)
        
        titleLbl.snp.makeConstraints { make in
            make.top.equalTo(self.scrollView.snp.top).offset(16)
            make.left.equalTo(self.view.snp.left).offset(16)
            make.right.equalTo(self.view.snp.right).inset(16)
            make.bottom.equalTo(self.scrollView.snp.bottom)
        }
        
        return titleLbl
    }
    
    
}
