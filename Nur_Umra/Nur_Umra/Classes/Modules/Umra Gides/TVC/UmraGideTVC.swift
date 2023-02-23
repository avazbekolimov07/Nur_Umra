//
//  UmraGideTVC.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 23/02/23.
//

import UIKit

class UmraGideTVC: UITableViewCell, ClassIdentifiable {

    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [hStackView])
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 0
        return stackView
    }()
    
    private lazy var hStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, moreImageView])
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.spacing = 12
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()

//        label.font = .jostRegular(size: 14)
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = #colorLiteral(red: 0.2224110067, green: 0.2330494523, blue: 0.2606178522, alpha: 1)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var moreImageView = UIImageView(image: UIImage(named: "moreInfo_img"))
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    override func layoutSubviews() {
        setupSubviews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout

extension UmraGideTVC {
    
    private func setupSubviews() {
        addSubviews(mainStackView)
        configureConstraints()
    }
    
    private func configureConstraints() {
        moreImageView.snp.makeConstraints { make in
            make.height.equalTo(12)
            make.width.equalTo(12)
        }
        
        mainStackView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(16)
            make.left.equalTo(self.snp.left).offset(16)
            make.right.equalTo(self.snp.right).offset(-16)
            make.bottom.equalTo(self.snp.bottom).offset(-16)
        }
        
        
    }
}
    
