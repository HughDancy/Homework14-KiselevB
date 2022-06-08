//
//  AppDelegate.swift
//  Homework14-KiselevB
//
//  Created by Борис Киселев on 06.06.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let tabBarController = UITabBarController()
        tabBarController.tabBar.backgroundColor = UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 0)
        
        let firstViewController = UIViewController()
        firstViewController.view.backgroundColor = .white
        firstViewController.tabBarItem = UITabBarItem(title: "Медиатека", image: UIImage(named: "Mediateca"), tag: 0)
        
        let secondViewController = UIViewController()
        secondViewController.view.backgroundColor = .white
        secondViewController.tabBarItem = UITabBarItem(title: "Для Вас", image: UIImage(named: "ForYou"), tag: 1)
        
        let thirdViewController = ViewController()
        thirdViewController.tabBarItem = UITabBarItem(title: "Альбомы", image: UIImage(named: "Albums"), tag: 2)
        
        
        let fourViewController = UIViewController()
        fourViewController.view.backgroundColor = .white
        fourViewController.tabBarItem = UITabBarItem(title: "Поиск", image: UIImage(named: "Search"), tag: 3)
        
        tabBarController.setViewControllers([
            firstViewController,
            secondViewController,
            thirdViewController,
            fourViewController
        ], animated: true)
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        return true
    }

   

}

