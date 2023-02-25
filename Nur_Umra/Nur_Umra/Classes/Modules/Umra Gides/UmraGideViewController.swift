//
//  UmraGideViewController.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 22/02/23
//

import UIKit


class UmraGideViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        UIApplication.shared.statusBarStyle = .default
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    // MARK: - Properties
    var presenter: ViewToPresenterUmraGideProtocol?
    var tableView: UITableView!
    var shareButton: UIButton!
    
    
    // MARK: - Actions
    @objc func handleBackButton() {
        
    }
    
}

extension UmraGideViewController: PresenterToViewUmraGideProtocol {
    
    func onFetchHandbooksSuccess() {
        print("View receives the response from Presenter and updates itself.")
        self.tableView.reloadData()
    }
    
    func onFetchHandbooksFailure(error: String) {
        print("View receives the response from Presenter with error: \(error)")
    }
  
}

// MARK: - TableView Delegate & Data Source

extension UmraGideViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return presenter?.numberOfRowsInSection() ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withCellType: UmraGideTopImageTVC.self, for: indexPath)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withCellType: UmraGideTVC.self, for: indexPath)
            cell.selectionStyle = .none
            cell.configure(handbook: presenter?.eachHanbookData(indexPath: indexPath))
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            presenter?.didSelectRowAt(indexPath: indexPath)
        }
    }
    
}

// MARK: - UI Setup
extension UmraGideViewController {
    func createUIElements() {
        overrideUserInterfaceStyle = .light
        self.tableView = self.create_tableView()
        self.shareButton = self.create_backButton()
        self.navigationItem.title = ""
    }
}

extension UmraGideViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       if scrollView.contentOffset.y < 0 {
            scrollView.contentOffset.y = 0
        }
    }
}
