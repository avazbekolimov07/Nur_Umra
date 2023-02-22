//
//  HomeViewController.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 20/02/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    // MARK: - Properties
    var presenter: ViewToPresenterHomeProtocol?
    var collectionView: UICollectionView!
    var refreshControl: UIRefreshControl!
    
    // MARK: - Actions
    @objc func refresh() {
        presenter?.refresh()
    }
}

extension HomeViewController: PresenterToViewHomeProtocol{
    
    func onFetchNewsSuccess() {
        print("View receives the response from Presenter and updates itself.")
        
        self.collectionView.reloadData()
        self.refreshControl.endRefreshing()
    }

    func onFetchNewsFailure(error: String) {
        print("View receives the response from Presenter with error: \(error)")
        self.refreshControl.endRefreshing()
    }
    

//    func showHUD() {
//        HUD.show(.progress, onView: self.view)
//    }
//
//    func hideHUD() {
//        HUD.hide()
//    }

//    func deselectRowAt(row: Int) {
//        self.tableView.deselectRow(at: IndexPath(row: row, section: 0), animated: true)
//    }
    
}

// MARK: - CollectionView Delegate & Data Source

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return presenter?.numberOfRowsInSection() ?? 0
        default:
            return 4
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withCellType: HomeNewsCVC.self, for: indexPath)
            cell.didShareButtonPressed = { [weak self] in
                print("Share Button Pressed")
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
                let header = collectionView.dequeueReusableView(ofKind: .header,
                                                                withViewType: HomeReusableHeaderView.self,
                                                                for:indexPath)
                header.label.text = "Yangiliklar"
                header.seeMoreTapped = { [weak self] in
                    print("Yangiliklar tapped")
                }
                return header
            default:
                let header = collectionView.dequeueReusableView(ofKind: .header,
                                                                withViewType: HomeReusableHeaderView.self,
                                                                for: indexPath)
                header.label.text = "Qo’llanma"
                header.seeMoreTapped = { [weak self] in
                    print("Qo’llanma tapped")
                }
                return header
            }
        } else {
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            print("Yangiliklar")
            presenter?.didSelectRowAt(index: indexPath.row)
        default:
            print("Qo’llanma")
            presenter?.didSelectRowAt(index: indexPath.row)
        }
    }
    
}

// MARK: - UI Setup
extension HomeViewController {
    func createUIElements() {
        overrideUserInterfaceStyle = .light
        self.collectionView = self.create_collectionView()
        self.refreshControl = self.create_refreshController()
        self.collectionView.addSubview(self.refreshControl)
        self.navigationItem.title = ""
    }
}
