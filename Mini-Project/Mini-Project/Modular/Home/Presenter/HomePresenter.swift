//
//  HomePresenter.swift
//  Mini-Project
//
//  Created by Adji Firmansyah on 09/04/23.
//

import UIKit

class HomePresenter: HomePresenterProtocol {
    var view: HomeViewProtocol?
    var router: HomeRouterProtocol?
    var interactor: HomeInteractorProtocol?
    
    func getListUser(nav: UINavigationController) {
        interactor?.fetchListUser(nav: nav)
    }
    
    func successGetUser(data: [UserModel]) {
//        view
    }
    
    func failureGetuser() {
//        <#code#>
    }
    
}
