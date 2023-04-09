//
//  HomeInteractor.swift
//  Mini-Project
//
//  Created by Adji Firmansyah on 09/04/23.
//

import UIKit

class HomeInteractor: HomeInteractorProtocol {
    var presenter: HomePresenterProtocol?
    
    func fetchListUser(nav: UINavigationController) {
        print(nav)
    }
}
