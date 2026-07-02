//
//  AppDelegate.swift
//  Project14-WhackAPenguin
//
//  Created by Karla E. Martins Fernandes on 30/06/26.
//

import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    private var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let appCoordinator = AppCoordinator(window: window)

        self.window = window
        self.appCoordinator = appCoordinator

        appCoordinator.start()

        return true
    }
}
