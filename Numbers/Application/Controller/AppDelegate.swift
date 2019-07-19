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
    var mainViewController: UIViewController?
    let defaults = UserDefaults.standard
    
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let data = FormattedNumbersStore.init()
        self.data = data
        
        let navigationController = self.window?.rootViewController as? UINavigationController
       
        let destVC = navigationController?.viewControllers[0] as? NumbersViewController
        mainViewController = destVC
        
        destVC?.selectedUIView = true
        destVC?.dataWithColorNumbers = self.data!
        
        guard let newproduct = defaults.object(forKey: "loveNumbers") as? Data else { return true}
        let string1 = String(data: newproduct, encoding: String.Encoding.utf8)
        print(string1!)
        let endproduct = try! JSONDecoder().decode([FormattedNumber].self, from: newproduct)
        self.data!.loveNumbers = endproduct
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        let destinationViewController = mainViewController as? NumbersViewController        
        let product = try? JSONEncoder().encode(destinationViewController?.dataWithColorNumbers.loveNumbers!)
        defaults.set(product, forKey: "loveNumbers")
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        //let destinationViewController = mainViewController as? NumbersViewController
        guard let newproduct = defaults.object(forKey: "loveNumbers") as? Data else { return }
        let string1 = String(data: newproduct, encoding: String.Encoding.utf8)
        print(string1!)
        let endproduct = try! JSONDecoder().decode([FormattedNumber].self, from: newproduct)
        self.data!.loveNumbers = endproduct
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

