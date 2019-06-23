//
//  BaseTabBarController.swift
//  Tesla Mood
//
//  Created by Samuel Joseph on 6/23/19.
//  Copyright © 2019 Samuel Joseph. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            createNavController(viewController:UIViewController(),title:"Tesla Mood",imageName: ""),
            createNavController(viewController:UIViewController(),title:"Tesla News",imageName: "")
            
            
        ]
     
    }
    
    fileprivate func createNavController(viewController:UIViewController,title:String,imageName:String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        
        navController.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .white
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named:imageName)
        
        return navController
    }
    

}
