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
    
    func handleViewWillAppear()
       func handleViewWillDisappear()
    
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterHistoricalPlacesProtocol: AnyObject {
    
    var view: PresenterToViewHistoricalPlacesProtocol? { get set }
    var router: PresenterToRouterHistoricalPlacesProtocol? { get set}
    var interactor: PresenterToInteractorHistoricalPlacesProtocol? { get set }
    
    var historicalPlaces: [HistoricalPlacesDM]? { get set }
    var dataFetched: Bool { get set }
    
    func viewDidLoad()
    func viewWillAppear()
    func viewWillDisappear()
    
    func refresh()
    
    func didSelectRawAt(indexPath: IndexPath)
    func eachPlacesData(indexPath: IndexPath) -> HistoricalPlacesDM?
    func numberOfRowsInSection() -> Int
    
 
}

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorHistoricalPlacesProtocol: AnyObject  {
    var presenter: InteractorToPresenterHistoricalPlacesProtocol? { get set }
    var historicalPlaces: [HistoricalPlacesDM]? { get set }
    
    func loadHistoricalPlaces()
    func retrieveHistoricalPlaces()
    
    func retrieveSpecificHistoricalPlace(with indexPath: IndexPath)
}

// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterHistoricalPlacesProtocol: AnyObject {
   
    func getHistoricalPlacesSuccess(historicalPlaces: [HistoricalPlacesDM])
    func getHistoricalPlacesFailure(errorCode: Int )
    
    func getSpecificHistroicalPlaceSucces(specificPlace: HistoricalPlacesDM)
    func getSpecificHistroicalPlaceFailure()
    
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterHistoricalPlacesProtocol: AnyObject  {
    static func createModule() -> UIViewController
    
    func pushTohistoricalPlacesDetailed(on view: PresenterToViewHistoricalPlacesProtocol, with specificPlace: HistoricalPlacesDM )
    
}
