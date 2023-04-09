//
//  HomeRouter.swift
//  Mini-Project
//
//  Created by Adji Firmansyah on 09/04/23.
//

import Foundation

class HomeRouter: HomeRouterProtocol {
    var presenter: HomePresenterProtocol?
    static func createModule() -> HomePageVC {
        let homeVC = HomePageVC()
        let presenter = HomePresenter()
        let router = HomeRouter()
        let interactor = HomeInteractor()
        
        homeVC.presenter = presenter
        presenter.view = homeVC
        presenter.router = router
        presenter.interactor = interactor
        router.presenter = presenter
        interactor.presenter = presenter
        
        return homeVC
    }
    
    
}
