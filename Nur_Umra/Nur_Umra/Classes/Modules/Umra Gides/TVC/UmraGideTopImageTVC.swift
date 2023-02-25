//
//  UmraGideTopImageTVC.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 23/02/23.
//

import UIKit

class UmraGideTopImageTVC: UITableViewCell, ClassIdentifiable {

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imgView])
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 0
        return stackView
    }()
    
    private lazy var imgView = UIImageView(image: UIImage(named: "umraGide_img"))
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
    }
    
    override func layoutSubviews() {
//        setupSubviews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout

extension UmraGideTopImageTVC {
    
    private func setupSubviews() {
        addSubviews(stackView)
        configureConstraints()
    }
    
    private func configureConstraints() {
        imgView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(260)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(-UIWindow.safeAreaInsets.top)
            make.left.equalTo(self.snp.left).offset(0)
            make.right.equalTo(self.snp.right).offset(0)
            make.bottom.equalTo(self.snp.bottom).offset(-24)
        }
    }
}
