//
//  AppDelegate.swift
//  Listing
//
//  Created by Mohammad on 16/01/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let viewModel = ProductListViewModel(NetworkRepository(decoder))
        let viewController = ProductListViewController(viewModel)
        self.window?.rootViewController = viewController
        self.window?.makeKeyAndVisible()
        return true
    }
}

