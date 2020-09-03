//
//  UserCell.swift
//  iChat
//
//  Created by Никита on 9/3/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import UIKit

class UserCell: UICollectionViewCell, SelfConfiguringCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        setupConstraints()
        
        self.layer.cornerRadius = 5
        
        self.layer.shadowColor = #colorLiteral(red: 0.7411764706, green: 0.7411764706, blue: 0.7411764706, alpha: 1)
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.containerUserView.layer.cornerRadius = 5
        self.containerUserView.clipsToBounds = true
    }
    
    static var reuseId: String = "UserCell"
    
    let userImageView = UIImageView()
    let userNameLabel = UILabel(text: "Nikita", font: .laoSangamMN20())
    let containerUserView = UIView()
    
    func configure<U>(with value: U) where U : Hashable {
        guard let user: MUser = value as? MUser else { return }
        
        userImageView.image = UIImage(named: user.avatarStringURL)
        userNameLabel.text = user.userName
    }
    
    private func setupConstraints() {
        
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        containerUserView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(containerUserView)
        containerUserView.addSubview(userImageView)
        containerUserView.addSubview(userNameLabel)
        
        NSLayoutConstraint.activate([
            containerUserView.topAnchor.constraint(equalTo: self.topAnchor),
            containerUserView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerUserView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerUserView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: containerUserView.topAnchor),
            userImageView.leadingAnchor.constraint(equalTo: containerUserView.leadingAnchor),
            userImageView.trailingAnchor.constraint(equalTo: containerUserView.trailingAnchor),
            userImageView.heightAnchor.constraint(equalTo: containerUserView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor),
            userNameLabel.leadingAnchor.constraint(equalTo: containerUserView.leadingAnchor, constant: 8),
            userNameLabel.trailingAnchor.constraint(equalTo: containerUserView.trailingAnchor, constant: -8),
            userNameLabel.bottomAnchor.constraint(equalTo: containerUserView.bottomAnchor)
        ])
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - SwiftUI
import SwiftUI

struct UserChatProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let tabBarVC = MainTabBarController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<UserChatProvider.ContainerView>) -> MainTabBarController {
            return tabBarVC
        }
        
        func updateUIViewController(_ uiViewController: UserChatProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<UserChatProvider.ContainerView>) {
            
        }
    }
}
