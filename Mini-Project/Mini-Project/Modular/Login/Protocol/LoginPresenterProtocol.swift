//
//  LoginPresenterProtocol.swift
//  Mini-Project
//
//  Created by Adji Firmansyah on 09/04/23.
//

import UIKit

protocol LoginPresenterProtocol {
    func fetchLogin(user: UserLoginModel, nav: UINavigationController)
    func loginSuccess(nav: UINavigationController)
}
