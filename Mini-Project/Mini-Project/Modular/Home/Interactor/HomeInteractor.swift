//
//  HomeInteractor.swift
//  Mini-Project
//
//  Created by Adji Firmansyah on 09/04/23.
//

import UIKit

class HomeInteractor: HomeInteractorProtocol {
    var presenter: HomePresenterProtocol?
    var services = URLSessionClient(urlSession: .shared)
    
    func fetchListUser(nav: UINavigationController) {
        services.fetchListUser(path: "/api/users") { result in
            switch result {
            case .success(let success):
                self.presenter?.successGetUser(data: success)
            case .failure(_):
                self.presenter?.failureGetuser()
            }
        }
    }
}
