//
//  HistoricalPlacesTVC.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 27/02/23.
//

import UIKit

class HistoricalPlacesTVC: UITableViewCell {
    static let identifier = "HistoricalPlacesTVC"

    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 16
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 6, height: -6)
        view.layer.shadowRadius = 18
        view.layer.shadowOpacity = 0.3
//        view.layer.shouldRasterize = true
        view.layer.borderWidth = 1
        view.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
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
        lbl.text = "Masjidul Nabaviy - In Medina al Munavvara Masjidul"
        return lbl
    }()
    
    func updateCell(with place: HistoricalPlacesDM) {
        self.img.sd_setImage(with: URL(string: place.img), placeholderImage: UIImage(named: "tarix_img"))
        self.nameLbl.text = place.name
    }
    
    private func setupViews() {
        self.contentView.addSubview(containerView)
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
    
    func setupCell() {
        setupViews()
        setupConstraints()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .default
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}