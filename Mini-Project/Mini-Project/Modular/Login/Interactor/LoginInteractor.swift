//
//  LoginInteractor.swift
//  Mini-Project
//
//  Created by Adji Firmansyah on 09/04/23.
//

import UIKit

class LoginInteractor: LoginInteractorProtocol {
    var presenter: LoginPresenterProtocol?
    var services = URLSessionClient(urlSession: URLSession.shared)
    
    func fetchLogin(data: UserLoginModel, nav: UINavigationController) {
        services.fetchLogin(dataLogin: data, path: "/api/login") { result in
            switch result {
            case .success(let data):
                print(data)
                self.presenter?.loginSuccess(nav: nav)
            case .failure(let err):
                print(err)
            }
        }
    }
    
}
