//
//  SignUpViewController.swift
//  iChat
//
//  Created by Никита on 8/23/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupConstraints()
    }
    
    let welcomLabel = UILabel(text: "Hello!", font: .avenir26())
    
    let emailLabel = UILabel(text: "Email")
    let passwordLabel = UILabel(text: "Password")
    let confirmPasswordLabel = UILabel(text: "Confirm password")
    let alreadyOnboard = UILabel(text: "Already onboard?")
    
    let emailTextField = OneLineTextField(font: .avenir20())
    let passwordTextField = OneLineTextField(font: .avenir20())
    let confirmPasswordTextField = OneLineTextField(font: .avenir20())
    
    let signUpButtom = UIButton(title: "Sign Up", titleColor: .white, backgroundColor: .buttonDark(), cornerRadius: 4)
    let loginButtom = UIButton(title: "Login", titleColor: .buttonRed(), backgroundColor: .white)
}

extension SignUpViewController {
    private func setupConstraints() {
        
        let emailStackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField], axis: .vertical, spacing: 0)
        let passwordStackView = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField], axis: .vertical, spacing: 0)
        let confirmPasswordStackView = UIStackView(arrangedSubviews: [confirmPasswordLabel, confirmPasswordTextField], axis: .vertical, spacing: 0)
        signUpButtom.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [emailStackView, passwordStackView, confirmPasswordStackView, signUpButtom], axis: .vertical, spacing: 40)
       
        let loginStackView = UIStackView(arrangedSubviews: [alreadyOnboard, loginButtom], axis: .horizontal, spacing: -1)
       
        
        welcomLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        loginStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(welcomLabel)
        view.addSubview(stackView)
        view.addSubview(loginStackView)
        
        NSLayoutConstraint.activate([
                   welcomLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
                   welcomLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
               ])
        
        NSLayoutConstraint.activate([
                   stackView.topAnchor.constraint(equalTo: welcomLabel.bottomAnchor, constant: 160),
                   stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
                   stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
               ])
        
        NSLayoutConstraint.activate([
                   loginStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 60),
                   loginStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
                   loginStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
               ])
    }
}

//MARK: - SwiftUI Canvas
import SwiftUI
struct SignUpVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let signUpVC = SignUpViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<SignUpVCProvider.ContainerView>) -> SignUpViewController {
            return signUpVC
        }
        
        func updateUIViewController(_ uiViewController: SignUpVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<SignUpVCProvider.ContainerView>) {
            
        }
    }
}

