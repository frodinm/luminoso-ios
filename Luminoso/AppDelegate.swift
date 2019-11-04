//
//  AppDelegate.swift
//  Zuccini
//
//  Created by Fabrizio Rodin-Miron on 2019-07-23.
//  Copyright © 2019 Fabrizio Rodin-Miron. All rights reserved.
//

import UIKit
import Swinject

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let container = Container() { container in
        // Theme
        container.register(IThemeManager.self) { _ in ThemeManager() }

        // Api
        container.register(IGlobalError.self) { _ in GlobalError() }
        container.register(IApiClient.self) { r in ApiClient(errorHandler: r.resolve(IGlobalError.self)!) }

        // Remote classes
        container.register(IAuthenticationRemote.self) { r in AuthenticationRemote(apiClient: r.resolve(IApiClient.self)!) }

        // Repository classes
        container.register(IAuthenticationRepository.self) { r in AuthenticationRepository(remote: r.resolve(IAuthenticationRemote.self)!) }

        // UseCases classes
        container.register(ILoginUseCase.self) { r in LoginUseCase(authenticationRepository: r.resolve(IAuthenticationRepository.self)!) }

        // View Controllers
        container.register(ViewController.self) { r in ViewController(loginUseCase: r.resolve(ILoginUseCase.self)!, themeManager: r.resolve(IThemeManager.self)!) }

    }


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        window = UIWindow()
        window?.makeKeyAndVisible()

        container.resolve(IThemeManager.self)?.applyTheme(theme: .light)

        window?.rootViewController = container.resolve(ViewController.self)

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

