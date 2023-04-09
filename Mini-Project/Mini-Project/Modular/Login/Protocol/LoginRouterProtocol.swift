//
//  LoginRouterProtocol.swift
//  Mini-Project
//
//  Created by Adji Firmansyah on 09/04/23.
//

import UIKit

protocol LoginRouterProtocol {
    static func createModule() -> LoginPageVC
    func goToHome(nav: UINavigationController)
}
