//
//  AppDelegate.swift
//
//  Created by Fabrizio Rodin-Miron on 2019-07-23.
//  Copyright © 2019 Fabrizio Rodin-Miron. All rights reserved.
//

import UIKit
import Swinject
import SwinjectAutoregistration
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {

    var window: UIWindow?
    let container = Container() { container in
        // Navigation
        container.register(Navigator.self) { _ in Navigator() }.inObjectScope(.container)

        // Api
        container.register(IGlobalError.self) { _ in GlobalError() }.inObjectScope(.container)
        container.register(IApiClient.self) { r in ApiClient(errorHandler: r.resolve(IGlobalError.self)!) }.inObjectScope(.container)

        // Remote classes
        container.register(IAuthenticationRemote.self) { r in AuthenticationRemote(apiClient: r.resolve(IApiClient.self)!) }.inObjectScope(.container)

        // Repository classes
        container.register(IAuthenticationRepository.self) { r in AuthenticationRepository(remote: r.resolve(IAuthenticationRemote.self)!) }.inObjectScope(.container)

        // UseCases classes
        container.register(ILoginUseCase.self) { r in LoginUseCase(authenticationRepository: r.resolve(IAuthenticationRepository.self)!) }.inObjectScope(.container)

        // ViewModels
        container.register(HomeTabBarViewModel.self) { r in HomeTabBarViewModel() }
        container.register(ExploreViewModel.self) { r in ExploreViewModel() }
        container.register(SavedViewModel.self) { r in SavedViewModel() }
        container.register(AlertsViewModel.self) { r in AlertsViewModel() }
        container.register(ProfileViewModel.self) { r in ProfileViewModel() }

        // View Controllers
        container.autoregister(ExploreViewController.self, initializer: ExploreViewController.init)
        container.autoregister(SavedViewController.self, initializer: SavedViewController.init)
        container.autoregister(AlertsViewController.self, initializer: AlertsViewController.init)
        container.autoregister(ProfileViewController.self, initializer: ProfileViewController.init)
        container.autoregister(LoginViewController.self, initializer: LoginViewController.init)

        // Tab navigation controller
        container.autoregister(HomeTabBarController.self, initializer: HomeTabBarController.init)

    }


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        GIDSignIn.sharedInstance().clientID = "777117467633-eoh27012ll1lr3jrt5gb7gdsim826n1p.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self

        window = UIWindow()
        window?.makeKeyAndVisible()

        window?.rootViewController = container.resolve(HomeTabBarController.self)

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

    @available(iOS 9.0, *)
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        GIDSignIn.sharedInstance().handle(url)
    }


    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                print("The user has not signed in before or they have since signed out.")
            } else {
                print("\(error.localizedDescription)")
            }
            return
        }
        // Perform any operations on signed in user here.
        let userId = user.userID                  // For client-side use only!
        let idToken = user.authentication.idToken // Safe to send to the server
        let fullName = user.profile.name
        let givenName = user.profile.givenName
        let familyName = user.profile.familyName
        let email = user.profile.email
    }

    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
              withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }

}

