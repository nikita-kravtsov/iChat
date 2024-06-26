//
//  AddPhotoView.swift
//  iChat
//
//  Created by Никита on 8/24/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import UIKit

class AddPhotoView: UIView {
    
    override init(frame: CGRect) {
           super.init(frame: frame)
        
        self.addSubview(circleImageView)
        self.addSubview(plusButton)
        setupConstraints()
       }
    
    let circleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "avatar")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1
        
        return imageView
    }()
    
    let plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        let buttonImage = #imageLiteral(resourceName: "plus")
        button.setImage(buttonImage, for: .normal)
        button.tintColor = .buttonDark()
        
        return button
    }()
    
    private func setupConstraints() {
        circleImageView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(0)
            make.leading.equalTo(self.snp.leading).offset(0)
            make.height.equalTo(100)
            make.width.equalTo(100)
        }

        plusButton.snp.makeConstraints { make in
            make.leading.equalTo(circleImageView.snp.trailing).offset(16)
            make.height.equalTo(30)
            make.width.equalTo(30)
            make.centerY.equalTo(self.snp.centerY)
        }
        
        self.snp.makeConstraints { make in
            make.bottom.equalTo(circleImageView.snp.bottom)
            make.trailing.equalTo(plusButton.snp.trailing)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        circleImageView.layer.masksToBounds = true
        circleImageView.layer.cornerRadius = circleImageView.frame.width / 2
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
