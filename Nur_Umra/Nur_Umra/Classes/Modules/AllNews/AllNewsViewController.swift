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
       print("didLoad")
        presenter?.viewDidLoad()
    }
    
    // MARK: - Properties
    var collectionView: UICollectionView!
    var presenter: ViewToPresenterAllNewsProtocol?
    var refreshControl: UIRefreshControl!
    
    // MARK: - Actions
    @objc func refresh() {
        presenter?.refresh()
    }
}

// MARK: - UI Setup
extension AllNewsViewController {
    
    func createUIElements() {
        overrideUserInterfaceStyle = .light
        
        self.view.backgroundColor = .white
        self.collectionView = self.create_collectionView()
        self.refreshControl = self.create_refreshController()
        self.collectionView.addSubview(self.refreshControl)
        self.navigationItem.title = "Yangiliklar"
    }
    
    
}

// MARK: - Update views
extension AllNewsViewController: PresenterToViewAllNewsProtocol {
    func showShareView(shareView: UIActivityViewController) {
        self.present(shareView, animated: true)
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
    
    
    
}

