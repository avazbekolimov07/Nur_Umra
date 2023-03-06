//
//  AllNewsViewController.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 21/02/23.
//

import UIKit


class AllNewsViewController: UIViewController {

   
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
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
    
    // MARK: - Properties
    var collectionView: UICollectionView!
    var presenter: ViewToPresenterAllNewsProtocol?
    var refreshControl: UIRefreshControl!
    var baseView: UIView!
    
    // MARK: - Actions
    @objc func refresh() {
        presenter?.refresh()
    }
}

// MARK: - UI Setup
extension AllNewsViewController {
    
    func createUIElements() {
        self.view.backgroundColor = .white
        self.baseView = self.create_baseView()
        self.collectionView = self.create_collectionView()
        self.refreshControl = self.create_refreshController()
        self.collectionView.addSubview(self.refreshControl)

    }
    
    
}

// MARK: - Update views
extension AllNewsViewController: PresenterToViewAllNewsProtocol {
    func handleViewWillAppear() {
        setNeedsStatusBarAppearanceUpdate()
        navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = "Yangiliklar"
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.1716529429, green: 0.1766341031, blue: 0.19795838, alpha: 1)
    }
    
    func handleViewWillDisappear() {
        UIApplication.shared.statusBarStyle = .default
    }
    
    
    func onFetchNewsSuccess() {
        print("View receives the response from Presenter and updates itself.")
        
        self.collectionView.reloadData()
        self.refreshControl.endRefreshing()
    }
    
    func onFetchNewsFailure(error: String) {
        print("View receives the response from Presenter with error: \(error)")
        self.refreshControl.endRefreshing()
    }
}

//MARK: - Collection views delegates
extension AllNewsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width - 32, height: (self.view.frame.width - 32) * 1.05 )
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeNewsCVC", for: indexPath) as? HomeNewsCVC else { return UICollectionViewCell() }
        cell.configure(new: presenter?.interactor?.getSpecificNews(indexPAth: indexPath))
        cell.didShareButtonPressed = {[weak self] link in
            self?.presenter?.didShowShareView(link: link)
            print("pressed button at link - \(link)  index path -", indexPath.row)
          
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.presenter?.didSelectRowAt(index: indexPath.row)
    }
    
    
    
}

