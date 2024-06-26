//
//  UserCell.swift
//  iChat
//
//  Created by Никита on 9/3/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import UIKit
import SDWebImage

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
    
    override func prepareForReuse() {
        userImageView.image = nil
    }
    
    func configure<U>(with value: U) where U : Hashable {
        guard let user: MUser = value as? MUser else { return }
        
        guard let url = URL(string: user.avatarStringURL) else { return }
        userImageView.sd_setImage(with: url, completed: nil)
        userNameLabel.text = user.userName
    }
    
    private func setupConstraints() {
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        containerUserView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(containerUserView)
        containerUserView.addSubview(userImageView)
        containerUserView.addSubview(userNameLabel)
        
        containerUserView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
        }
        
        userImageView.snp.makeConstraints { make in
            make.top.equalTo(containerUserView.snp.top)
            make.leading.equalTo(containerUserView.snp.leading)
            make.trailing.equalTo(containerUserView.snp.trailing)
            make.height.equalTo(containerUserView.snp.width)
        }

        userNameLabel.snp.makeConstraints { make in
            make.top.equalTo(userImageView.snp.bottom)
            make.leading.equalTo(containerUserView.snp.leading).offset(8)
            make.trailing.equalTo(containerUserView.snp.trailing).offset(-8)
            make.bottom.equalTo(containerUserView.snp.bottom)
        }
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
