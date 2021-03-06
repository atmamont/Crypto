//
//  AppDelegate.swift
//  Crypto
//
//  Created by Andrey Mamchenko on 12/6/17.
//  Copyright © 2017 Andrey Mamchenko. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var applicationRouter: ApplicationRouter?
    var rootVC = UINavigationController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        setupWindow()
        startApplicationFlow()
        
        return true
    }
    
    fileprivate func setupWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = rootVC
        window?.makeKeyAndVisible()
    }

    fileprivate func startApplicationFlow() {
        let applicationRouter = ApplicationRouter(withNavigationController: rootVC)
        applicationRouter.startAppFlow()
        self.applicationRouter = applicationRouter
    }

    
}

