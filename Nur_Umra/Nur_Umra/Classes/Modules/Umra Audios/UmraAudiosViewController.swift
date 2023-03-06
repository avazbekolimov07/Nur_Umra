//
//  UmraAudiosViewController.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 25/02/23.
//

import UIKit
import AVFoundation
import SkeletonView

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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter?.viewWillDisappear()
    }
    
    deinit {
        presenter?.viewDeinit()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
    // MARK: - Properties
    var presenter: ViewToPresenterUmraAudiosProtocol?
    
    var baseView: UIView!
    var tableView: UITableView!
    var audioPlayer: AVPlayer?
    var selectedIndexPath: IndexPath?
    var isPlaying: Bool = false
    
    // MARK: - Actions
    
}

extension UmraAudiosViewController: PresenterToViewUmraAudiosProtocol {
    func handleViewWillAppear() {
        setNeedsStatusBarAppearanceUpdate()
        navigationController?.navigationBar.isHidden = false
    }
    
    func handleViewWillDisappear() {
        
    }
    
    func onFetchDuolarSuccess() {
        print("View receives the response from Presenter and updates itself.")
        self.tableView.stopSkeletonAnimation()
        self.view.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.25))
        
        self.tableView.reloadData()
    }
    
    func onFetchDuolarFailure(error: String) {
        print("View receives the response from Presenter with error: \(error)")
        self.tableView.stopSkeletonAnimation()
        self.view.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.25))
        
        self.tableView.reloadData()
    }
    
    func onFetchAudioSuccess(player: AVPlayer, indexPath: IndexPath) {
        try? AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
        try? AVAudioSession.sharedInstance().setActive(true)
        audioPlayer = player
        audioPlayer?.volume = 1
        audioPlayer?.play()
        
        isPlaying = true
        selectedIndexPath = indexPath
        tableView.beginUpdates()

        tableView.reloadRows(at: [indexPath], with: .none)
        tableView.endUpdates()
    }
    
    func onFetchAudioFailure(error: String, indexPath: IndexPath) {
        audioPlayer = nil
        selectedIndexPath = nil
        try? AVAudioSession.sharedInstance().setActive(false)
        print("View receives the response from Presenter with Message: \(error)")
    }
    
    func onViewPlay(indexPath: IndexPath) {
        audioPlayer?.play()
        isPlaying = true
        
        tableView.beginUpdates()
        tableView.reloadRows(at: [indexPath], with: .none)
        tableView.endUpdates()
    }
    
    func onViewStop(indexPath: IndexPath) {
        audioPlayer?.pause()
        isPlaying = false
        
        tableView.beginUpdates()
        tableView.reloadRows(at: [indexPath], with: .none)
        tableView.endUpdates()
    }
}

// MARK: - Skeleton TableView Delegate & Data Source

extension UmraAudiosViewController: UITableViewDelegate, SkeletonTableViewDataSource {
    
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return UmraAudioTVC.self.reuseId
    }
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 0 // default is 10 in presenter func
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withCellType: UmraAudioTVC.self, for: indexPath)
        cell.selectionStyle = .none
        cell.configure(duo: presenter?.eachUmraAudioData(indexPath: indexPath))
        
        //MARK: - prepareForReuse is called every time before cellForRowAt
        cell.isSelectedItem = selectedIndexPath == indexPath
        cell.isPlaying = isPlaying
        
        cell.configureBtnState()
    
        cell.didPlayBtnTapped = { [weak self] url in
            self?.presenter?.didPlayAndStop(audioUrlSting: url, indexPath: indexPath, currentPlayer: self?.audioPlayer)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRowAt(indexPath: indexPath)
    }
    
}

// MARK: - UI Setup
extension UmraAudiosViewController {
    func createUIElements() {
        overrideUserInterfaceStyle = .light
        self.view.backgroundColor = .white
        self.baseView = self.create_baseView()
        self.tableView = self.create_tableView()
        self.navigationItem.title = "UMRA DUOLARI"
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.1716529429, green: 0.1766341031, blue: 0.19795838, alpha: 1)
        
        tableView.isSkeletonable = true
        tableView.showAnimatedGradientSkeleton()
    }
}

extension UmraAudiosViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       if scrollView.contentOffset.y < 0 {
            scrollView.contentOffset.y = 0
        }
    }
}
