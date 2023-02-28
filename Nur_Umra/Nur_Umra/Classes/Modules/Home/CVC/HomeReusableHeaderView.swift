//
//  HomeReusableHeaderView.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 21/02/23.
//

import UIKit
import SnapKit

class HomeReusableHeaderView: UICollectionReusableView, ClassIdentifiable {
    
    private(set) lazy var label: UILabel = {
        let label = UILabel()
        label.font = .poppins_SemiBold(size: 18)
        label.textColor = #colorLiteral(red: 0.2224110067, green: 0.2330494523, blue: 0.2606178522, alpha: 1)
        
        return label
    }()
    
    lazy var seeMoreButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Hammasini ko'rish", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0, green: 0.3961157799, blue: 0.404067874, alpha: 1), for: .normal)
        button.titleLabel?.font = .poppins_Medium(size: 12)
        button.addTarget(self, action: #selector(handleLearnMore), for: .touchUpInside)
        return button
    }()
    
    var seeMoreTapped: (() -> Void)?
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure(title: String, withButton: Bool) {
        label.text = title
        seeMoreButton.isHidden = !withButton
    }
    
    @objc func handleLearnMore() {
        seeMoreTapped?()
    }
}

// MARK: - Layout
extension HomeReusableHeaderView {
    private func setupSubviews() {
        addSubviews(seeMoreButton, label)
        configureConstraints()
    }
    
    private func configureConstraints() {
        seeMoreButton.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
            make.right.equalTo(self.snp.right).offset(-16)
            make.width.equalTo(120)
        }
        
        label.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.left.equalTo(self.snp.left).offset(16)
            make.bottom.equalTo(self.snp.bottom)
            make.right.equalTo(self.seeMoreButton.snp.left).offset(-16)
        }
        
    }
}
