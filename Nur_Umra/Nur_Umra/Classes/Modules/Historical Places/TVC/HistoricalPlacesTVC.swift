//
//  HistoricalPlacesTVC.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 27/02/23.
//

import UIKit
import SkeletonView

class HistoricalPlacesTVC: UITableViewCell, ClassIdentifiable {

    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 16
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 8
        view.layer.shadowOpacity = 0.1
        
//        view.layer.shouldRasterize = true
        view.layer.borderWidth = 0.3
        view.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        return view
    }()
    
    private let img: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.image = UIImage(named: "tarix_img")
        img.clipsToBounds = true
        img.layer.cornerRadius = 16
        
        return img
    }()
    
    private let nameLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Poppins-SemiBold", size: 18)
        lbl.numberOfLines = 0
        lbl.textAlignment = .left
        lbl.text = "Masjidul Nabavi"
        
        lbl.skeletonTextNumberOfLines = 1
        lbl.skeletonCornerRadius = 4
        lbl.linesCornerRadius = 4
        return lbl
    }()
    
    func updateCell(with place: HistoricalPlacesDM?) {
        guard let safePlace = place else { return }
        self.img.sd_setImage(with: URL(string: safePlace.img), placeholderImage: UIImage(named: "tarix_img"))
        self.nameLbl.text = safePlace.name
    }
    
    private func setupViews() {
        contentView.addSubview(containerView)
        self.containerView.addSubview(img)
        self.containerView.addSubview(nameLbl)
    }
    
    private func setupConstraints() {
        
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(10)
        }
        
        img.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).offset(8)
            make.left.equalTo(containerView.snp.left).offset(8)
            make.right.equalTo(containerView.snp.right).inset(8)
            make.height.equalTo(img.snp.width).multipliedBy(0.79)
            
        }
        
        nameLbl.snp.makeConstraints { make in
            make.top.equalTo(img.snp.bottom).offset(12)
            make.left.equalTo(containerView.snp.left).offset(8)
            make.right.equalTo(containerView.snp.right).inset(16)
            make.bottom.equalTo(containerView.snp.bottom).inset(12)
        }
    }
    
    func configureSkeleton() {
        [self.nameLbl,
         self.img,
         self.containerView,
         self.contentView,
         self].forEach {
            $0.isSkeletonable = true
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .default
        
        setupViews()
        setupConstraints()
        configureSkeleton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
    }
    
}
