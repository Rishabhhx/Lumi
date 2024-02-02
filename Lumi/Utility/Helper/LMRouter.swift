//
//  LMRouter.swift
//  Lumi
//
//  Created by Rishabh Sharma on 05/05/22.
//

import Foundation
import UIKit

struct LMRouter {

    // MARK: - Function to check app initialization flow
    static func checkAppinitalizationFlow() {
        if UserDefaults.standard.object(forKey: UserDefaultVar.status.rawValue) as? String == "Login Done" {
            rootToHomeScreen()
        } else if UserDefaults.standard.object(forKey: UserDefaultVar.loginType.rawValue) as? String == "Created Successfully" {
            moveProfileScreen()
        } else if  UserDefaults.standard.object(forKey: UserDefaultVar.loginType.rawValue) as? String == "Log In Successful" {
            moveToHomeScreen()
        } else {
            loadPreloginScreen()
        }
    }

    // MARK: - Function to root to prelogin screen
    static func loadPreloginScreen() {
        let landingScene = LMWelcomeScreenVC.instantiate(fromAppStoryboard: .main)
        let navigationController = UINavigationController(rootViewController: landingScene)
        setRoot(viewController: navigationController)
    }
    // MARK: - Function to move to prelogin screen
    static func moveProfileScreen() {
        let landingScene = LMCreateNewAccountVC.instantiate(fromAppStoryboard: .main)
        let navigationController = UINavigationController(rootViewController: landingScene)
        setRoot(viewController: navigationController)
    }

    // MARK: - Function to root to Menu Home Screen
    static func rootToHomeScreen() {
        let landingScene = LMHomeVC.instantiate(fromAppStoryboard: .home)
        let navigationController = UINavigationController(rootViewController: landingScene)
        setRoot(viewController: navigationController)
    }
    // MARK: - Function to move to Menu Home Screen
    static func moveToHomeScreen() {
//        moveToHomeVC?()
        let landingScene = LMHomeVC.instantiate(fromAppStoryboard: .home)
        let navigationController = UINavigationController(rootViewController: landingScene)
        setRoot(viewController: navigationController)
    }

    // MARK: - Function to set root view controller
    static func setRoot(viewController : UIViewController) {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let sceneDelegate = windowScene.delegate as? SceneDelegate
        else {
            return
        }
        sceneDelegate.window?.rootViewController = viewController
        sceneDelegate.window?.makeKeyAndVisible()
    }
}
