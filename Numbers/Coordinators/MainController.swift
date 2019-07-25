//
//  MainController.swift
//  Numbers
//
//  Created by stager on 24/07/2019.
//  Copyright © 2019 sbs. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var rootViewController: UIViewController {
        return tabBarController
    }
    
    let tabBarController: UITabBarController
    let dataStore: FormattedNumbersStore
    
    let allListCoordinator: AllListCoordinator
    let favoriteListCoordinator: FavoriteListCoordinator
    let graphCoordinator: GraphCoordinator
    
    init(){
        let tabBarController = UITabBarController()
        
        self.tabBarController = tabBarController
        self.dataStore = FormattedNumbersStore()
        
        //let allListNavigationController = UINavigationController()
        self.allListCoordinator = AllListCoordinator.init(data: self.dataStore)
        self.favoriteListCoordinator = FavoriteListCoordinator.init(data: self.dataStore)
        self.graphCoordinator = GraphCoordinator.init(data: self.dataStore)
        
        self.allListCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "allList", image: nil, tag: 0)
        self.favoriteListCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "favoriteList", image: nil, tag: 1)
        self.graphCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "graph", image: nil, tag: 2)
        
        tabBarController.viewControllers = [self.allListCoordinator.rootViewController, self.favoriteListCoordinator.rootViewController, self.graphCoordinator.rootViewController]
        
    }
    
    func start() {
        //self.allListCoordinator.start()
        
    }
    
    
    
}
