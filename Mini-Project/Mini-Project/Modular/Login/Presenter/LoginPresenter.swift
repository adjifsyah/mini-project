//
//  LoginPresenter.swift
//  Mini-Project
//
//  Created by Adji Firmansyah on 09/04/23.
//

import UIKit

class LoginPresenter: LoginPresenterProtocol {
    var interactor: LoginInteractorProtocol?
    var router: LoginRouterProtocol?
    var view: LoginViewProtocol?
    func fetchLogin(user: UserLoginModel, nav: UINavigationController) {
        interactor?.fetchLogin(data: user, nav: nav)
    }
    
    func loginSuccess(nav: UINavigationController) {
        router?.goToHome(nav: nav)
    }
    
    
}
