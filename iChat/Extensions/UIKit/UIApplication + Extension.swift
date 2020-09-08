//
//  UIApplication + Extension.swift
//  iChat
//
//  Created by Никита on 9/9/20.
//  Copyright © 2020 Никита. All rights reserved.
//

import UIKit
//This func getTopViewController helps us show "showAlert" on AuthViewController and LoginViewController
extension UIApplication {
    class func getTopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
           
           if let nav = base as? UINavigationController {
               return getTopViewController(base: nav.visibleViewController)
               
           } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
               return getTopViewController(base: selected)
               
           } else if let presented = base?.presentedViewController {
               return getTopViewController(base: presented)
           }
           return base
       }
}
