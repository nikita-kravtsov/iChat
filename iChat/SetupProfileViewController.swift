//
//  SetupProfileViewController.swift
//  iChat
//
//  Created by Никита on 8/24/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import UIKit

class SetupProfileViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupConstraints()
    }
    
    let fullImageView = AddPhotoView()
}

extension SetupProfileViewController {
    private func setupConstraints() {
        
        fullImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(fullImageView)
        
        NSLayoutConstraint.activate([
            fullImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            fullImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
}

//MARK: - SwiftUI Canvas
import SwiftUI
struct SetupProfileVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let setupProfileVC = SetupProfileViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<SetupProfileVCProvider.ContainerView>) -> SetupProfileViewController {
            return setupProfileVC
        }
        
        func updateUIViewController(_ uiViewController: SetupProfileVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<SetupProfileVCProvider.ContainerView>) {
            
        }
    }
}
