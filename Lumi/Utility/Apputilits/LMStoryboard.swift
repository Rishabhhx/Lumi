//
//  LMStoryboard.swift
//  Lumi
//
//  Created by Rishabh Sharma on 27/04/22.
//

import Foundation
import UIKit
enum LMStoryboard : String {

    case main = "PreLogin"
    case home = "Home"
    case menu = "Menu"
    case myProfile = "MyProfile"
}
extension LMStoryboard {

    var shared : UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }

    // MARK: - Creating intial view controller
    func viewController<T : UIViewController>(_ viewControllerClass : T.Type,
                                              function : String = #function,
                                              line : Int = #line,
                                              file : String = #file) -> T {

        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID

        guard let scene = shared.instantiateViewController(withIdentifier: storyboardID) as? T else {
            fatalError("ViewController with identifier \(storyboardID), not found in \(self.rawValue) Storyboard.\nFile : \(file) \nLine Number : \(line) \nFunction : \(function)")
        }

        return scene
    }

    var initialViewController : UIViewController? {
        return shared.instantiateInitialViewController()
    }
}
