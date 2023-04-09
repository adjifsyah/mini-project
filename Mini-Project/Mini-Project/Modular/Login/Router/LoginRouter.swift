//
//  LoginRouter.swift
//  Mini-Project
//
//  Created by Adji Firmansyah on 09/04/23.
//

import UIKit

class LoginRouter: LoginRouterProtocol {
    var presenter: LoginPresenterProtocol?
    static func createModule() -> LoginPageVC {
        let loginVC = LoginPageVC()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        let interactor = LoginInteractor()
        
        loginVC.presenter = presenter
        presenter.view = loginVC
        presenter.router = router
        presenter.interactor = interactor
        router.presenter = presenter
        interactor.presenter = presenter
        
        return loginVC
    }
    
    func goToHome(nav: UINavigationController) {
        DispatchQueue.main.async {
            let homeVC = HomeRouter.createModule()
            nav.pushViewController(homeVC, animated: true)
        }
        
    }
}
