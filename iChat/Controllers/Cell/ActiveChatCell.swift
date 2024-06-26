//
//  ActiveChatCell.swift
//  iChat
//
//  Created by Никита on 9/1/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import UIKit

class ActiveChatCell: UICollectionViewCell, SelfConfiguringCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        setupConstraints()
    }
    static var reuseId: String = "ActiveChatCell"
    
    var friendName = UILabel(text: " ", font: .laoSangamMN20())
    var lastMessage = UILabel(text: " ", font: .laoSangamMN18())
    var friendImageView = UIImageView()
    var gradientView = GradientView(from: .topTrailing,
                                    to: .bottomLeading,
                                    startColor: #colorLiteral(red: 0.7882352941, green: 0.631372549, blue: 0.9411764706, alpha: 1),
                                    finishColor: #colorLiteral(red: 0.4784313725, green: 0.6980392157, blue: 0.9215686275, alpha: 1))
    
    func configure<U>(with value: U) where U : Hashable {
        guard let chat: MChat = value as? MChat else { return }
        friendName.text = chat.friendUserName
        lastMessage.text = chat.friendLastMessage
        friendImageView.sd_setImage(with: URL(string: chat.friendImageString), completed: nil)
        
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Constraints
extension ActiveChatCell {
    private func setupConstraints() {
        
        friendName.translatesAutoresizingMaskIntoConstraints = false
        lastMessage.translatesAutoresizingMaskIntoConstraints = false
        friendImageView.translatesAutoresizingMaskIntoConstraints = false
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(friendName)
        self.addSubview(lastMessage)
        self.addSubview(friendImageView)
        self.addSubview(gradientView)
        
        friendImageView.backgroundColor = .orange
        gradientView.backgroundColor = .black
        
        friendImageView.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading)
            make.centerY.equalTo(self.snp.centerY)
            make.width.equalTo(78)
            make.height.equalTo(78)
        }
        
        friendName.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(12)
            make.leading.equalTo(friendImageView.snp.trailing).offset(16)
            make.trailing.equalTo(gradientView.snp.leading).offset(16)
        }
 
        lastMessage.snp.makeConstraints { make in
            make.bottom.equalTo(self.snp.bottom).offset(-12)
            make.leading.equalTo(friendImageView.snp.trailing).offset(16)
            make.trailing.equalTo(gradientView.snp.leading).offset(16)
        }
 
        gradientView.snp.makeConstraints { make in
            make.trailing.equalTo(self.snp.trailing)
            make.centerY.equalTo(self.snp.centerY)
            make.width.equalTo(8)
            make.height.equalTo(78)
        }
    }
}

// MARK: - SwiftUI
import SwiftUI

struct ActiveChatProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let tabBarVC = MainTabBarController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ActiveChatProvider.ContainerView>) -> MainTabBarController {
            return tabBarVC
        }
        
        func updateUIViewController(_ uiViewController: ActiveChatProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ActiveChatProvider.ContainerView>) {
            
        }
    }
}
