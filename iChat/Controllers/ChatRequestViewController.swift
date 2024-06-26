//
//  ChatRequestViewController.swift
//  iChat
//
//  Created by Никита on 9/4/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import UIKit
import SDWebImage

class ChatRequestViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupConstraints()
        
        denyButton.addTarget(self, action: #selector(denyButtonTapped), for: .touchUpInside)
        acceptButton.addTarget(self, action: #selector(acceptButtonTapped), for: .touchUpInside)
    }
    
    @objc private func denyButtonTapped() {
        dismiss(animated: true) {
            self.delegate?.removeWaitingChats(chat: self.chat)
        }
    }
    
    @objc private func acceptButtonTapped() {
        dismiss(animated: true) {
            self.delegate?.chatToActive(chat: self.chat)
        }
    }
    
    let profileImage = UIImageView(image: #imageLiteral(resourceName: "human7"), contentMode: .scaleAspectFill)
    let nameLabel = UILabel(text: "Peter Parker", font: .systemFont(ofSize: 20, weight: .light))
    let aboutMeLabel = UILabel(text: "You have opportunity to start a new chat!", font: .systemFont(ofSize: 15, weight: .light))
    let acceptButton = UIButton(title: "ACCEPT", titleColor: .white, backgroundColor: .black, font: .laoSangamMN20(), isShadow: false, cornerRadius: 10)
    let denyButton = UIButton(title: "Deny", titleColor: #colorLiteral(red: 0.8352941176, green: 0.2, blue: 0.2, alpha: 1), backgroundColor: .mainWhite(), font: .laoSangamMN20(), isShadow: false, cornerRadius: 10)
    let containerView = UIView()
    
    weak var delegate: WaitingChatsNavigation?
    
    private var chat: MChat!
    init(chat: MChat) {
        self.chat = chat
        self.profileImage.sd_setImage(with: URL(string: chat.friendImageString), completed: nil)
        self.nameLabel.text = chat.friendUserName
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ChatRequestViewController {
    private func setupConstraints() {
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutMeLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false

        containerView.backgroundColor = .mainWhite()
        containerView.layer.cornerRadius = 30
        denyButton.layer.borderWidth = 1.5
        
        view.addSubview(profileImage)
        view.addSubview(containerView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(aboutMeLabel)
        
        let buttonsStackView = UIStackView(arrangedSubviews: [acceptButton, denyButton], axis: .horizontal, spacing: 7)
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(buttonsStackView)

        profileImage.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.bottom.equalTo(view.snp.bottom)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
        }

        containerView.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
            make.height.equalTo(206)
        }

        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).offset(35)
            make.leading.equalTo(containerView.snp.leading).offset(25)
            make.trailing.equalTo(containerView.snp.trailing).offset(-25)
        }

        aboutMeLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.leading.equalTo(containerView.snp.leading).offset(25)
            make.trailing.equalTo(containerView.snp.trailing).offset(-25)
        }

        buttonsStackView.snp.makeConstraints { make in
            make.top.equalTo(aboutMeLabel.snp.bottom).offset(25)
            make.leading.equalTo(containerView.snp.leading).offset(25)
            make.trailing.equalTo(containerView.snp.trailing).offset(-25)
            make.height.equalTo(60)
        }
    }
}

