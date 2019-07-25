//
//  AppDelegate.swift
//  Numbers
//
//  Created by stager on 12/07/2019.
//  Copyright © 2019 sbs. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var data: FormattedNumbersStore?
    
    var coordinator: MainCoordinator?
    
    
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.data = FormattedNumbersStore.init()
        
        
        /*let tabBarController = self.window?.rootViewController as? UITabBarController
        let navigationControllerAll = tabBarController!.customizableViewControllers![0] as? UINavigationController
        let destVCAll = navigationControllerAll?.viewControllers[0] as? NumbersViewController
        //destVCAll?.tabBarItem.
        
        allListViewModel.dataWithColorNumbers = self.data
        allListViewModel.selectedUIView = true
        allListViewModel.delegate = destVCAll!
        destVCAll?.viewModel = allListViewModel
        
        let navigationControllerFavorite = tabBarController!.customizableViewControllers![1] as? UINavigationController
        let destVCFavorite = navigationControllerFavorite?.viewControllers[0] as? NumbersViewController
        
        favoriteViewModel.dataWithColorNumbers = self.data
        favoriteViewModel.selectedUIView = true
        favoriteViewModel.delegate = destVCFavorite!
        destVCFavorite?.viewModel = favoriteViewModel*/
        
        // create the main navigation controller to be used for our app
        
        
        // send that into our coordinator so that it can display view controllers
        coordinator = MainCoordinator()
        
        // tell the coordinator to take over control
 
        
        // create a basic UIWindow and activate it
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = coordinator?.rootViewController
        window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        self.data?.saveFavoriteNumbers()
        
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        //let destinationViewController = mainViewController as? NumbersViewController
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

