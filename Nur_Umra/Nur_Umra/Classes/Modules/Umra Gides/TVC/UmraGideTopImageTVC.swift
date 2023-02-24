//
//  UmraGideTopImageTVC.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 23/02/23.
//

import UIKit

class UmraGideTopImageTVC: UITableViewCell, ClassIdentifiable {

    private lazy var stackView = UIStackView(arrangedSubviews: [imgView])
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
        stackView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            make.height.equalTo(260)
//            make.bottom.equalTo(self.snp.bottom)
        }
    }
}
