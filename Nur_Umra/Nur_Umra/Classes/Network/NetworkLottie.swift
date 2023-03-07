//
//  NetworkLottie.swift
//  1Sonia
//
//  Created by Azizbek Salimov on 30.06.2022.
//

import UIKit
import Lottie
import AudioToolbox
import SnapKit

class NetworkLottie: UIViewController {
    
    lazy var visualEffectView: UIVisualEffectView = {
        let view = UIVisualEffectView()
        view.alpha = 1
        let blueEffect = UIBlurEffect(style: .light)
        view.effect = blueEffect
        return view
    }()
    
    lazy var viewMain: UIView = {
        let view = UIView()
        view.contentMode = .center
        return view
    }()
    
    let networkLabel: UILabel = {
        let label = UILabel()
        label.text = "Internet Aloqasi Mavjud Emas!"
        label.textAlignment = .center
        label.textColor = .mainGreenColor
        label.font = UIFont.poppins_Medium(size: 22)
        
        return label
    }()
    
    lazy var retryBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "arrow.triangle.2.circlepath")?
            .withRenderingMode(.alwaysTemplate)
            .applyingSymbolConfiguration(.init(weight: .bold)),
                     for: .normal)
        btn.tintColor = .white
        btn.backgroundColor = .mainGreenColor
        
        btn.layer.cornerRadius = 12
        btn.addTarget(self, action: #selector(okBtnPressed), for: .touchUpInside)
        return btn
    }()
    
    lazy var lottieView: LottieAnimationView = {
        let view = LottieAnimationView()
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lottieView.clipsToBounds = true
        let animation = LottieAnimation.named("wiFiOff")
        lottieView.animation = animation
        lottieView.loopMode = .loop
        lottieView.play()
        
        lottieView.center = view.center
        setupSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        networkListener()
    }
    
    @objc func okBtnPressed() {
        if NetworkMonitor.shared.isConnetcted {
            
            self.dismiss(animated: false, completion: nil)
        } else {
            AudioServicesPlaySystemSound(1520)
            retryBtn.shake(duration: 0.5, values: [-12.0, 12.0, -12.0, 12.0, -6.0, 6.0, -3.0, 3.0, 0.0])
        }
    }
}



extension NetworkLottie {
    func networkListener(){
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(internetConnectionOn(notification: )),
                                               name: Notification.Name("internetConnectionOn"),
                                               object: nil)
        
    }
    
    @objc func internetConnectionOn(notification: NSNotification){
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: Notification.Name("internetConnectionDismissed"),
                                            object: nil)
            self.dismiss(animated: true, completion: nil)
        }
    }
}

// MARK: - Layout

extension NetworkLottie {

    func setupSubviews() {
        view.addSubview(visualEffectView)
        visualEffectView.contentView.addSubviews(viewMain)

        viewMain.addSubviews(lottieView, retryBtn, networkLabel)
        configureConstraints()
    }

    func configureConstraints() {
        visualEffectView.snp.makeConstraints { make in
            make.top.equalTo(self.view.snp.top)
            make.left.equalTo(self.view.snp.left)
            make.bottom.equalTo(self.view.snp.bottom)
            make.right.equalTo(self.view.snp.right)
        }
        
        viewMain.snp.makeConstraints { make in
            make.top.equalTo(self.visualEffectView.snp.top)
            make.left.equalTo(self.visualEffectView.snp.left)
            make.bottom.equalTo(self.visualEffectView.snp.bottom)
            make.right.equalTo(self.visualEffectView.snp.right)
        }
        
        lottieView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(self.viewMain.snp.centerY).offset(-70)
            make.width.height.equalTo(self.view.frame.width / 1.7)
        }
        
        retryBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.viewMain.snp.bottom).offset(-70)
            make.width.equalTo(60)
            make.height.equalTo(60)
        }
        
        networkLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.lottieView.snp.bottom).offset(30)
        }
        
    }

}



