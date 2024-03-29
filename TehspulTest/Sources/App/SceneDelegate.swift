//
//  SceneDelegate.swift
//  TehspulTest
//
//  Created by Роман Глухарев on 1.01.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let viewController = StartViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
    
        window?.rootViewController = navigationController
        
        window?.makeKeyAndVisible()
    }
}

