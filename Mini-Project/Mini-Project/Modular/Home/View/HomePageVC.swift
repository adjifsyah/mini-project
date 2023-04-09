//
//  HomePageVC.swift
//  Mini-Project
//
//  Created by Adji Firmansyah on 09/04/23.
//

import UIKit

class HomePageVC: UIViewController {
    lazy var userTableView: UITableView = {
        var tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UserCell.self, forCellReuseIdentifier: "listCell")
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    var presenter: HomePresenterProtocol?
    var dataSource: [UserModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getListUser(nav: navigationController!)
        setupView()
    }
    
    private func setupView() {
        view.addSubview(userTableView)
        setupTableView()
        setupConstraint()
    }
    
    private func setupTableView() {
        //        userTableView.dataSource = self
        //        userTableView.delegate = self
        //        userTableView.register(UserCell.self, forCellReuseIdentifier: "listCell")
    }
    
    private func setupConstraint() {
        userTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userTableView.topAnchor.constraint(equalTo: view.topAnchor),
            userTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            userTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            userTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension HomePageVC: HomeViewProtocol {
    func showListUser(data: [UserModel]) {
        DispatchQueue.main.async {
            self.dataSource = data
            self.userTableView.reloadData()
        }
    }
}

extension HomePageVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as? UserCell else { return UITableViewCell() }
        let dataUser = dataSource[indexPath.row]
        cell.configure(user: dataUser)
        return cell
    }
}
