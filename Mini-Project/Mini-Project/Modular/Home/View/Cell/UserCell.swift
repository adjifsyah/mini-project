//
//  UserCell.swift
//  Mini-Project
//
//  Created by Adji Firmansyah on 09/04/23.
//

import UIKit

class UserCell: UITableViewCell {
    lazy var imgUser: UIImageView = {
        var imgUser = UIImageView()
        imgUser.contentMode = .scaleAspectFill
        return imgUser
    }()
    
    lazy var lblFullname: UILabel = {
        var lblFullname = UILabel()
        lblFullname.textColor = .black
        lblFullname.tintColor = .red
        lblFullname.font = .systemFont(ofSize: 18, weight: .bold)
        return lblFullname
    }()
    
    lazy var lblEmail: UILabel = {
        var lblFullname = UILabel()
        lblFullname.textColor = .black
        lblFullname.tintColor = .red
        lblFullname.font = .systemFont(ofSize: 14)
        
        return lblFullname
    }()
    
    lazy var SVUserInfo: UIStackView = {
        var SVUserInfo = UIStackView(arrangedSubviews: [lblFullname, lblEmail])
        SVUserInfo.axis = .vertical
        SVUserInfo.spacing = 0
        return SVUserInfo
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    func configure(user: UserModel) {
        imgUser.downloaded(from: user.imageUrl)
        lblEmail.text = user.email
        lblFullname.text = user.fullName
    }
    
    private func setupView() {
        self.addSubview(imgUser)
        self.addSubview(SVUserInfo)
        setupConstraint()
    }
    
    private func setupConstraint() {
        imgUser.translatesAutoresizingMaskIntoConstraints = false
        SVUserInfo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imgUser.heightAnchor.constraint(equalToConstant: 64),
            imgUser.widthAnchor.constraint(equalToConstant: 64),
            
            imgUser.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            imgUser.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            imgUser.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            imgUser.trailingAnchor.constraint(equalTo: SVUserInfo.leadingAnchor, constant: -10),
            
            SVUserInfo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            SVUserInfo.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            SVUserInfo.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
