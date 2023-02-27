//
//  HistoricalPlacesContract.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 27/02/23.
//

import UIKit

// MARK: View Output (Presenter -> View)
protocol PresenterToViewHistoricalPlacesProtocol: AnyObject {
    
    func createUIElements()
    
    func onFetchSuccess()
    func onFetchFailure(errorCode: Int)
    
    
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterHistoricalPlacesProtocol: AnyObject {
    
    var view: PresenterToViewHistoricalPlacesProtocol? { get set }
    var router: PresenterToRouterHistoricalPlacesProtocol? { get set}
    var interactor: PresenterToInteractorHistoricalPlacesProtocol? { get set }
    
    var historicalPlaces: [HistoricalPlacesDM]? { get set }
    
    func viewDidLoad()
    
    func refresh()
    
    func didSelectRawAt(indexPath: IndexPath)
}

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorHistoricalPlacesProtocol: AnyObject  {
    func getHistoricalPlacesSuccess(historicalPlaces: [HistoricalPlacesDM])
    func getHistoricalPlacesFailure(errorCode: Int )
}

// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterHistoricalPlacesProtocol: AnyObject {
    var historicalPlaces: [HistoricalPlacesDM]? { get set }
    var presenter: PresenterToInteractorHistoricalPlacesProtocol? { get set }
    
    func loadHistoricalPlaces()
    func retrieveHistoricalPlaces()
    
    func retrieveSpecificHistoricalPlace()
    
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterHistoricalPlacesProtocol: AnyObject  {
    static func createModule()
    
    func pushTohistoricalPlacesDetailed(with specificPlace: HistoricalPlacesDM )
}
