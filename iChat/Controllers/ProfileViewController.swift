//
//  ProfileViewController.swift
//  iChat
//
//  Created by Никита on 9/4/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import UIKit
import SDWebImage

class ProfileViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConstraints()
    }
    
    private let user: MUser
    init(user: MUser) {
        self.user = user
        self.nameLabel.text = user.userName
        self.aboutMeLabel.text = user.description
        self.profileImage.sd_setImage(with: URL(string: user.avatarStringURL), completed: nil)
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let profileImage = UIImageView(image: #imageLiteral(resourceName: "human7"), contentMode: .scaleAspectFill)
    let nameLabel = UILabel(text: "Peter Parker", font: .systemFont(ofSize: 20, weight: .light))
    let aboutMeLabel = UILabel(text: "My name is Peter. I am film director!", font: .systemFont(ofSize: 15, weight: .light))
    let textField = InsertableTextField()
    let containerView = UIView()
    
    @objc func sendMessage() {
        guard let message = textField.text, message != "" else { return }
        
        self.dismiss(animated: true) {
            FirestoreService.shared.createWaitingChat(message: message, receiver: self.user) { (result) in
                switch result {
                    
                case .success():
                    UIApplication.getTopViewController()?.showAlert(withTitle: "Ваше сообщение", andMessage: "отправлено другу \(self.user.userName)!")
                case .failure(_):
                    UIApplication.getTopViewController()?.showAlert(withTitle: "Ошибка!", andMessage: "Сообщение не отправлено")
                }
            }
        }
    }
}

// MARK: - Setup Constraints
extension ProfileViewController {
    private func setupConstraints() {
        
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutMeLabel.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.layer.cornerRadius = 30
        containerView.backgroundColor = .mainWhite()
        aboutMeLabel.numberOfLines = 0
        textField.borderStyle = .roundedRect
        
        
        if let button = textField.rightView as? UIButton {
            button.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
        }
        
        
        
        view.addSubview(profileImage)
        view.addSubview(containerView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(aboutMeLabel)
        containerView.addSubview(textField)
        
        
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: view.topAnchor),
            profileImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            profileImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileImage.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 206)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 35),
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 25),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -25)
        ])
        
        NSLayoutConstraint.activate([
            aboutMeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            aboutMeLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 25),
            aboutMeLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -25)
        ])
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: aboutMeLabel.bottomAnchor, constant: 8),
            textField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 25),
            textField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -25),
            textField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}



