//
//  UmraAudioDetailViewController.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 27/02/23.
//

import UIKit
import AVFoundation

class UmraAudioDetailViewController: UIViewController {
    
    // MARK: - Properties
    var presenter: ViewToPresenterUmraAudioDetailProtocol?
    
    var audioPlayer: AVPlayer?
    var url: String?
    
    var baseView: UIView!
    var scrollView: UIScrollView!
    var imgView: UIImageView!
    var titleLbl: UILabel!
    var descriptionLbl: UILabel!
    var backBtn: UIButton!
    var playAudioBtn: UIButton!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter?.viewWillDisappear()
    }
    
    deinit {
        presenter?.viewDeinit()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    // MARK: - Actions
    @objc func backBtnTapped() {
        presenter?.userWantsToPopVC()
    }
    
    @objc func audioPlayBtnTapped() {
        if let url = url {
            presenter?.didPlayAndStop(audioUrlSting: url, currentPlayer: audioPlayer)
        }
    }
    
}

extension UmraAudioDetailViewController: PresenterToViewUmraAudioDetailProtocol {
    
    func handleViewWillAppear() {
        setNeedsStatusBarAppearanceUpdate()
        navigationController?.navigationBar.isHidden = true
    }
    
    func handleViewWillDisappear() {
    }
    
    func onUpdateUIElementsSuccess(with duo: DuoDM) {
        self.updateUI(duo: duo)
    }
    
    func onUpdateUIElementsFailure(error: String?) {
        print("Could not get audio detailed")
    }
    
    func updateUI(duo: DuoDM) {
        self.imgView.image = UIImage(named: "duolar_img")
        self.titleLbl.text = duo.name
        self.descriptionLbl.text = duo.description.deleteHTMLTag()
        self.url = duo.audio
    }
    
    func onFetchAudioSuccess(player: AVPlayer) {
        try? AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
        try? AVAudioSession.sharedInstance().setActive(true)
        audioPlayer = player
        audioPlayer?.volume = 1
        playAudioBtn.setImage(UIImage(named: "stop_img"), for: .normal)
        playAudioBtn.setImage(UIImage(named: "stop_img"), for: .selected)
        audioPlayer?.play()
    }
    
    func onFetchAudioFailure(error: String) {
        audioPlayer = nil
        try? AVAudioSession.sharedInstance().setActive(false)
        print("View receives the response from Presenter with Message: \(error)")
    }
    
    func onViewPlay() {
        playAudioBtn.setImage(UIImage(named: "stop_img"), for: .normal)
        playAudioBtn.setImage(UIImage(named: "stop_img"), for: .selected)
        audioPlayer?.play()
    }
    
    func onViewStop() {
        playAudioBtn.setImage(UIImage(named: "play_img")?.withRenderingMode(.alwaysTemplate), for: .normal)
        playAudioBtn.setImage(UIImage(named: "play_img")?.withRenderingMode(.alwaysTemplate), for: .selected)
        audioPlayer?.pause()
    }
    
}

// MARK: - UI Setup
extension UmraAudioDetailViewController {
    func createUIElements() {
        overrideUserInterfaceStyle = .light
        self.view.backgroundColor = .white
        self.baseView = self.create_baseView()
        self.scrollView = self.createScrollView()
        self.imgView = self.createImgView()
        self.titleLbl = self.createTitleLbl()
        self.descriptionLbl = self.createDescription()
        self.backBtn = self.createBackBtn()
        self.playAudioBtn = self.createAudioPlayerBtn()
        
        self.navigationItem.title = ""
    }
}

extension UmraAudioDetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       if scrollView.contentOffset.y < 0 {
            scrollView.contentOffset.y = 0
        }
    }
}


