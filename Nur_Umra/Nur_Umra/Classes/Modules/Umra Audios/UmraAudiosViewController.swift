//
//  UmraAudiosViewController.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 25/02/23.
//

import UIKit
import AVFoundation

class UmraAudiosViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        presenter?.viewDidDisappear()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .default
    }
    
    // MARK: - Properties
    var presenter: ViewToPresenterUmraAudiosProtocol?
    var tableView: UITableView!
    var audioPlayer: AVPlayer?
    
    
    // MARK: - Actions
    @objc func handleBackButton() {
        
    }
    
}

extension UmraAudiosViewController: PresenterToViewUmraAudiosProtocol {
    func handleViewWillAppear() {
        setNeedsStatusBarAppearanceUpdate()
        navigationController?.navigationBar.isHidden = false
    }
    
    func handleViewDidDisappear() {
        UIApplication.shared.statusBarStyle = .default
    }
    
    func onFetchDuolarSuccess() {
        print("View receives the response from Presenter and updates itself.")
        self.tableView.reloadData()
    }
    
    func onFetchDuolarFailure(error: String) {
        print("View receives the response from Presenter with error: \(error)")
    }
    
    func onFetchAudioSuccess(player: AVPlayer, indexPath: IndexPath) {
        try? AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
        try? AVAudioSession.sharedInstance().setActive(true)
        audioPlayer = player
        audioPlayer?.volume = 1
        audioPlayer?.play()
        let cell = tableView.cellForRow(at: indexPath) as? UmraAudioTVC
        cell?.updateToPlay()
    }
    
    func onFetchAudioFailure(error: String, indexPath: IndexPath) {
        audioPlayer = nil
        try? AVAudioSession.sharedInstance().setActive(false)
        print("View receives the response from Presenter with Message: \(error)")
    }
    
    func onViewPlay(indexPath: IndexPath) {
        try? AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
        try? AVAudioSession.sharedInstance().setActive(true)
        audioPlayer?.play()
        let cell = tableView.cellForRow(at: indexPath) as? UmraAudioTVC
        cell?.updateToPlay()
    }
    
    func onViewStop(indexPath: IndexPath) {
        audioPlayer?.pause()
        let cell = tableView.cellForRow(at: indexPath) as? UmraAudioTVC
        cell?.updateToStop()
        try? AVAudioSession.sharedInstance().setActive(false)
    }
}

// MARK: - TableView Delegate & Data Source

extension UmraAudiosViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withCellType: UmraAudioTVC.self, for: indexPath)
        cell.selectionStyle = .none
        cell.configure(duo: presenter?.eachUmraAudioData(indexPath: indexPath))
        cell.didPlayBtnTapped = { [weak self] url in
            self?.presenter?.didPlayAndStop(audioUrlSting: url, indexPath: indexPath, currentPlayer: self?.audioPlayer)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Did Select ")
        presenter?.didSelectRowAt(indexPath: indexPath)
    }
    
}

// MARK: - UI Setup
extension UmraAudiosViewController {
    func createUIElements() {
        overrideUserInterfaceStyle = .light
        self.view.backgroundColor = .white
        self.tableView = self.create_tableView()
        self.navigationItem.title = "UMRA DUOLARI"
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.1716529429, green: 0.1766341031, blue: 0.19795838, alpha: 1)
    }
}

extension UmraAudiosViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       if scrollView.contentOffset.y < 0 {
            scrollView.contentOffset.y = 0
        }
    }
}
