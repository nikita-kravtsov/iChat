//
//  WaitingChatCell.swift
//  iChat
//
//  Created by Никита on 9/2/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import UIKit
import SDWebImage

class WaitingChatCell: UICollectionViewCell, SelfConfiguringCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConstraints()
        
        self.backgroundColor = .red
        
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
    }
    
    static var reuseId: String = "WaitingChatCell"
    
    private let friendImageView = UIImageView()
    
    func configure<U>(with value: U) where U : Hashable {
        guard let chat: MChat = value as? MChat else { return }
        friendImageView.sd_setImage(with: URL(string: chat.friendImageString), completed: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Constraints
extension WaitingChatCell {
    private func setupConstraints() {
        
        friendImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(friendImageView)
        
        friendImageView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
        }
    }
}


// MARK: - SwiftUI
import SwiftUI

struct WaitingChatProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let tabBarVC = MainTabBarController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<WaitingChatProvider.ContainerView>) -> MainTabBarController {
            return tabBarVC
        }
        
        func updateUIViewController(_ uiViewController: WaitingChatProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<WaitingChatProvider.ContainerView>) {
            
        }
    }
}
