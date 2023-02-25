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
        imgView.image = UIImage(named: "umraGide_img")
        
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
        titleLbl.text = "Safarni boshlashda o’qiladigan duo"
        
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
        titleLbl.text = """
             Safarga ot kishi uyidan chikayotgan dushmani kuyidagi duoni o'qsa, shayton hamlasidan omonda bo'lib, har qanday mushkuli oson bo'ldi, in shaa Alloh.
             Oqilishi: "Bismi-l-laahi tavakkaltu ala-l-lohi, laa havla va laa kuchata illaa bi-l-laah" (Termiziy rivoyati).
             Manosi: Allohinning nomi bilan (safarni boshlayman), Alloqa tavakkal qildim. Toat turib va ​​gunodan saklanishga tokat yolgiz Alloh taolo berilgandir.
             Okilishi: "Allohumma, bika asuulu va bika ahuulu va bika asiyru" (Imom Ahmad rivoyati).
             Manosi: Salom! Sening madading ila hafsala va himmat qilib etib borishni kuzlayman, Sening madading ila gunohdan tiyilaman, Sening madading ila safarga chikaman.
                     Safarga ot kishi uyidan chikayotgan dushmani kuyidagi duoni o'qsa, shayton hamlasidan omonda bo'lib, har qanday mushkuli oson bo'ldi, in shaa Alloh.
                     Oqilishi: "Bismi-l-laahi tavakkaltu ala-l-lohi, laa havla va laa kuchata illaa bi-l-laah" (Termiziy rivoyati).
                     Manosi: Allohinning nomi bilan (safarni boshlayman), Alloqa tavakkal qildim. Toat turib va ​​gunodan saklanishga tokat yolgiz Alloh taolo berilgandir.
                     Okilishi: "Allohumma, bika asuulu va bika ahuulu va bika asiyru" (Imom Ahmad rivoyati).
                     Manosi: Salom! Sening madading ila hafsala va himmat qilib etib borishni kuzlayman, Sening madading ila gunohdan tiyilaman, Sening madading ila safarga chikaman.
                     Safarga ot kishi uyidan chikayotgan dushmani kuyidagi duoni o'qsa, shayton hamlasidan omonda bo'lib, har qanday mushkuli oson bo'ldi, in shaa Alloh.
                     Oqilishi: "Bismi-l-laahi tavakkaltu ala-l-lohi, laa havla va laa kuchata illaa bi-l-laah" (Termiziy rivoyati).
                     Manosi: Allohinning nomi bilan (safarni boshlayman), Alloqa tavakkal qildim. Toat turib va ​​gunodan  saklanishga tokat yolgiz Alloh taolo berilgandir.
                     Okilishi: "Allohumma, bika asuulu va bika ahuulu va bika asiyru" (Imom Ahmad rivoyati).
                     Manosi: Salom! Sening madading ila hafsala va himmat qilib etib borishni kuzlayman, Sening madading ila gunohdan tiyilaman, Sening madading ila safarga chikaman.
                     Safarga ot kishi uyidan chikayotgan dushmani kuyidagi duoni o'qsa, shayton hamlasidan omonda  bo'lib, har qanday mushkuli oson bo'ldi, in shaa Alloh.
                     Oqilishi: "Bismi-l-laahi tavakkaltu ala-l-lohi, laa havla va laa kuchata illaa bi-l-laah" (Termiziy              rivoyati).
                     Manosi: Allohinning nomi bilan (safarni boshlayman), Alloqa tavakkal qildim. Toat turib va ​​gunodan              saklanishga tokat yolgiz Alloh taolo berilgandir.
                     Okilishi: "Allohumma, bika asuulu va bika ahuulu va bika asiyru" (Imom Ahmad rivoyati).
                     Manosi: Salom! Sening madading ila hafsala va himmat qilib etib borishni kuzlayman, Sening madading              ila gunohdan tiyilaman, Sening madading ila safarga chikaman.
        """
        
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
}
