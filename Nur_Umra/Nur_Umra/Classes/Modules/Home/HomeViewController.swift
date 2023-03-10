//
//  HomeViewController.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 21/02/23.
//

import UIKit
import SkeletonView

class HomeViewController: UIViewController {
    
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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
    // MARK: - Properties
    var presenter: ViewToPresenterHomeProtocol?
    var baseView: UIView!
    var collectionView: UICollectionView!
    var refreshControl: UIRefreshControl!
    
    // MARK: - Actions
    @objc func refresh() {
        presenter?.refresh()
    }
    
}

extension HomeViewController: PresenterToViewHomeProtocol {
    
    func handleViewWillAppear() {
        setNeedsStatusBarAppearanceUpdate()
        navigationController?.navigationBar.isHidden = true
    }
    
    func handleViewWillDisappear() {
    }
    
    func onFetchNewsSuccess() {
        print("View receives the response from Presenter and updates itself.")
    
//        self.collectionView.stopSkeletonAnimation()
//        self.view.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.25))
        
        self.collectionView.reloadData()
        self.refreshControl.endRefreshing()
    }

    func onFetchNewsFailure(error: String) {
        print("View receives the response from Presenter with error: \(error)")
        
//        self.collectionView.stopSkeletonAnimation()
//        self.view.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.25))
        
        self.refreshControl.endRefreshing()
    }
    
//    func showHUD() {
//        HUD.show(.progress, onView: self.view)
//    }
//
//    func hideHUD() {
//        HUD.hide()
//    }

    
}

// MARK: - CollectionView Delegate & Data Source

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
//    func numSections(in collectionSkeletonView: UICollectionView) -> Int {
//        return 3
//    }
//
//    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        switch section {
//        case 0:
//            return 0
//        case 1:
//            return 4
//        default:
//            return 0
//        }
//    }
//
//    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
//        return HomeNewsCVC.self.reuseId
//    }

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return presenter?.numberOfRowsInSection() ?? 0 // default is 4 in presenter func
        default:
            return 4
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withCellType: HomeIconCVC.self, for: indexPath)
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withCellType: HomeNewsCVC.self, for: indexPath)
            cell.configureSkeleton()
            cell.configure(new: presenter?.eachNewsData(indexPath: indexPath))
            cell.didShareButtonPressed = { [weak self] link in
                self?.presenter?.didShowShareView(link: link)
            }
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withCellType: HomeGuideCVC.self, for: indexPath)
            switch indexPath.item {
            case 0:
                cell.titleLabel.text = "Umra qo’llanmasi"
                cell.photoImageView.image = UIImage(named: "qo'llanma_img")
            case 1:
                cell.titleLabel.text = "Umra duolari"
                cell.photoImageView.image = UIImage(named: "duolar_img")
            case 2:
                cell.titleLabel.text = "Safarga tayorgarlik"
                cell.photoImageView.image = UIImage(named: "safar_img")
            default:
                cell.titleLabel.text = "Islom tarixiga oid joylar"
                cell.photoImageView.image = UIImage(named: "tarix_img")
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        let viewKind = UICollectionView.SupplymentaryViewKind(identifier: kind)
        if viewKind == .header {
            switch indexPath.section {
            case 0:
                return UICollectionReusableView()
            case 1:
                let header = collectionView.dequeueReusableView(ofKind: .header,
                                                                withViewType: HomeReusableHeaderView.self,
                                                                for:indexPath)
                header.label.text = "Yangiliklar"
                header.seeMoreButton.isHidden = false
                header.seeMoreTapped = { [weak self] in
                    self?.presenter?.didSelectMore()
                }
                return header
            default:
                let header = collectionView.dequeueReusableView(ofKind: .header,
                                                                withViewType: HomeReusableHeaderView.self,
                                                                for: indexPath)
                header.label.text = "Qo’llanma"
                header.seeMoreButton.isHidden = true
                return header
            }
        } else {
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            print("")
        case 1:
            presenter?.didSelectRowAt(indexPath: indexPath)
        default:
            presenter?.didSelectRowAt(indexPath: indexPath)
        }
    }
    
}

// MARK: - UI Setup
extension HomeViewController {
    func createUIElements() {
        overrideUserInterfaceStyle = .light
        
        self.baseView = self.create_baseView()
        self.collectionView = self.create_collectionView()
        self.refreshControl = self.create_refreshController()
        self.collectionView.addSubview(self.refreshControl)
        self.navigationItem.title = ""
        
        baseView.isSkeletonable = true
        collectionView.isSkeletonable = true
//        collectionView.showAnimatedGradientSkeleton()
        
        NetworkMonitor.shared.startMonitoring()
        networkListener()
    }
}

extension HomeViewController {
    func networkListener(){
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(internetConnectionOff(notification: )),
                                               name: Notification.Name("internetConnectionOff"),
                                               object: nil)
        
    }
    
    
    @objc func internetConnectionOff(notification: NSNotification){
        DispatchQueue.main.async {
            let vc = NetworkLottie()
            vc.modalPresentationStyle = .overFullScreen
            vc.modalTransitionStyle = .crossDissolve
            self.present(vc, animated: false, completion: nil)
        }
    }
}
