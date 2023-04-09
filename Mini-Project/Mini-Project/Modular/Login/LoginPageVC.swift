//
//  LoginPageVC.swift
//  Mini-Project
//
//  Created by Adji Firmansyah on 09/04/23.
//

import UIKit
import SwiftUI

class LoginPageVC: UIViewController {
    var lblEmail: UILabel = {
        var lblEmail = UILabel()
        lblEmail.text = "Email"
        lblEmail.tintColor = .systemGray
        lblEmail.font = .systemFont(ofSize: 14)
        return lblEmail
    }()
    
    var lblPassword: UILabel = {
        var lblPassword = UILabel()
        lblPassword.text = "Password"
        lblPassword.tintColor = .systemGray
        lblPassword.font = .systemFont(ofSize: 14)
        return lblPassword
    }()
    
    lazy var emailTextField: UITextField = {
        var emailTF = UITextField()
        emailTF.placeholder = "email"
        emailTF.borderStyle = .roundedRect
        emailTF.delegate = self
        emailTF.tag = 1
        return emailTF
    }()
    
    lazy var passwordTextField: UITextField = {
        var passwordTF = UITextField()
        passwordTF.placeholder = "password"
        passwordTF.borderStyle = .roundedRect
        passwordTF.delegate = self
        passwordTF.tag = 2
        return passwordTF
    }()
    
    lazy var btnLogin: UIButton = {
        var btnLogin = UIButton()
        btnLogin.setTitle("Login", for: .normal)
        //        btnLogin. = .systemFont(ofSize: 18)
        btnLogin.backgroundColor = .systemBlue
        btnLogin.tintColor = .white
        btnLogin.layer.cornerRadius = 8
        btnLogin.addTarget(self, action: #selector(onTapLogin), for: .touchUpInside)
        return btnLogin
    }()
    
    lazy var emailStackView: UIStackView = {
        var emailSV = UIStackView(arrangedSubviews: [lblEmail, emailTextField])
        emailSV.axis = .vertical
        emailSV.spacing = 0
        return emailSV
    }()
    
    lazy var passwordStackView: UIStackView = {
        var passwordSV = UIStackView(arrangedSubviews: [lblPassword, passwordTextField])
        passwordSV.axis = .vertical
        passwordSV.spacing = 0
        return passwordSV
    }()
    
    lazy var formStackView: UIStackView = {
        var formSV = UIStackView(arrangedSubviews: [emailStackView, passwordStackView])
        formSV.axis = .vertical
        formSV.spacing = 8
        return formSV
    }()
    
    lazy var loginStackView: UIStackView = {
        var loginSV = UIStackView(arrangedSubviews: [formStackView, btnLogin])
        loginSV.axis = .vertical
        loginSV.spacing = 32
        return loginSV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
    }
    
    var presenter: LoginPresenterProtocol?
    
    private func setupView() {
        setupLabel()
        setupTextField()
        setupButtnLogin()
        
        setupStackView()
    }
    
    private func setupStackView() {
        view.addSubview(loginStackView)
        loginStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            loginStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setupLabel() {

    }
    
    private func setupTextField() {
    }
    
    private func setupButtnLogin() {
        
    }
}

extension LoginPageVC: LoginViewProtocol {
    
}

extension LoginPageVC {
    @objc func onTapLogin() {
        print("CLICK LOGIN")
        presenter?.fetchLogin(
            user: UserLoginModel(
                email: emailTextField.text ?? "",
                password: passwordTextField.text ?? ""),
            nav: navigationController!)
    }
}

extension LoginPageVC: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print(textField.text)
    }
}
