//
//  ViewController.swift
//  iChat
//
//  Created by Никита on 8/20/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import UIKit
import GoogleSignIn

class AuthViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        googleButton.customizeGoogleButton()
        view.backgroundColor = .white
        setupConstraints()
        
        emailButton.addTarget(self, action: #selector(emailButtonTapped), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        googleButton.addTarget(self, action: #selector(googleButtonTapped), for: .touchUpInside)
        
        signUpVC.delegate = self
        loginVC.delegate = self
        
        GIDSignIn.sharedInstance()?.delegate = self
    }
    
    let signUpVC = SignUpViewController()
    let loginVC = LoginViewController()
    
    @objc private func emailButtonTapped() {
        present(signUpVC, animated: true, completion: nil)
    }
    @objc private func loginButtonTapped() {
        present(loginVC, animated: true, completion: nil)
    }
    @objc private func googleButtonTapped() {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()
    }
    
    let logoImageView = UIImageView(image: #imageLiteral(resourceName: "Logo"), contentMode: .scaleAspectFit)
    
    let googleLabel = UILabel(text: "Get started with")
    let emailLabel = UILabel(text: "Or sigh up with")
    let loginLabel = UILabel(text: "Already onboard?")
    
    let googleButton = UIButton(title: "Google", titleColor: .black, backgroundColor: .white, isShadow: true)
    let emailButton = UIButton(title: "Email", titleColor: .white, backgroundColor: .buttonDark())
    let loginButton = UIButton(title: "Login", titleColor: .buttonRed(), backgroundColor: .white, isShadow: true )

}

extension AuthViewController: AuthNavigatingDelegate {
    func toSignUpVC() {
        present(signUpVC, animated: true, completion: nil)
    }
    
    func toLoginVC() {
        present(loginVC, animated: true, completion: nil)
    }
}

//MARK: - Setup Constraints for logo and stackView
extension AuthViewController {
    private func setupConstraints() {
        
        let googleView = ButtomView(label: googleLabel, buttom: googleButton)
        let emailView = ButtomView(label: emailLabel, buttom: emailButton)
        let loginView = ButtomView(label: loginLabel, buttom: loginButton)
        
        let stackView = UIStackView(arrangedSubviews: [googleView, emailView, loginView], axis: .vertical, spacing: 40)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(logoImageView)
        view.addSubview(stackView)
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 160),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
}

//MARK: - extension GIDSignInDelegate
extension AuthViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        AuthService.shared.googleLogin(user: user, error: error) { (result) in
            switch result {
                
            case .success(let user):
                FirestoreService.shared.getUserData(user: user) { (result) in
                    switch result {
                        
                    case .success(let mUser):
                        UIApplication.getTopViewController()?.showAlert(withTitle: "Вы успешно", andMessage: "авторизировались!") {
                            let mainTabBarController = MainTabBarController(currentUser: mUser)
                            mainTabBarController.modalPresentationStyle = .fullScreen
                            UIApplication.getTopViewController()?.present(mainTabBarController, animated: true, completion: nil)
                        }
                    case .failure(_):
                        UIApplication.getTopViewController()?.showAlert(withTitle: "Вы успешно", andMessage: "зарегестрировались!") {
                            UIApplication.getTopViewController()?.present(SetupProfileViewController(currentUser: user), animated: true, completion: nil)
                        }
                    }
                }
            case .failure(let error):
                self.showAlert(withTitle: "Ошибка!", andMessage: error.localizedDescription)
            }
        }
    }
}


//MARK: - SwiftUI Canvas
import SwiftUI
struct AuthVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = AuthViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<AuthVCProvider.ContainerView>) -> AuthViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: AuthVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<AuthVCProvider.ContainerView>) {
            
        }
    }
}
