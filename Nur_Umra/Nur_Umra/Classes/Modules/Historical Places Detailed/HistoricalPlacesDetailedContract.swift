//
//  HistoricalPlacesDetailedContract.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 28/02/23.
//

import UIKit

// MARK: View Output (Presenter -> View)
protocol PresenterToViewHistoricalPlacesDetailedProtocol: AnyObject {
    
    func onFetchSuccess(place: HistoricalPlacesDM)
    func onFetchFailure()
    
    func createUIElements()
    
    func handleViewWillAppear()
    func handleViewWillDisappear()
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterHistoricalPlacesDetailedProtocol: AnyObject {
    
    var view: PresenterToViewHistoricalPlacesDetailedProtocol? { get set }
    var router: PresenterToRouterHistoricalPlacesDetailedProtocol? { get set }
    var interactor: PresenterToInteractorHistoricalPlacesDetailedProtocol? { get set }
    var historicalPlace: HistoricalPlacesDM? { get set }
    
    func viewDidLoad()
    func viewWillAppear()
    func viewWillDisappear()
    
    func userWantsToPopVC()
    func userWantsToOpenOntheMap()
    
}

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorHistoricalPlacesDetailedProtocol: AnyObject {
    var presenter: InteractorToPresenterHistoricalPlacesDetailedProtocol? { get set }
    var historicalPlace: HistoricalPlacesDM? { get set }
    
    func retrieveSpecificPlace()
}

// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterHistoricalPlacesDetailedProtocol: AnyObject {
    func retrieveSpecificPlaceSuccess(place: HistoricalPlacesDM)
    func retrieveSpecificPlaceFailure()
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterHistoricalPlacesDetailedProtocol: AnyObject {

    static func createModule(withPlace: HistoricalPlacesDM) -> UIViewController
    func popVC(inView: PresenterToViewHistoricalPlacesDetailedProtocol)
    func showMaps(inView: PresenterToViewHistoricalPlacesDetailedProtocol)
}
