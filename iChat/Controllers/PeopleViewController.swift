//
//  PeopleViewController.swift
//  iChat
//
//  Created by Никита on 8/29/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import UIKit

class PeopleViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchBar()
    }
    
    // MARK: - Setup SearchBar
      private func setupSearchBar() {
          navigationController?.navigationBar.barTintColor = .mainWhite()
          navigationController?.navigationBar.shadowImage = UIImage()
          
          let searchController = UISearchController(searchResultsController: nil)
          navigationItem.searchController = searchController
          navigationItem.hidesSearchBarWhenScrolling = false
          searchController.obscuresBackgroundDuringPresentation = false
          searchController.hidesNavigationBarDuringPresentation = false
          searchController.searchBar.delegate = self
      }
}

// MARK: - UISearchBarDelegate
  extension PeopleViewController: UISearchBarDelegate {
      func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
          print(searchText)
      }
  }
//MARK: - SwiftUI Canvas
import SwiftUI
struct PeopleVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let tabBarVC = MainTabBarController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<PeopleVCProvider.ContainerView>) -> MainTabBarController {
            return tabBarVC
        }
        
        func updateUIViewController(_ uiViewController: PeopleVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<PeopleVCProvider.ContainerView>) {
            
        }
    }
}


