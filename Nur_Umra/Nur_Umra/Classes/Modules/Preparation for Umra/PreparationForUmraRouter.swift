//
//  PreparationForUmraRouter.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 27/02/23.
//

import Foundation
import UIKit

class PreparationForUmraRouter: PresenterToRouterPreparationForUmraProtocol {
    func createModule(with: [PreparationDm]) -> UIViewController {
        print("fdsf")
        return NewsDetailedViewController()
    }
    
    
}
