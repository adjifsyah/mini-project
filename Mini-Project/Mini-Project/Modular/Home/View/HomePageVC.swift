//
//  HomePageVC.swift
//  Mini-Project
//
//  Created by Adji Firmansyah on 09/04/23.
//

import UIKit

class HomePageVC: UIViewController {
    var presenter: HomePresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.getListUser(nav: navigationController!)
    }
}

extension HomePageVC: HomeViewProtocol {
    func showListUser(data: [UserModel]) {
        print(data)
    }
}

extension HomePageVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}
