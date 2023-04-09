//
//  HomePresenterProtocol.swift
//  Mini-Project
//
//  Created by Adji Firmansyah on 09/04/23.
//

import UIKit

protocol HomePresenterProtocol {
    func getListUser(nav: UINavigationController)
    func successGetUser(data: [UserModel])
    func failureGetuser()
}
