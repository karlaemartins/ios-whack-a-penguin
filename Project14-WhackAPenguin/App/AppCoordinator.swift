//
//  AppCoordinator.swift
//  Project14-WhackAPenguin
//
//  Created by Karla E. Martins Fernandes on 02/07/26.
//

import UIKit

final class AppCoordinator {
    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let gameViewController = GameViewController()
        window.rootViewController = gameViewController
        window.makeKeyAndVisible()
    }
}
