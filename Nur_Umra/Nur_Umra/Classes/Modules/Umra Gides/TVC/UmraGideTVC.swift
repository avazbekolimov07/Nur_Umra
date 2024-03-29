//
//  UmraGideTVC.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 23/02/23.
//

import UIKit
import SkeletonView

class UmraGideTVC: UITableViewCell, ClassIdentifiable {
    
    
    var handbook: HandbookDM?
    
    // MARK: - UI Elements
    private lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        
        view.layer.shadowColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.16).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 8
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        return view
    }()
    
    private lazy var hStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, moreImageView])
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.backgroundColor = .clear
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .poppins_SemiBold(size: 14)

        label.textColor = #colorLiteral(red: 0.2224110067, green: 0.2330494523, blue: 0.2606178522, alpha: 1)
        label.textAlignment = .left
        label.numberOfLines = 0
        
        label.text = "simple data to make skeletion view so that it would be visible"
        label.skeletonCornerRadius = 4
        label.linesCornerRadius = 4
        label.lastLineFillPercent = 60
        return label
    }()
    
    private lazy var moreImageView = UIImageView(image: UIImage(named: "moreInfo_img"))
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        moreImageView.skeletonCornerRadius = 4
        setupSubviews()
    }
    
    override func layoutSubviews() {
        
    }
    
    func configure(handbook: HandbookDM?) {
        guard let handbookSafe = handbook else { return }
        self.handbook = handbook
        self.removeSkeleton()
        self.updateUI(handbook: handbookSafe)
    }
    
    private func updateUI(handbook: HandbookDM) {
        titleLabel.text = handbook.name
    }
    
    func configureSkeleton() {
        [self.titleLabel,
         self.moreImageView,
         self.hStackView,
         self.mainView].forEach {
            $0.isSkeletonable = true
            $0.showAnimatedGradientSkeleton()
        }
    }
    
    func removeSkeleton() {
        [self.titleLabel,
         self.moreImageView,
         self.hStackView,
         self.mainView].forEach {
            $0.stopSkeletonAnimation()
        }
        self.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.25))
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout

extension UmraGideTVC {
    
    private func setupSubviews() {
        contentView.addSubviews(mainView)
        mainView.addSubview(hStackView)
        configureConstraints()
    }
    
    private func configureConstraints() {
        moreImageView.snp.makeConstraints { make in
            make.height.equalTo(12)
            make.width.equalTo(12)
        }
        
        hStackView.snp.makeConstraints { make in
            make.top.equalTo(mainView.snp.top).offset(16)
            make.left.equalTo(mainView.snp.left).offset(16)
            make.right.equalTo(mainView.snp.right).offset(-16)
            make.bottom.equalTo(mainView.snp.bottom).offset(-16)
        }
        
        mainView.snp.makeConstraints { make in
            make.top.equalTo(self.contentView.snp.top).offset(6)
            make.left.equalTo(self.contentView.snp.left).offset(16)
            make.right.equalTo(self.contentView.snp.right).offset(-16)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-6)
        }
        
    }
}
    
